module halfAdder
(
    input   logic   clk,
    input   logic   A,
    input   logic   B,
    output  logic   S,
    output  logic   C
);

    always_ff @(posedge clk)
    begin
        S <= A ^ B;
        C <= A & B;
    end

endmodule : halfAdder