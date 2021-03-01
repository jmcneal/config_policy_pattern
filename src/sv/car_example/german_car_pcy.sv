class german_car_pcy extends test_cfg_policy_base;
    function new(string name = "german_car_pcy");
        super.new(name);
    endfunction 

    constraint german_cars_only_c {
        item.my_car_make inside {vw, mercedes, porsche, rover};
    }
endclass 
