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
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        //-------------------------------------------------------
        // Default Policies in use by this test
        //-------------------------------------------------------
        // < Use the german default policy for car tests. >      
/*kv*/      env.test_cfg.policy_list.add(env.test_cfg.state_law);
        //-------------------------------------------------------
    endfunction : end_of_elaboration_phase

    //--------------------------------------------------------------------------
    virtual function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);

        //-------------------------------------------------------
        // (Default) Policies in use by tests
        //-------------------------------------------------------
        // < No default policies for all tests. >      
        //-------------------------------------------------------
      
        `uvm_info({get_name(), "::base_test"}, "start_of_simulation_phase: debug - start", UVM_MEDIUM)
        env.test_cfg.policy_list.print_policy_list();

        if (!env.randomize()) begin
            `uvm_fatal({get_name(), "::base_test"}, "Failed to randomize config")
        end
        `uvm_info({get_name(), "::base_test"}, "start_of_simulation_phase:", UVM_MEDIUM)
        env.test_cfg.print();

    endfunction : start_of_simulation_phase
  
    //--------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        int iterations;
        int iter_count;
            
        super.run_phase(phase);

        phase.raise_objection(this);

        #1;
        `uvm_info(get_name(), "Running!", UVM_MEDIUM)
        iterations = 3;
        iter_count = 1;

        repeat (iterations) begin
            #1;
            if (!env.randomize()) begin
                `uvm_fatal(get_name(), "Failed to randomize config")
            end
            `uvm_info(get_name(), $sformatf("run_phase - %0d/%0d:", iter_count, iterations), UVM_MEDIUM)
            env.test_cfg.print();
            iter_count++;
        end
        phase.drop_objection(this);

    endtask : run_phase

endclass : base_test
