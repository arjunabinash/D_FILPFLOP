`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "inch.sv"
 
module tb;
  dff_if dif();
  
   dff dut(.din(dif.din),.dout(dif.dout),.clk(dif.clk),.rst(dif.rst));
  
  initial begin
    dif.clk=1'b0;
    dif.rst=1'b0;
  end
  
  always#10 dif.clk= ~dif.clk;

  initial begin
   uvm_config_db#(virtual dff_if)::set(null,"*","dif",dif);
   run_test("test");
  end
  
endmodule