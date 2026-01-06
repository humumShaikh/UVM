`timescale 1ns/1ns

`include "uvm_macros.svh"
import uvm_pkg::*;

`include "spi_m_pkg.sv"
import spi_m_pkg::*;

`include "interface.sv"

`include "test.sv"

`include "SPI_M.sv"

module testbench;

    logic clk = 0;

    SPI_INTF vif
    (
        .clk(clk)
    );


    SPI_M SPIM
    (
        .start(vif.start),
        .din(vif.din),
        .mosi(vif.mosi),
        .sclk(vif.sclk),
        .reset(vif.reset),
        .clk(vif.clk),
        .ss(vif.ss)
    );

    always #5 clk = ~clk;

    initial
    begin
        clk = 0;
    end

    initial
    begin
        uvm_config_db#(virtual SPI_INTF)::set(null, "*", "vif", vif);
    end

    initial
    begin
        run_test("spi_m_test");
    end

    initial
    begin
        $dumpfile("waveform.vcd");
        $dumpvars(0 , "testbench");
    end


endmodule : testbench