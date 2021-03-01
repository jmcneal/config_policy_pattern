
class four_door_pcy extends test_cfg_policy_base;
 
    function new(string name = "four_door_pcy");
        super.new(name);
    endfunction
 
    constraint four_door_c { 
        item.num_doors == 4; 
    }
endclass 

