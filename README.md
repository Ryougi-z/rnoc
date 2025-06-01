# rnoc
Verilog Code for NoC

# Configuration
![NoC Configuration](./pic/parameter.png)

# Pipeline
Buffer --> Router Switch --> Crossbar

# Flit Format
0-1       2-6       7-8   9-10  11-74
Tail/head Next_Port X_Des Y_Des DATA

# Assumption
message size = Flit size

# Further
1.接口信号
2.调整流水分级
3.完善VA机制 rr_arbiter
4.接入总线   AXI -> CHI
......
处理器和内部流量区分VN?
