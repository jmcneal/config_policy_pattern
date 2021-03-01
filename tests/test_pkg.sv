`ifndef __TEST_PKG_SV__
`define __TEST_PKG_SV__

package test_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "base_test.sv"
    `include "base_car_test.sv"
    `include "base_car_with_default_pcy_test.sv"
    `include "policy_test.sv"

    `include "random_car_test.sv"

endpackage : test_pkg
`endif // __TEST_PKG_SV__
