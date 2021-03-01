
class american_car_pcy extends test_cfg_policy_base;
    function new(string name = "american_car_pcy");
        super.new(name);
    endfunction 

    constraint domestic_cars_only_c {
        item.my_car_make inside {chevy, ford, cadillac, tesla};
    }
endclass 
