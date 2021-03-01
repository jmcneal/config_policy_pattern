import uvm_pkg::*;
`include "uvm_macros.svh"
import example_car_pkg::*;

//------------------------------------------------------------------------------
class base_test extends uvm_test;

    example_env env;

    `uvm_component_utils(base_test)

    //--------------------------------------------------------------------------
    //function new(string name, uvm_component parent);
    function new(string name = "base_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    //--------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if (env == null) begin
          env = example_env::type_id::create("env", this);
        end
      
    endfunction : build_phase

    //--------------------------------------------------------------------------
    virtual function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);

        //-------------------------------------------------------
        // (Default) Policies in use by tests
        //-------------------------------------------------------
        //env.test_cfg.policy_list.add(env.test_cfg.one_lane);
        //env.test_cfg.policy_list.add(env.test_cfg.american);
        //env.test_cfg.policy_list.add(env.test_cfg.german);
        //env.test_cfg.policy_list.add(env.test_cfg.luxury);
        //-------------------------------------------------------
      
        if (!env.randomize()) begin
            `uvm_fatal(get_name(), "Failed to randomize config")
        end
        env.test_cfg.print();

    endfunction : start_of_simulation_phase
  
    //--------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        phase.raise_objection(this);

        #1;
        `uvm_info(get_name(), "Running!", UVM_MEDIUM)

        repeat (3) begin
            #1;
            if (!env.randomize()) begin
                `uvm_fatal(get_name(), "Failed to randomize config")
            end
            env.test_cfg.print();
        end
        phase.drop_objection(this);

    endtask : run_phase

endclass : base_test
