// ============================================================
// File: tb_hello_world.sv
// UVM testbench for hello_world
// ============================================================

`timescale 1ns/1ps

// Include and import UVM
`include "uvm_macros.svh"
import uvm_pkg::*;

// ------------------------------------------------------------
// DUT instantiation
// ------------------------------------------------------------
module tb_hello_world;

  // Instantiate the DUT
  hello_world dut();

  // Start UVM test
  initial begin
    run_test();  // will pick up +UVM_TESTNAME from the command line
  end

endmodule


// ------------------------------------------------------------
// Simple UVM test class
// ------------------------------------------------------------
class tc_hello_world extends uvm_test;
  `uvm_component_utils(tc_hello_world)

  function new(string name = "tc_hello_world", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info("HELLO_WORLD_TEST", "Starting UVM test...", UVM_LOW)
    #10ns;
    `uvm_info("HELLO_WORLD_TEST", "UVM test completed successfully!", UVM_LOW)
    phase.drop_objection(this);
  endtask
endclass
