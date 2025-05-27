// controlUnit.v
// 管理模块：负责协调各个子模块的信号交互和状态管理

module controlUnit #(
    parameter int PORT_NUM = 5,
    parameter int VC_NUM = 4
) (
    input  logic                   clk,
    input  logic                   rst,
    input  logic [$clog2(VC_NUM)-1:0] vc_req[PORT_NUM-1:0], // 分配到的VC编号

    output logic [VC_NUM-1:0]      vc_busy[PORT_NUM-1:0]    // 每个输出端口下VC的占用情况
);

    // 状态管理逻辑：更新每个输出端口下VC的占用情况
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            for (int i = 0; i < PORT_NUM; i++) begin
                vc_busy[i] <= '0;
            end
        end else begin
            for (int i = 0; i < PORT_NUM; i++) begin
                for (int j = 0; j < VC_NUM; j++) begin
                    if (req[i] && vc_req[i] == j) begin
                        vc_busy[i][j] <= 1'b1; // 标记VC为占用
                    end
                end
            end
        end
    end

endmodule
