package pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"

// Transactions //
`include "trans.sv"

// Agent Configuration //

`include "agnt_config.sv"

//  Write agent config //

`include "driver.sv"
`include "monitor.sv"
`include "sequencer.sv"
`include "agent.sv"
`include "sequence.sv"


// Read agent //


// environment config//
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"
endpackage
