
class policy_list #(type ITEM=uvm_object) extends policy_base#(ITEM);
    rand policy_base #(ITEM) plist[$];

    function new(string name = "policy_list");
        super.new(name);
    endfunction : new

    function void set_item(ITEM item);
        foreach(plist[i]) plist[i].set_item(item);
    endfunction : set_item

    // Enhancements
    function void add(policy_base #(ITEM) pcy);
        plist.push_back(pcy);
    endfunction : add

    function string get_policy_list(); // Get the list of policies\
        foreach (plist[x]) begin
            get_policy_list = $sformatf("%0s%0s%0s%0s", get_policy_list, (x == 0 ? "" : ","), (x== 0 ? "":" "), plist[x].name);
        end
    endfunction

    function void print_policy_list(); // prints all policies in list
        `uvm_info(get_name(), $sformatf("Policies in policy_list:\n  %0s", get_policy_list()), UVM_MEDIUM)
    endfunction

    function bit has_policy (string policy_name); // true if in plist
        policy_base #(ITEM) results[$];
        has_policy = 0;
        results = plist.find(pidx) with (pidx.name == policy_name);
        if (results.size() > 0) begin
            foreach (results[x]) begin
                `uvm_info(get_name(), $sformatf("results[%0d]: %0s", x, results[x].name), UVM_HIGH)
            end
            has_policy=1;
        end
    endfunction

    // true if one pcy is in plist
    function bit has_any_policy (string policy_names[$]);
        has_any_policy = 0;
        foreach (policy_names[pcy]) begin
            if (has_policy(policy_names[pcy])) begin
                has_any_policy = 1;
                return has_any_policy;
            end
        end
    endfunction

    function void rm (string policy_name); // removes single policy
        policy_base #(ITEM) results[$];
        foreach (plist[x]) begin
            if (plist[x].get_name() == policy_name) begin
                `uvm_info(get_name(), $sformatf("Removing %s policy from policy_list", plist[x].get_name()), UVM_MEDIUM)
                plist.delete(x);
            end
        end
    endfunction

    function void flush(); // Deletes all policies in th list
    endfunction

    function int get_policy_index (string policy_name); // index in plist of pcy
        int res[$];
        res = plist.find_first_index(pidx) with (pidx.name == policy_name);
        get_policy_index = res.pop_front();
    endfunction
    
endclass : policy_list
