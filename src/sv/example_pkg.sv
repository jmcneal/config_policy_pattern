`ifndef __EXAMPLE_PKG_SV__
`define __EXAMPLE_PKG_SV__

package example_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    import policy_base_pkg::*;

    typedef enum {chevy, ford, cadillac, honda, lexus, vw, mercedes, rover, tesla, porsche} car_make_t;
    typedef enum {AUTOMATIC, MANUAL} transmission_t;
     
    typedef class test_config;
    typedef policy_base#(test_config) test_cfg_policy_base;
    typedef policy_list#(test_config) test_cfg_policy_list;

    `include "enable_headlights_pcy.sv"
    `include "disable_headlights_pcy.sv"
    `include "automatic_trans_pcy.sv"
    `include "manual_trans_pcy.sv"
    `include "american_car_pcy.sv"
    `include "luxury_car_pcy.sv"
    `include "german_car_pcy.sv"
    `include "japanese_car_pcy.sv"
    `include "midwest_mix_pcy.sv"

    `include "test_config.sv"
    `include "example_env.sv"

endpackage : example_pkg
`endif
