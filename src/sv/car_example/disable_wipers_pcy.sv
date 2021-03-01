
class disable_wipers_pcy extends test_cfg_policy_base;
 
    function new(string name = "disable_wipers_pcy");
        super.new(name);
    endfunction
 
    constraint disable_wipers_c { 
        item.wipers_on == 0; 
    }
endclass 

