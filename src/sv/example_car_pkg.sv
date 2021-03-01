`ifndef __EXAMPLE_CAR_PKG_SV__
`define __EXAMPLE_CAR_PKG_SV__

package example_car_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    import policy_base_pkg::*;

    typedef enum {chevy, ford, cadillac, honda, lexus, vw, mercedes, rover, tesla, porsche, toyota, subaru} car_make_t;
    typedef enum {AUTOMATIC, MANUAL} transmission_t;
     
    typedef class test_config;
    typedef policy_base#(test_config) test_cfg_policy_base;
    typedef policy_list#(test_config) test_cfg_policy_list;

    `include "./car_example/enable_headlights_pcy.sv"
    `include "./car_example/disable_headlights_pcy.sv"
    `include "./car_example/enable_wipers_pcy.sv"
    `include "./car_example/disable_wipers_pcy.sv"
    `include "./car_example/automatic_trans_pcy.sv"
    `include "./car_example/manual_trans_pcy.sv"
    `include "./car_example/american_car_pcy.sv"
    `include "./car_example/luxury_car_pcy.sv"
    `include "./car_example/german_car_pcy.sv"
    `include "./car_example/japanese_car_pcy.sv"
    `include "./car_example/midwest_mix_pcy.sv"
    `include "./car_example/northwest_mix_pcy.sv"
    `include "./car_example/repair_daily_pcy.sv"
    `include "./car_example/state_law_pcy.sv"
    `include "./car_example/two_door_pcy.sv"
    `include "./car_example/four_door_pcy.sv"

    `include "test_config.sv"
    `include "example_env.sv"

endpackage : example_car_pkg
`endif
