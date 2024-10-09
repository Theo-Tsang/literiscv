`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: https://shzeng.cn
// Engineer: Theo Tsang <sihao.tsang@gmail.com>
//
// Create Date: 10/09/2024 00:07:13
// Design Name: rv_gnrl_dff
// Module Name: rv_gnrl_dff
// Target Device: <target device>
// Tool versions: <tool_versions>
// Description:
//    <Description here>
// Dependencies:
//    <Dependencies here>
// Revision:
//    <Code_revision_information>
// Additional Comments:
//    <Additional_comments>
////////////////////////////////////////////////////////////////////////////////

module rv_gnrl_dff_rst0 #(
    parameter DW = 32
) (
    input  logic                 clk ,
    input  logic                 rstn,

    input  logic [DW - 1:     0] din ,
    output logic [DW - 1:     0] qout
);

reg [DW - 1:     0] qout_r;

always_ff @(posedge clk) begin
    if (!rstn)
        qout_r <= '0;
    else
        qout_r <= din;
end

assign qout = qout_r;

endmodule

module rv_gnrl_dff_hl_eval #(
    parameter DW = 32
) (
    input                  clk    ,
    input                  rstn   ,

    input                  hold_en,

    input  [DW - 1:     0] def_val,
    input  [DW - 1:     0] din    ,
    output [DW - 1:     0] qout   
);

reg [DW - 1:     0] qout_r;

always_ff @(posedge clk) begin
    if (!rstn | hold_en)
        qout_r <= def_val;
    else
        qout_r <= din;
end

assign qout = qout_r;

endmodule
