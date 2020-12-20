///////////////////////////////////////////////////////////////////////////////////////////////////
/// @class example_env
/// Environment class
class example_env extends uvm_env;

    // policy_agent    policy;
    rand test_config    test_cfg;

    `uvm_component_utils_begin(example_env)
        `uvm_field_object(test_cfg, UVM_DEFAULT)
    `uvm_component_utils_end

    ///////////////////////////////////////////////////////////////////////////////////////////////////
    //  Constructor: new
    function new(input string name="example_env", uvm_component parent);
        super.new(name, parent);
    endfunction

    ///////////////////////////////////////////////////////////////////////////////////////////////////
    //     FUNCTION: build_phase
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // policy = policy_agent::type_id::create("policy", this);
        test_cfg = test_config::type_id::create("test_cfg");
    endfunction : build_phase

    ///////////////////////////////////////////////////////////////////////////////////////////////////
    //     FUNCTION: connect_phase
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        // <-CONNECT_CODE->
    endfunction : connect_phase

endclass : example_env
