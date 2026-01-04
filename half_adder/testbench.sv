`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"

`include "halfAdder_pkg.sv"
import halfAdder_pkg::*;

`include "test.sv"

`include "halfAdder.sv"

module top;

    logic clk;
    
    always #2 clk = ~clk;

    initial
    begin
        clk = 0;
    end

    ha_intf vif
    (
        .clk(clk)
    );

    halfAdder HA
    (
        .clk(vif.clk),
        .A(vif.A),
        .B(vif.B),
        .S(vif.S),
        .C(vif.C)
    );

    initial
    begin
        $dumpfile("waveform.vcd");
        $dumpvars(0 , "top");
        uvm_config_db#(virtual ha_intf)::set(uvm_root::get() , "*" , "vif" , vif);
    end


    initial
    begin
        run_test("ha_test");
    end

endmodule : top