`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"

`include "xorGate_pkg.sv"
import xorGate_pkg::*;

`include "test.sv"

`include "xor_gate.sv"

module testbench;

    logic clk = 0;

    XOR_INTF vif
    (
        .clk(clk)
    );

    xor_gate XG
    (
        .A(vif.A),
        .B(vif.B),
        .Y(vif.Y)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        uvm_config_db #(virtual XOR_INTF)::set(null , "*" , "vif" , vif);
    end

    initial begin
        run_test("xor_test");
    end

endmodule : testbench