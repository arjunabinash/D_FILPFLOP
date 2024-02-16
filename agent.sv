class agent extends uvm_agent;
  `uvm_component_utils(agent);
  
  monitor m;
  driver d;
  uvm_sequencer#(transaction) seqr;
  
  function new(string name = "agent", uvm_component c);
    super.new(name, c);
  endfunction
  
  virtual function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    m = monitor::type_id::create("m",this);
    d = driver::type_id::create("d",this);
    seqr = uvm_sequencer#(transaction)::type_id::create("seqr",this);
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    d.seq_item_port.connect(seqr.seq_item_export);
  endfunction
endclass
    