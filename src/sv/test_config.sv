//-------------------------------------------------------------------------------------------------
/// @class test_config
class test_config extends uvm_object;
    rand car_make_t     my_car_make;
    rand transmission_t my_transmission;
    rand bit headlights_on;
    rand bit wipers_on;
    rand int temp_setting;
    rand int num_doors;

    string plist;
    rand test_cfg_policy_list policy_list;

    enable_headlights_pcy  enable_headlights;
    disable_headlights_pcy disable_headlights;
    enable_wipers_pcy      enable_wipers;
    disable_wipers_pcy     disable_wipers;
    automatic_trans_pcy    automatic_trans;
    manual_trans_pcy       manual_trans;
    american_car_pcy       american;
    german_car_pcy         german;
    luxury_car_pcy         luxury;
    japanese_car_pcy       japanese;
    midwest_mix_pcy        midwest;
    northwest_mix_pcy      northwest;
    state_law_pcy          state_law;
    repair_daily_pcy       no_fix;
    four_door_pcy          four_door;
    two_door_pcy           two_door;
  
    `uvm_object_utils_begin(test_config)
        `uvm_field_enum(car_make_t, my_car_make, UVM_DEFAULT)
        `uvm_field_enum(transmission_t, my_transmission, UVM_DEFAULT)
        `uvm_field_int(headlights_on, UVM_DEFAULT)
        `uvm_field_int(wipers_on, UVM_DEFAULT)
        `uvm_field_int(temp_setting, UVM_DEFAULT + UVM_DEC)
        `uvm_field_int(num_doors, UVM_DEFAULT + UVM_DEC)
    `uvm_object_utils_end

    // Legality constraints
    constraint lane_cfg_c {
        temp_setting >= 60;
        temp_setting <= 90;
    }

    constraint doors_c {
        num_doors > 1;
        num_doors < 6;
    }

    //-------------------------------------------------------------------------------------------------
    /// Constructor
    function new(string name="test_config");
        super.new(name);
        // Create hte queue to hold policies
        policy_list = new();

        // Create instances of all policy objects
        enable_headlights = new("enable_headlights");
        disable_headlights = new("disable_headlights");
        enable_wipers = new("enable_wipers");
        disable_wipers = new("disable_wipers");
        automatic_trans = new("automatic_trans");
        manual_trans = new("manual_trans");
        american = new("american");
        german = new("german");
        japanese = new("japanese");
        luxury = new("luxury");
        midwest = new("midwest");
        northwest = new("northwest");
        no_fix = new("no_fix");
        state_law = new("state_law");
        two_door = new("two_door");
        four_door = new("four_door");

        // build a string to print the policy names to the log
        plist = $sformatf("%0s  %0s\n", plist, enable_headlights.get_name());
        plist = $sformatf("%0s  %0s\n", plist, disable_headlights.get_name());
        plist = $sformatf("%0s  %0s\n", plist, enable_wipers.get_name());
        plist = $sformatf("%0s  %0s\n", plist, disable_wipers.get_name());
        plist = $sformatf("%0s  %0s\n", plist, automatic_trans.get_name());
        plist = $sformatf("%0s  %0s\n", plist, manual_trans.get_name());
        plist = $sformatf("%0s  %0s\n", plist, american.get_name());
        plist = $sformatf("%0s  %0s\n", plist, german.get_name());
        plist = $sformatf("%0s  %0s\n", plist, japanese.get_name());
        plist = $sformatf("%0s  %0s\n", plist, luxury.get_name());
        plist = $sformatf("%0s  %0s\n", plist, midwest.get_name());
        plist = $sformatf("%0s  %0s\n", plist, northwest.get_name());
        plist = $sformatf("%0s  %0s\n", plist, no_fix.get_name());
        plist = $sformatf("%0s  %0s\n", plist, state_law.get_name());
        plist = $sformatf("%0s  %0s\n", plist, two_door.get_name());
        plist = $sformatf("%0s  %0s\n", plist, four_door.get_name());

    endfunction

    //-------------------------------------------------------------------------------------------------
    function void pre_randomize();
        policy_list.set_item(this);
        `uvm_info(get_name(), $sformatf("The policy_list contains %0d policies", policy_list.plist.size()), UVM_MEDIUM)
        `uvm_info(get_name(), $sformatf("The available policies are:\n%s", plist), UVM_MEDIUM)
    endfunction : pre_randomize

    //-------------------------------------------------------------------------------------------------
    // Leaving this here till we can get an example of prpogating down into sub-config objects
    function void post_randomize();
        `uvm_info(get_name(), "post_randomize: debug - start", UVM_FULL)
        policy_list.print_policy_list();
        `uvm_info(get_name(), "post_randomize: debug - done", UVM_FULL)
    endfunction : post_randomize

    //-------------------------------------------------------------------------------------------------
    /// Convert to string
    virtual function string convert2string();
        string s;
        $sformat(s, "driving a %0s %s with my headlights %0s", my_car_make.name(), my_transmission.name(), headlights_on?"on":"off");
        return s;
    endfunction

endclass : test_config
