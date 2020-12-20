
class luxury_car_pcy extends test_cfg_policy_base;
    function new(string name = "luxury_car_pcy");
        super.new(name);
    endfunction 

    constraint luxury_cars_only_c {
        item.my_car_make inside {cadillac, tesla, lexus, mercedes, porsche};
    }
endclass 
