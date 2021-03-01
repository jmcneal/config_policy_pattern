`ifndef __TEST_PKG_SV__
`define __TEST_PKG_SV__

package test_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "base_test.sv"
    `include "base_car_test.sv"
    `include "base_car_with_default_pcy_test.sv"

    `include "american_manual_4dr_test.sv"
    `include "american_midwest_no_repairs_test.sv"
    `include "american_midwest_test.sv"
    `include "american_northwest_no_repairs_test.sv"
    `include "midwest_test.sv"
    `include "random_car_test.sv"
    `include "remove_default_test.sv"

endpackage : test_pkg
`endif // __TEST_PKG_SV__
