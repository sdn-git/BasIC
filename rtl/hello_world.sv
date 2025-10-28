// ============================================================
// File: hello_world.sv
// Simple RTL module that prints a message
// ============================================================
module hello_world;

  // Simple behavior to print at simulation start
  initial begin
    $display("[%0t] Hello from RTL: hello_world.sv", $time);
  end

endmodule
