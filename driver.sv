
class driver extends uvm_driver#(transaction);
  `uvm_component_utils(driver)
  
  transaction trans1;
  virtual dff_if dif;
  
  function new(string name = "driver", uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  task reset();
    dif.rst <= 1'b1;
    dif.din <= 0;
    
    repeat(5)@(posedge dif.clk);
    dif.rst<= 1'b0;
    `uvm_info("DRV","Reset done",UVM_NONE)
  endtask
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    trans1 = transaction::type_id::create("trans1");
    
    if(!uvm_config_db#(virtual dff_if)::get(this,"","dif",dif))
      `uvm_error("DRV","unable to recieve config_db")
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    reset();
    
    forever begin
      seq_item_port.get_next_item(trans1);
    dif.din<= trans1.din;
    seq_item_port.item_done();
      
      `uvm_info("DRV",$sformatf("data din = %0d is sent to driver.....",trans1.din),UVM_NONE)
      
      repeat(2)@(posedge dif.clk);
      
    end
  endtask
  
endclass