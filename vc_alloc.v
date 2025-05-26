// 虚拟通道分配器（Virtual Channel Allocator）
// 输入：每个输入端口的VC请求、目标输出端口、输出端口下各VC的占用情况
// 输出：分配结果（每个输入端口分配到的输出VC编号）
module vc_alloc #(
    parameter int PORT_NUM = 5,
    parameter int VC_NUM = 4
) (
    input  logic                   clk,
    input  logic                   rst,
    input  logic [PORT_NUM-1:0]    req,           // 输入端口请求
    input  logic [2:0]             route_sel[PORT_NUM-1:0], // 每个输入端口的目标输出端口
    input  logic [VC_NUM-1:0]      vc_busy[PORT_NUM-1:0],   // 每个输出端口下VC的占用情况
    output logic [VC_NUM-1:0]      vc_grant[PORT_NUM-1:0],  // 每个输入端口分配到的VC one-hot
    output logic [$clog2(VC_NUM)-1:0] vc_idx[PORT_NUM-1:0]     // 分配到的VC编号
);
    integer i, j;
    // VC分配结果寄存器
    logic [VC_NUM-1:0]      vc_grant_r[PORT_NUM-1:0];
    logic [$clog2(VC_NUM)-1:0] vc_idx_r[PORT_NUM-1:0];
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < PORT_NUM; i = i + 1) begin
                vc_grant_r[i] <= '0;
                vc_idx_r[i]   <= '0;
            end
        end else begin
            for (i = 0; i < PORT_NUM; i = i + 1) begin
                vc_grant_r[i] <= '0;
                vc_idx_r[i]   <= '0;
                if (req[i]) begin
                    for (j = 0; j < VC_NUM; j = j + 1) begin
                        if (!vc_busy[route_sel[i]][j]) begin
                            vc_grant_r[i][j] <= 1'b1;
                            vc_idx_r[i]      <= j;
                            break;
                        end
                    end
                end
            end
        end
    end
    assign vc_grant = vc_grant_r;
    assign vc_idx   = vc_idx_r;
endmodule


