class count_env extends uvm_env;
`uvm_component_utils(count_env)
count_sb sb_h;
count_agent agnth;
count_config c_cfg;




function new(string name= "count_env",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
`uvm_info(get_full_name(),"ENV BUILD PHASE",UVM_LOW)
uvm_config_db #(count_config) :: get(this,"","count_config",c_cfg);
super.build_phase(phase);

sb_h = count_sb :: type_id :: create("sb_h",this);


agnth = count_agent :: type_id :: create ("agnth",this);
endfunction

function void connect_phase(uvm_phase phase);
`uvm_info(get_full_name(),"ENV CONNECT PHASE",UVM_LOW)
agnth.monh.AP.connect(sb_h.fifo_h.analysis_export);
endfunction

endclass
