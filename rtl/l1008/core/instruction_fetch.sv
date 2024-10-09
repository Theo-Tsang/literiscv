`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: https://shzeng.cn
// Engineer: Theo Tsang <sihao.tsang@gmail.com>
//
// Create Date: 10/08/2024 22:38:58
// Design Name: instruction_fetch
// Module Name: instruction_fetch
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

`include "literiscv.svh"

module instruction_fetch #(
    parameter InstDataBus = 32,
    parameter InstAddrBus = 32,
    parameter HoldFlagBus = 3 
) (
    input  logic                                   i_clk            ,
    input  logic                                   i_rst_n          ,

    input  logic [InstDataBus - 1:              0] i_inst_data      , // instruction data, 32-bit
    input  logic [InstAddrBus - 1:              0] i_inst_addr      , // instruction address, 32-bit

    input  logic [HoldFlagBus - 1:              0] i_hold_flag      , // Pipeline pause sign, 3-bit

    output logic [InstDataBus - 1:              0] o_inst_data      , // instruction data, 32-bit
    output logic [InstAddrBus - 1:              0] o_inst_addr        // instruction address, 32-bit
);

wire                                   hold_en  ; // hold_if
wire [InstDataBus - 1:              0] inst     ; // 32-bit
wire [InstAddrBus - 1:              0] inst_addr; // 32-bit
`define INST_NOP 32'h00000001;

////////////////////////////////////////////////////////////////////
//                               main                               
////////////////////////////////////////////////////////////////////
assign hold_en = (i_hold_flag >= `IfHold) ? 1'b1 : 1'b0;

// inst < if the pipeline is not reset or paused, the signal is slapped.
rv_gnrl_dff_hl_eval #(32) inst_dff (i_clk, i_rst_n, hold_en, `INST_NOP, i_inst_data, inst);
assign o_inst_data = inst;

// inst_addr
rv_gnrl_dff_hl_eval #(32) inst_addr_dff (i_clk, i_rst_n, hold_en, 32'h0, i_inst_addr, inst_addr);
assign o_inst_addr = inst_addr;

endmodule
