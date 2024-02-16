class test extends uvm_test;
  `uvm_component_utils(test)
  
  env e;
  generator g;
  
  function new(string path = "env", uvm_component c);
    super.new(path,c);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e = env::type_id::create("e",this);
    g = generator::type_id::create("g",this); 
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    g.start(e.a.seqr);
    #60
    phase.drop_objection(this);
    
  endtask
endclass