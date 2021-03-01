import uvm_pkg::*;
`include "uvm_macros.svh"
import example_car_pkg::*;

//------------------------------------------------------------------------------
class base_car_test extends base_test;

    `uvm_component_utils(base_car_test)

    //--------------------------------------------------------------------------
    //function new(string name, uvm_component parent);
    function new(string name = "base_car_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    //--------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

    //--------------------------------------------------------------------------
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        //-------------------------------------------------------
        // Default Policies in use by car test
        //-------------------------------------------------------
        // < No default policies for car tests. >      
        //-------------------------------------------------------
    endfunction : end_of_elaboration_phase

    //--------------------------------------------------------------------------
    virtual function void start_of_simulation_phase(uvm_phase phase);

        `uvm_info({get_name(), "::base_car_test"}, "start_of_simulation_phase: debug - start", UVM_MEDIUM)
        env.test_cfg.policy_list.print_policy_list();

        super.start_of_simulation_phase(phase);

    endfunction : start_of_simulation_phase
  
    //--------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        super.run_phase(phase);

    endtask : run_phase

endclass : base_car_test
