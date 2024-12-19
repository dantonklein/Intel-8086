module mux2x1
#(
    parameter WIDTH
)
(
    input logic[WIDTH-1:0] in0,
    input logic[WIDTH-1:0] in1,
    input logic select,
    output logic[WIDTH-1:0] output
);

    assign out = select == 1'b1 ? in1 : in0;

endmodule

module reg
#(
    parameter WIDTH
)
(
    input logic[WIDTH-1:0] input,
    input logic clk,
    input logic reset,
    input logic enable,
    output logic[WIDTH-1:0] output
);

    always_ff @(posedge clk or posedge reset) begin
        if(reset)
            output <= '0;

        else if (enable)
            output <= input;
    end

endmodule