`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: https://shzeng.cn
// Engineer: Theo Tsang <sihao.tsang@gmail.com>
//
// Create Date: 10/07/2024 21:55:02
// Design Name: pc_reg
// Module Name: pc_reg
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

module pc_reg #(
    parameter InstAddrBus = 32,
    parameter HoldFlagBus = 3 
) (
    input  logic                                   i_clk            ,
    input  logic                                   i_rst_n          ,

    input  logic                                   i_jump_flag      , // Jump flag
    input  logic [InstAddrBus - 1:              0] i_jump_addr      , // Jump address
    input  logic [HoldFlagBus - 1:              0] i_hold_flag      , // Pipeline pause sign

    input  logic                                   i_jtag_reset_flag, // Reset flag

    output logic                                   o_pc               // PC pointe, 32-bit
);

////////////////////////////////////////////////////////////////////
//                               main                               
////////////////////////////////////////////////////////////////////
always_ff @(posedge i_clk) begin
    // Reset
    if (!i_rst_n || i_jtag_reset_flag == 1'b1)
        o_pc <= `CpuResetAddr;
    // Jump
    else if (i_jump_flag == 1'b1)
        o_pc <= i_jump_addr;
    // Stop
    else if (i_hold_flag == `PcHold)
        o_pc <= o_pc;
    // Address + 4
    else
        o_pc <= o_pc + 4'h4; // literiscv like tinyriscv, is 4-byte aligned and each instruction is 32-bit
end

endmodule
