

class northwest_mix_pcy extends test_cfg_policy_base;
    function new(string name = "northwest_mix_pcy");
        super.new(name);
    endfunction 

    constraint northwest_mix_c {
        item.my_car_make dist {
            chevy  := 15,
            ford   := 15, 
            cadillac := 1, 
            tesla  := 10,
            subaru := 20,
            honda  := 10,
            toyota := 15,
            lexus  := 5
        };
    }
endclass 
