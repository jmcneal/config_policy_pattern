
class japanese_car_pcy extends test_cfg_policy_base;
    function new(string name = "japanese_car_pcy");
        super.new(name);
    endfunction 

    constraint japanese_cars_only_c {
        item.my_car_make inside {honda, lexus};
    }
endclass 
