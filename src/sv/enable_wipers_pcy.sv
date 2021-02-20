
class enable_wipers_pcy extends test_cfg_policy_base;
 
    function new(string name = "enable_wipers_pcy");
        super.new(name);
    endfunction
 
    constraint enable_wipers_c { 
        item.wipers_on == 1; 
    }
endclass 

