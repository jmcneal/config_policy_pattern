
class policy_base #(type ITEM=uvm_object);
    string name;
    rand ITEM item;
 
    //-------------------------------------------------------------------------
    /// Constructor
    function new(string name="policy_base");
        this.name = name;
    endfunction

    virtual function string get_name();
        return this.name;
    endfunction

    virtual function void set_item(ITEM item);
        this.item = item;
    endfunction : set_item

endclass : policy_base
