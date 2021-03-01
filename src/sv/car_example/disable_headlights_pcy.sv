class disable_headlights_pcy extends test_cfg_policy_base;
 
    function new(string name = "disable_headlights_pcy");
        super.new(name);
    endfunction
 
    constraint disable_headlights_c { 
        item.headlights_on == 0; 
    }
endclass 

