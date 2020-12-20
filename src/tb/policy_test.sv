import uvm_pkg::*;
`include "uvm_macros.svh"
import example_pkg::*;

class policy_test extends uvm_test;

    example_env env;

    `uvm_component_utils(policy_test)
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        env = example_env::type_id::create("env", this);

    endfunction : build_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);

        phase.raise_objection(this);

        #1;
        `uvm_info(get_name(), "Running!", UVM_MEDIUM)
        // env.test_cfg.policy_list.add(env.test_cfg.one_lane);
        // env.test_cfg.policy_list.add(env.test_cfg.american);
        // env.test_cfg.policy_list.add(env.test_cfg.german);
        // env.test_cfg.policy_list.add(env.test_cfg.luxury);
        env.test_cfg.policy_list.add(env.test_cfg.midwest);
        #1;
        if (!env.randomize()) begin
            `uvm_fatal(get_name(), "Failed to randomize config")
        end
        env.test_cfg.print();

        repeat (10) begin
            if (!env.randomize()) begin
                `uvm_fatal(get_name(), "Failed to randomize config")
            end
            // env.test_cfg.print();
            `uvm_info("TEST", $sformatf("Driving %0s", env.test_cfg.convert2string()), UVM_LOW)
        end
        phase.drop_objection(this);

    endtask : run_phase

endclass : policy_test
