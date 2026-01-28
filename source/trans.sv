class count_trans extends uvm_sequence_item;
 
 `uvm_object_utils(count_trans)

 
rand bit[3:0] data_in;
rand bit mode;
rand bit load;
rand bit reset;
logic [3:0] data_out;
static int transaction_id;


   
constraint VALID_LOAD {load dist{0:=100, 1:=1};}
constraint VALID_MODE {mode dist{0:=50,1:=50};}
constraint VALID_DATA {data_in inside {[0:9]};}
constraint VALID_RESET {reset dist {0:=300, 1:=1};}


function new (string name = "count_trans");
super.new(name);
endfunction
 
function void post_randomize();
	transaction_id++;
endfunction: post_randomize


function void do_print(uvm_printer printer);
  super.do_print(printer);

// string name            bitstream value     size     radix for printing
    printer.print_field("data_in", this.data_in, 4, UVM_DEC);
      printer.print_field("load", this.load, 1, UVM_BIN);
printer.print_field("mode", this.mode, 1, UVM_BIN);
printer.print_field("RESET", this.reset, 1, UVM_BIN);
printer.print_field("data_out", this.data_out, 4, UVM_DEC);
//printer.print_field("data_in", this.data_in, 4, UVM_DEC);
endfunction

      
     
endclass
