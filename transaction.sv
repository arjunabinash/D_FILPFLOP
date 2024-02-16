class transaction extends uvm_sequence_item;
  rand bit din;
  bit dout;
  
  function new (string name= "tranaction");
    super.new(name);
  endfunction
  
  `uvm_object_utils_begin(transaction);
  `uvm_field_int(din,UVM_DEFAULT);
  `uvm_field_int(dout,UVM_DEFAULT);
  `uvm_object_utils_end

endclass