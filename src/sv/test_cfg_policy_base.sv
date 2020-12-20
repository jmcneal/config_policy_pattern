class test_cfg_policy_base extends uvm_object;
    test_top_config item;
 
    `uvm_object_utils(test_cfg_policy_base)

    //-------------------------------------------------------------------------------------------------
    /// Constructor
    function new(string name="test_cfg_policy_base");
        super.new(name);
    endfunction

    virtual function void set_item(test_top_config item);
        this.item = item;
    endfunction : set_item

endclass : test_cfg_policy_base
