import uvm_pkg::*;
`include "uvm_macros.svh"
import example_car_pkg::*;

//------------------------------------------------------------------------------
class american_midwest_test extends base_car_test;

    `uvm_component_utils(american_midwest_test)

    //--------------------------------------------------------------------------
    //function new(string name, uvm_component parent);
    function new(string name = "american_midwest_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    //--------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

    //--------------------------------------------------------------------------
    virtual function void start_of_simulation_phase(uvm_phase phase);

        //-------------------------------------------------------
        // Policies in use by this test
        //-------------------------------------------------------
        env.test_cfg.policy_list.add(env.test_cfg.american);
        env.test_cfg.policy_list.add(env.test_cfg.midwest);
        //-------------------------------------------------------
      
        super.start_of_simulation_phase(phase);

    endfunction : start_of_simulation_phase
  
    //--------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        super.run_phase(phase);

    endtask : run_phase

endclass : american_midwest_test
