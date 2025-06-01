// 开关分配器（Switch Allocator）
// 输入：每个输入端口的请求（目标输出端口、VC分配结果）
// 输出：grant信号，允许某输入端口通过crossbar
module sw_alloc #(
    parameter int PORT_NUM = 5
) (
    input  logic                   clk,
    input  logic                   rst,
    input  logic [PORT_NUM-1:0]    req,         // 输入端口请求
    input  logic [2:0]             route_sel[PORT_NUM-1:0], // 每个输入端口的目标输出端口
    output logic [PORT_NUM-1:0]    grant        // 哪些输入端口获准通过crossbar
);
    integer i, j;
    logic [PORT_NUM-1:0] out_req[PORT_NUM-1:0];
    logic [PORT_NUM-1:0] out_grant[PORT_NUM-1:0];
    logic [PORT_NUM-1:0] grant_r;
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            grant_r <= '0;
        end else begin
            // 统计每个输出端口的请求
            for (i = 0; i < PORT_NUM; i = i + 1) begin
                out_req[i] = '0;
                for (j = 0; j < PORT_NUM; j = j + 1) begin
                    if (req[j] && route_sel[j] == i)
                        out_req[i][j] = 1'b1;
                end
            end
            // 每个输出端口独立仲裁
            for (i = 0; i < PORT_NUM; i = i + 1) begin
                out_grant[i] = '0;
                for (j = 0; j < PORT_NUM; j = j + 1) begin
                    if (out_req[i][j]) begin
                        out_grant[i][j] = 1'b1; // 优先级：编号小的优先
                        break;
                    end
                end
            end
            // 汇总grant
            grant_r = '0;
            for (i = 0; i < PORT_NUM; i = i + 1) begin
                for (j = 0; j < PORT_NUM; j = j + 1) begin
                    if (out_grant[i][j])
                        grant_r[j] = 1'b1;
                end
            end
        end
    end
    assign grant = grant_r;
endmodule