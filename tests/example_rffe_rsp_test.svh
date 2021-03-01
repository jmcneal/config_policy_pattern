// =============================================================================
/// @brief  example response test for RFFE
/// @author Kevin Vasconcellos, Verilab (www.verilab.com)
// =============================================================================
//
//                        RFFE Verification Component
//                        Copyright (c) 2016 Verilab
//
// =============================================================================


// ---------------------------------------------------------------------------
/// stimulus
// ---------------------------------------------------------------------------
class example_rffe_rsp_test_seq extends vlab_rffe_master_base_seq;

   vlab_rffe_master_register_write_seq    write_seq;
   vlab_rffe_master_register_read_seq     read_seq;

   bit [3:0] slave0_address;
   bit [7:0] read_data;
   bit [7:0] write_data;

   `uvm_object_utils(example_rffe_rsp_test_seq)

   virtual task body();

      `uvm_info(get_type_name(), "body() - start", UVM_LOW)

      `uvm_info(get_type_name(), "body() - getting slave[0] address", UVM_LOW)
      slave0_address = this.p_sequencer.m_config.m_slave_address[0];
      `uvm_info(get_type_name(), $sformatf("body() - slave[0] address is 0x%1h", slave0_address), UVM_LOW)

      `uvm_info(get_type_name(), "body() - start 100us wait", UVM_LOW)
      #(100us);

      `uvm_info(get_type_name(), "body() - start constrained write_seq", UVM_LOW)
      `uvm_do_with(write_seq, {
         ms_slave_addr == slave0_address;
         ms_reg_addr   == 8'h03;
      })
      write_data = write_seq.write_data;
      `uvm_info(get_type_name(), $sformatf("body() - (Expected) write_data = 0x%2h", write_data), UVM_LOW)

      `uvm_info(get_type_name(), "body() - start 1us wait", UVM_LOW)
      #(1us);

      `uvm_info(get_type_name(), "body() - start constrained read_seq", UVM_LOW)
      `uvm_do_with(read_seq, {
         ms_slave_addr == slave0_address;
         ms_reg_addr   == 8'h03;
      })
      read_data = read_seq.read_data;
      `uvm_info(get_type_name(), $sformatf("body() - (Actual) read_data = 0x%2h", read_data), UVM_LOW)
      if (read_data == write_data) begin
         `uvm_info(get_type_name(), $sformatf("body() - Check passed: read_data(0x%2h) = write_data(0x%2h)", read_data, write_data), UVM_LOW)
      end else begin
         `uvm_error(get_type_name(), $sformatf("body() - Check failed: read_data(0x%2h) != write_data(0x%2h)", read_data, write_data))
      end

      `uvm_info(get_type_name(), "body() - start 50us wait", UVM_LOW)
      #(50us);

      `uvm_info(get_type_name(), "body() - start constrained write_seq to unsupported register", UVM_LOW)
      `uvm_do_with(write_seq, {
         ms_slave_addr == slave0_address;
         ms_reg_addr   == 8'h10;
      })

      `uvm_info(get_type_name(), "body() - start 1us wait", UVM_LOW)
      #(1us);

      `uvm_info(get_type_name(), "body() - start constrained read_seq to unsupported register", UVM_LOW)
      `uvm_do_with(read_seq, {
         ms_slave_addr == slave0_address;
         ms_reg_addr   == 8'h10;
      })
      read_data = read_seq.read_data;
      write_data = 8'h0; // No Response Frame expected
      if (read_data == write_data) begin
         `uvm_info(get_type_name(), $sformatf("body() - Check passed: read_data(0x%2h) = write_data(0x%2h)", read_data, write_data), UVM_LOW)
      end else begin
         `uvm_error(get_type_name(), $sformatf("body() - Check failed: read_data(0x%2h) != write_data(0x%2h)", read_data, write_data))
      end

      `uvm_info(get_type_name(), "body() - start 50us wait", UVM_LOW)
      #(50us);

      `uvm_info(get_type_name(), "body() - end", UVM_LOW)
   endtask : body

endclass : example_rffe_rsp_test_seq

// ---------------------------------------------------------------------------
/// test environment
// ---------------------------------------------------------------------------
class example_rffe_rsp_test extends example_rffe_base_test;

   example_rffe_rsp_test_seq test_seq;

   `uvm_component_utils(example_rffe_rsp_test)

   function new(string name = "example_rffe_rsp_test", uvm_component parent=null);
      super.new(name,parent);
   endfunction : new

   task run_phase(uvm_phase phase);
      super.run_phase(phase);
      uvm_test_done.raise_objection(this);
      test_seq = example_rffe_rsp_test_seq::type_id::create("test_seq");
      test_seq.start(m_vc_env.m_rffe_env.m_master[0].m_sequencer);
      uvm_test_done.drop_objection(this);
   endtask : run_phase

endclass : example_rffe_rsp_test

