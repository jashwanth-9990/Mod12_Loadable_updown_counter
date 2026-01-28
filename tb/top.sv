module top;

import pkg ::*;
  
   import uvm_pkg::*;
`include "uvm_macros.svh"   
    
   parameter cycle = 10;
  
   bit clock;

always
 #(cycle/2) clock = ~clock;

   count_if DUV_IF(clock);
 
   counter COUNT(.clk	(clock),
                 .rst   (DUV_IF.reset),
                 .data_out   (DUV_IF.data_out),
                 .mode       (DUV_IF.mode),
                 .load      (DUV_IF.load),
		.data_in (DUV_IF.data_in)
                ); 
     
   
   initial
      begin
       `ifdef VCS
			$fsdbDumpvars(0, top);
			`endif
	uvm_config_db #(virtual count_if)::set(null,"*","vif",DUV_IF);
	run_test("count_test");
      end
endmodule
