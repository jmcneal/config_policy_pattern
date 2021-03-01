
class manual_trans_pcy extends test_cfg_policy_base;
 
    function new(string name = "manual_trans_pcy");
        super.new(name);
    endfunction
 
    constraint manual_trans_c { 
        item.my_transmission == MANUAL;
    }
endclass 

