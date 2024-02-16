// Code your design here
module dff(clk,rst,din,dout);
  input clk;
  input rst;
  input din;
  output reg dout;
  
  always@(posedge clk)
    begin
      if(rst)
        dout<=0;
      else 
        dout<=din;
    end
endmodule