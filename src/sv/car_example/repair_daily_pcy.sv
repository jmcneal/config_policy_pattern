
class repair_daily_pcy extends test_cfg_policy_base;
    function new(string name = "repair_daily_pcy");
        super.new(name);
    endfunction 

    constraint repair_daily_c {
        item.my_car_make != ford;
    }
endclass 

