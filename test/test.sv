class count_test extends uvm_test;
`uvm_component_utils (count_test)
count_config c_cfg;
count_env envh;

function new(string name = "count_test",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
`uvm_info(get_full_name(),"TEST BUILD PHASE",UVM_LOW)

c_cfg = count_config :: type_id :: create("c_cfg");
c_cfg.is_active = UVM_ACTIVE;

if(!uvm_config_db #(virtual count_if) :: get(this,"","vif",c_cfg.vif))
	`uvm_fatal(get_full_name(),"GET IS FAILED IN TEST")



uvm_config_db #(count_config) :: set(this,"*","count_config",c_cfg);
envh = count_env :: type_id :: create ("envh",this);
endfunction
function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
uvm_top.print_topology;
endfunction
endclass

class test1 extends count_test;
`uvm_component_utils (test1)

seq1 a;
function new(string name = "test1",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
   phase.raise_objection(this);
`uvm_info(get_full_name(),"TEST RUN_PHASE",UVM_LOW)
a = seq1::type_id::create("a");
a.start(envh.agnth.seqrh);
phase.drop_objection(this);
endtask
endclass

   
