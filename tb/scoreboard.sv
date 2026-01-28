class count_sb extends uvm_scoreboard;

`uvm_component_utils (count_sb)
uvm_tlm_analysis_fifo #(count_trans) fifo_h;
   count_trans mon_data;
	count_trans rm_data;  
  

static bit[3:0] count;
static int mon_data_count = 0;
static int data_verified = 0;

//--------------------------------------------------------------------------------------------------------------------
function new(string name = "count_sb",uvm_component parent);
super.new(name,parent);
fifo_h = new("fifo_h",this);
endfunction

   
//---------------------------------------------------------------------------------------------------------------
 /*  virtual function void report();
      $display(" ------------------------ SCOREBOARD REPORT ----------------------- \n ");
      $display("\t %0d Data Generated,\n \t%0d Read Data Verified \n")
    endfunction*/
//-----------------------------------------------------------------------------------------------------------------------
task run_phase(uvm_phase phase);
`uvm_info(get_full_name(),"SB RUN PHASE",UVM_LOW)

forever
begin
	fifo_h.get(mon_data);
	mon_data_count++;
	$cast(rm_data,mon_data.clone());
	$display("==========DATA FROM DUT=============");
	rm_data.print();
	model_counter(mon_data);
	$display("========DATA_FROM_REF_MODEL=========");
	mon_data.print();
	if(mon_data.compare(rm_data))
	begin
		$display("transaction %0d is verified",mon_data.transaction_id);
		data_verified++;
	end
	else
		$display("transaction %0d is mismatched",mon_data.transaction_id);

end
endtask	

//----------------------------------------------------------------------------------------------------------------------
virtual function void model_counter(count_trans wrmon_data);
if(wrmon_data.reset)
	count <= 0;
else if(wrmon_data.load)
	count <= wrmon_data.data_in;

else if(wrmon_data.mode)
	begin
		if(count==11)
			count <= 0;
		else
		count <= count+1;
	end
else
	begin
		if(count==0)
		count <= 11;
		else
		count <= count-1;
	end

mon_data.data_out = count;
endfunction
//--------------------------------------------------------------
 virtual function void report();
      $display(" ------------------------ SCOREBOARD REPORT ----------------------- \n ");
    endfunction
//--------------------
endclass
