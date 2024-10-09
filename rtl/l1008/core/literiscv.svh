`define CpuResetAddr              32'h0
`define ZeroWord                  32'h0

/* pc defines */
`define PcNone                    3'b000
`define PcHold                    3'b001
`define IfHold                    3'b010

/* rom define */
`define MemAddrBus                32  
`define MemDataBus                32  
`define RomNum                    4096 // memory depth (how many words)

/* I-type instruction */
`define INST_TYPE_I_OPCODE        7'b0010011
`define INST_TYPE_I_FUNCT3_ADDI   3'b000
`define INST_TYPE_I_FUNCT3_SLTI   3'b010
`define INST_TYPE_I_FUNCT3_SLTIU  3'b011
`define INST_TYPE_I_FUNCT3_XORI   3'b100
`define INST_TYPE_I_FUNCT3_ORI    3'b110
`define INST_TYPE_I_FUNCT3_ANDI   3'b111
`define INST_TYPE_I_FUNCT3_SLLI   3'b001
`define INST_TYPE_I_FUNCT3_SRLI   3'b101
`define INST_TYPE_I_FUNCT3_SRAI   3'b101


