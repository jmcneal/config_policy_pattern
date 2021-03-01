#!/bin/sh
# =============================================================================
# @brief  basic run script for policy tests using Cadence IUS
# @author Kevin Vasconcellos, Mark Litterick, Verilab (www.verilab.com)
# =============================================================================

# This is a simple example script to run a simulation
  usage() {
    echo ""
    echo "Usage: $(basename $0) TESTNAME [-g(ui)] [-c(overage)] [-s(eed) SVSEED] [-v(erbose)] [-h(elp)] "
  }

  help() {
    usage
    echo ""
    echo "  - run specified test"
    echo ""
    echo "Options:"
    echo "  -g(ui)            - GUI"
    echo "  -c(over)          - COVERAGE"
    echo "  -s(eed) SVSEED    - non-random SVSEED"
    echo "  -v(erbose)        - UVM_HIGH"
    echo "  -d(ebug)          - UVM_DEBUG"
    echo "  -h(elp)           - print this message"
    echo ""
  }

# prepare by processing command-line options:

  # Default values for the various command-line options.
  # These variables are all named OPT_XXXXX and are never subsequently altered

    OPT_TESTNAME="undefined"
    OPT_GUI=0
    OPT_COV=0
    OPT_SEED=0
    OPT_VERBOSE=0
    OPT_DBG=0
    OPT_SVSEED=1

    OPT_SIM=""

  # Decode command-line options, allowing wildcard variations, error if invalid
    while [ $# -gt 0 ]; do
      opt=${1/#--/-}
      case "$opt" in
        -g*)      OPT_GUI=1;;
        -c*)      OPT_COV=1;;
        -s*)      OPT_SEED=1; OPT_SVSEED=$2; shift;;
        -v*)      OPT_VERBOSE=1;;
        -d*)      OPT_DBG=1;;
        -h*)      help; exit 0;;
        -*)       usage ; echo "Error: unknown option/argument $1" ; exit 1;;
        *test*)   OPT_TESTNAME=$1;;
      esac
      shift
    done

    if [ "OPT_TESTNAME" = "undefined" ]; then
      usage >&2
      echo "Error: test file must be specified"
      exit 1
    fi

# process command-line options

  if [ $OPT_GUI == 1 ]; then
    OPT_SIM=" -gui -ida -linedebug -input ../bin/sim_gui.tcl "
  else
    OPT_SIM=" -linedebug -input ../bin/sim_nogui.tcl "
  fi

  if [ $OPT_COV == 1 ]; then
    OPT_SIM="$OPT_SIM -coverage all -covoverwrite -covtest $OPT_TESTNAME "
#    OPT_SIM="$OPT_SIM -coverage functional -covoverwrite -covtest $OPT_TESTNAME "
  fi

  if [ $OPT_SEED == 1 ]; then
    OPT_SIM="$OPT_SIM -svseed $OPT_SVSEED "
  else
    OPT_SIM="$OPT_SIM -svseed random "
  fi

  if [ $OPT_VERBOSE == 1 ]; then
    OPT_SIM="$OPT_SIM +UVM_VERBOSITY=UVM_HIGH "
  fi

  if [ $OPT_DBG == 1 ]; then
    OPT_SIM="$OPT_SIM +UVM_VERBOSITY=UVM_DEBUG "
  fi

  # Go down one more level from MODEL_ROOT to build & run
  PATH_PREFIX="."

# compile, elaborate and simulate

toolenv cadence-ius--18.09.005 xrun \
    -uvmhome /tools/cadence-ius/18.09.005/tools/methodology/UVM/CDNS-1.2 \
    +incdir+$PATH_PREFIX/../src/policy_base \
    +incdir+$PATH_PREFIX/../src/sv \
    +incdir+$PATH_PREFIX/../src/tb \
    +incdir+$PATH_PREFIX/../tests \
    $PATH_PREFIX/../src/policy_base/policy_base_pkg.sv \
    $PATH_PREFIX/../src/sv/example_car_pkg.sv \
    $PATH_PREFIX/../tests/test_pkg.sv \
    $PATH_PREFIX/../src/tb/tb_top.sv \
    -nowarn BADPRF \
    -nowarn MRSTAR \
    -nowarn NOTLRM \
    -nowarn CUVIHR \
    -define UVM_REPORT_DISABLE_FILE_LINE \
    -define SVA_ON \
    +UVM_NO_RELNOTES \
    -vtimescale "1 ns / 1 ps"  \
    -licqueue \
    $OPT_SIM \
    +UVM_TESTNAME=$OPT_TESTNAME

#    $PATH_PREFIX/../src/tb/policy_test.sv \

# +UVM_CONFIG_DB_TRACE \


if ! ../bin/analyze.pl -quiet xrun.log; then
  echo "[$OPT_TESTNAME]:    FAIL"
else
  echo "[$OPT_TESTNAME]:    PASS"
fi
echo " "
