module counter(clk,rst,load,mode,data_in,data_out);
input clk,rst,load,mode;
input [3:0] data_in;    
output reg [3:0] data_out;    
always@(posedge clk)
begin
   if(rst)
   data_out<=4'd0;
   else if(load)
   data_out<=data_in;
   else if(mode)
   begin
   if(data_out == 4'd11)
   data_out<= 4'd0;
   else
   data_out<= data_out +1'b1;    //mode:1 up counting ,mode:0 down counting
   end
   else
   begin
   if(data_out == 4'd0)
   data_out<= 4'd11;
   else
   data_out<= data_out - 1'b1;
   end
end
endmodule
