
class automatic_trans_pcy extends test_cfg_policy_base;
 
    function new(string name = "automatic_trans_pcy");
        super.new(name);
    endfunction
 
    constraint automatic_trans_c { 
        item.my_transmission == AUTOMATIC;
    }
endclass 


