class count_base_seq extends uvm_sequence #(count_trans);  	
`uvm_object_utils (count_base_seq)

function new(string name ="count_base_seq");
super.new(name);
endfunction
endclass

class seq1 extends count_base_seq;
`uvm_object_utils (seq1)

function new(string name = "seq1");
  super.new(name);
endfunction
task body();
req = count_trans :: type_id :: create ("req");
start_item(req);
assert(req.randomize());
//req.print();
finish_item(req);
endtask
endclass
