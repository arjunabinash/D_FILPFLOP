class generator extends uvm_sequence#(transaction);
  
  `uvm_object_utils(generator)
  
  transaction trans1;
  
  function new(string name ="");
    super.new(name);
  endfunction
  
  virtual task body();
    trans1 = transaction::type_id::create("trans1");
    repeat(10) begin;
      
      start_item(trans1);
      
      assert(trans1.randomize());
      
      finish_item(trans1);
      
      `uvm_info("GEN",$sformatf("data din = %0d is sent to driver.....",trans1.din),UVM_NONE)
      
    end
  endtask
  
endclass