
class state_law_pcy extends test_cfg_policy_base;
 
    function new(string name = "state_law_pcy");
        super.new(name);
    endfunction
 
    constraint state_law_c { 
        (item.headlights_on == 1) -> (item.wipers_on == 1); 
    }
endclass 

