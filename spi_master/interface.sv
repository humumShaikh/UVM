interface SPI_INTF
(
    input logic clk
);

    logic   [7:0]   din;
    logic           start;
    logic           mosi;
    logic           sclk;
    logic           reset;
    logic           ss;

endinterface : SPI_INTF