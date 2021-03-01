import uvm_pkg::*;
`include "uvm_macros.svh"
import example_car_pkg::*;

//------------------------------------------------------------------------------
class remove_default_test extends base_car_with_default_pcy_test;

    `uvm_component_utils(remove_default_test)

    //--------------------------------------------------------------------------
    //function new(string name, uvm_component parent);
    function new(string name = "remove_default_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    //--------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

    //--------------------------------------------------------------------------
    virtual function void start_of_simulation_phase(uvm_phase phase);

//        super.start_of_simulation_phase(phase);

        `uvm_info({get_name(), "::remove_default_test"}, "start_of_simulation_phase: debug - start", UVM_MEDIUM)
        env.test_cfg.policy_list.print_policy_list();

        //-------------------------------------------------------
        // Policies in use by this test
        //-------------------------------------------------------
        // < Remove the german default policy for this tests. >      
        env.test_cfg.policy_list.rm("german");
        env.test_cfg.policy_list.add(env.test_cfg.midwest);
        //-------------------------------------------------------
      
        `uvm_info({get_name(), "::remove_default_test"}, "start_of_simulation_phase: debug - mid", UVM_MEDIUM)
        env.test_cfg.policy_list.print_policy_list();

        //super.start_of_simulation_phase(phase);
/*kv*/        super.start_of_simulation_phase(phase);
//        base_test::start_of_simulation_phase(phase);

    endfunction : start_of_simulation_phase
  
    //--------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        super.run_phase(phase);

    endtask : run_phase

endclass : remove_default_test
