class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  uvm_analysis_imp#(transaction,scoreboard) recv;
  transaction trans3;
  
  function new(string name = "scoreboard",uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    trans3 = transaction::type_id::create("trans3");
  endfunction
  
  virtual function void write (transaction t);
    trans3 = t;
    if(trans3.din == trans3.dout)
       `uvm_info("SCO","Data Matched",UVM_NONE)
    
    else
       `uvm_info("SCO","Test Failed",UVM_NONE)
    
  endfunction
  
endclass