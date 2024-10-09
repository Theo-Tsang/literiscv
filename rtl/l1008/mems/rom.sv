`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: https://shzeng.cn
// Engineer: Theo Tsang <sihao.tsang@gmail.com>
//
// Create Date: 10/09/2024 00:38:07
// Design Name: rom
// Module Name: rom
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

// `include "../core/literiscv.svh"

module rom #(
    parameter MemAddrBus = 32
    parameter MemDataBus = 32
    parameter RomNum     = 4096 // rom depth (how many words)
) (
    input  logic                                 i_clk   ,
    input  logic                                 i_rst_n ,

    input  logic                                 i_wen   , // write rom enable
    input  logic [MemAddrBus - 1:             0] i_waddr , // write address
    input  logic [MemDataBus - 1:             0] i_wdata , // write data

    output logic [MemDataBus - 1:             0] o_rdata   // read data
);

reg [MemDataBus - 1:             0] _rom [0          :RomNum - 1];

always_ff @(posedge i_clk) begin
    if (i_wen)
        _rom[i_waddr[MemAddrBus - 1:2]] <= i_wdata;
end

always_comb begin
    if (!i_rst_n)
        o_rdata = {MemDataBus{1'b0}};
    else
        o_rdata = _rom[i_waddr[MemAddrBus - 1:2]];
end

endmodule
