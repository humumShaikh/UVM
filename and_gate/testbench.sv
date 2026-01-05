`timescale 1ns/1ns

`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"

`include "andGate_pkg.sv"
import andGate_pkg::*;

`include "test.sv"

`include "and_gate.sv"

module testbench;

    logic clk = 0;

    AND_INTF vif
    (
        .clk(clk)
    );

    and_gate AG
    (
        .A(vif.A),
        .B(vif.B),
        .Y(vif.Y)
    );

    initial
    begin
        uvm_config_db#(virtual AND_INTF)::set(null , "*" , "vif" , vif);
    end

    always #5 clk <= ~clk;

    initial
    begin
        clk = 0;
    end

    initial
    begin
        $dumpfile("waveform.vcd");
        $dumpvars(0 , "testbench");
        run_test("ag_test");
    end

endmodule : testbench