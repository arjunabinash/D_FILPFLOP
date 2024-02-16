class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  uvm_analysis_port#(transaction) send;
  transaction trans2;
  
  virtual dff_if dif;
  
  function new(string name = "monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    trans2 = transaction::type_id::create("trans2");
    
    if(!uvm_config_db#(virtual dff_if)::get(this,"","dif",dif))
      `uvm_error("MON","unable to recieve config_db")
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    @(negedge dif.rst);
    
    forever begin
      repeat(2)@(posedge dif.clk);
      trans2.din = dif.din;
      trans2.dout = dif.dout;
      
      `uvm_info("MON",$sformatf("data din = %0d is send to scoreboard",trans2.din),UVM_NONE)
      send.write(trans2);
      
    end
  endtask
  
endclass