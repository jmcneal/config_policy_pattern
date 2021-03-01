
class two_door_pcy extends test_cfg_policy_base;
 
    function new(string name = "two_door_pcy");
        super.new(name);
    endfunction
 
    constraint two_door_c { 
        item.num_doors == 2; 
    }
endclass 

