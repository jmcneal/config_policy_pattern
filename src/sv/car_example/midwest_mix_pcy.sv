
class midwest_mix_pcy extends test_cfg_policy_base;
    function new(string name = "midwest_mix_pcy");
        super.new(name);
    endfunction 

    constraint midwest_mix_c {
        item.my_car_make dist {
            chevy := 30,
            ford  := 30, 
            cadillac := 10, 
            tesla := 5,
            honda := 5,
            vw    := 5,
            lexus := 1
        };
    }
endclass 
