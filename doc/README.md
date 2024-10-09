```
.
├── doc
│   ├── README.md
│   ├── RISC-V-Reader-Chinese-v2p1.pdf
│   └── riscv-spec-v2.2.pdf
├── LICENSE
├── README.md
├── rtl
│   └── l1008                                   // l1008核（名字源自2024.10.08敲定方案）
│       ├── core                                // l1008核 core rtl
│       │   ├── execute.sv
│       │   ├── instruction_decode.sv
│       │   ├── instruction_fetch.sv
│       │   ├── literiscv.sv
│       │   ├── literiscv.svh
│       │   ├── pc_reg.sv
│       │   └── regs.sv                         // 通用寄存器模块
│       ├── fab                                 // bus fabric 数据总线
│       ├── general                             // 通用rtl
│       │   └── rv_gnrl_dffs.sv                 // dff模块
│       │       ├── rv_gnrl_dff_rst0            // 同步reset，复位默认值为0
│       │       └── rv_gnrl_dff_hl_eval         // 同步reset，带控制信号和外部默认值
│       ├── mems                                // 存储器模块
│       │   └── rom.sv
│       ├── perips                              // 外设模块
│       ├── soc
│       ├── subsys                              // 子系统
│       └── README.md                           // l1008核说明文档
└── sim
    ├── env.mk
    ├── filelist.f
    ├── Makefile
    ├── tb_top.fsdb
    └── tb_top.sv
```
