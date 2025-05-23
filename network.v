module network #(
    //Mesh
    parameter int x_size = 4,
    parameter int y_size = 4,
    //Router
    parameter int FIFO_DEPTH = 4,
    parameter int DATA_WIDTH = 64,
    parameter int FLIT_WIDRH = 2 + 5 + $clog2(x_size) + $clog2(y_size) + DATA_WIDTH
) (
    input logic clk,
    input logic rst,
    // 可根据需要扩展输入输出端口
    input  logic  [FLIT_WIDRH-1:0] data_in[0:x_size*y_size-1],
    output logic  [FLIT_WIDRH-1:0] data_out[0:x_size*y_size-1]
);

    // router实例化
    genvar x, y;
    // 假设router端口命名为：xp, xm, yp, ym, local_in, local_out
    // 端口类型和宽度请根据你的router定义调整
    // 这里以简化信号为例
    wire  [FLIT_WIDRH-1:0] link_in[0:x_size-2][0:y_size-1];
    wire  [FLIT_WIDRH-1:0] link_out[0:x_size-2][0:y_size-1];

    // 本地端口
    wire  [FLIT_WIDRH-1:0] local_in[x_size-1:0][y_size-1:0];
    wire  [FLIT_WIDRH-1:0] local_out[x_size-1:0][y_size-1:0];

    // 连接输入
    generate
        for (y = 0; y < y_size; y = y + 1) begin: gen_y
            for (x = 0; x < x_size; x = x + 1) begin: gen_x
                // 本地输入输出与顶层端口连接
                assign local_in[x][y] = data_in[y*x_size + x];
                assign data_out[y*x_size + x] = local_out[x][y];

                router u_router #(
                    .FLIT_WIDRH(FLIT_WIDRH)
                )
                (
                    .clk(clk),
                    .rst(rst),
                    .xp(x < x_size-1 ? link_in[x][y] : '0),
                    .xm(x > 0 ? link_in[x-1][y] : '0),
                    .yp(y < y_size-1 ? link_in[x][y-1] : '0),
                    .ym(y > 0 ? link_in[x][y] : '0),
                    .xp_out(x < x_size-1 ? link_out[x][y] : '0),
                    .xm_out(x > 0 ? link_out[x-1][y] : '0),
                    .yp_out(y < y_size-1 ? link_out[x][y-1] : '0),
                    .ym_out(y > 0 ? link_out[x][y] : '0),
                    // 本地端口
                    .local_in(local_in[x][y]),
                    .local_out(local_out[x][y])
                );
            end
        end
    endgenerate
endmodule