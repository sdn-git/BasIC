// ============================================================
// File: hello_world.sv
// Simple RTL module that prints a message
// ============================================================
module hello_world (
    output logic dummy  // <--- добавлен видимый порт
);

  // Simple behavior to print at simulation start
  initial begin
    $display("[%0t] Hello from RTL: hello_world.sv", $time);
    dummy = 1'b0;
  end

endmodule
