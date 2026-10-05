`timescale 1s/1ms

module tb_traffic_light_controller;

reg clk;
reg reset;
wire red;
wire green;
wire yellow;

traffic_light_controller uut(
    .clk(clk),
    .reset(reset),
    .red(red),
    .green(green),
    .yellow(yellow)
);

always #0.5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;

    #1;
    reset = 0;

    #45;
    $finish;
end

endmodule