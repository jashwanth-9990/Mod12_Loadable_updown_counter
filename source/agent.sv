class count_agent extends uvm_agent;
`uvm_component_utils (count_agent)
count_driver drvh;
count_monitor monh;
count_sequencer seqrh;
count_config c_cfg;


function new(string name = "count_agent",uvm_component parent = null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
  if(!uvm_config_db #(count_config)::get(this, "","count_config", c_cfg))
   `uvm_fatal("CONFIG", "Cannot get() m_cfg from uvm_config_db. Have you set() it?")

monh = count_monitor :: type_id :: create ("monh",this);
if(c_cfg.is_active == UVM_ACTIVE)
begin
seqrh = count_sequencer :: type_id :: create("seqrh",this);
drvh = count_driver :: type_id :: create("drvh",this);
end
endfunction


function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
if(c_cfg.is_active == UVM_ACTIVE)
drvh.seq_item_port.connect(seqrh.seq_item_export);
endfunction
endclass
		
