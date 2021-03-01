class enable_headlights_pcy extends test_cfg_policy_base;
 
    function new(string name = "enable_headlights_pcy");
        super.new(name);
    endfunction
 
    constraint enable_headlights_c { 
        item.headlights_on == 1; 
    }
endclass 

