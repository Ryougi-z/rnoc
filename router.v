module router #(
    parameter int x_size = 4,
    parameter int y_size = 4,
    parameter int DATA_WIDRH = 64,
    parameter int FIFO_DEPTH = 4,
    parameter int FLIT_WIDRH = 75
) (
    input logic clk,
    input logic rst,
    // 端口定义，假设每个方向和本地端口均为FLIT_WIDRH宽度
    input  logic [FLIT_WIDRH-1:0] xp, // X+
    input  logic [FLIT_WIDRH-1:0] xm, // X-
    input  logic [FLIT_WIDRH-1:0] yp, // Y+
    input  logic [FLIT_WIDRH-1:0] ym, // Y-
    input  logic [FLIT_WIDRH-1:0] local_in,
    output logic [FLIT_WIDRH-1:0] xp_out,
    output logic [FLIT_WIDRH-1:0] xm_out,
    output logic [FLIT_WIDRH-1:0] yp_out,
    output logic [FLIT_WIDRH-1:0] ym_out,
    output logic [FLIT_WIDRH-1:0] local_out
);
    // 信号线定义
    logic [FLIT_WIDRH-1:0] inport_data [0:4];
    logic [FLIT_WIDRH-1:0] outport_data [0:4];
    logic [2:0] route_sel [0:4]; // 3bit路由选择信号
    logic [4:0] stop_signal;
    logic [4:0] grant;

    // 输入端口映射
    assign inport_data[0] = xp;        // X+
    assign inport_data[1] = xm;        // X-
    assign inport_data[2] = ym;        // Y-（上）
    assign inport_data[3] = yp;        // Y+（下）
    assign inport_data[4] = local_in;

    // output端口映射
    assign xp_out     = outport_data[0];
    assign xm_out     = outport_data[1];
    assign ym_out     = outport_data[2]; // Y-（上）
    assign yp_out     = outport_data[3]; // Y+（下）
    assign local_out  = outport_data[4];
// -----------------------------------------------------
    // 每个port一组fifo，每组4个fifo，输入都来自同一个端口
    logic [FLIT_WIDRH-1:0] fifo_dout [0:4][0:FIFO_DEPTH-1];
    logic fifo_empty [0:4][0:FIFO_DEPTH-1];
    logic fifo_full [0:4][0:FIFO_DEPTH-1];
    logic fifo_wr_en [0:4][0:FIFO_DEPTH-1];
    logic fifo_rd_en [0:4][0:FIFO_DEPTH-1];
    logic almost_empty [0:4][0:FIFO_DEPTH-1];
    logic almost_full [0:4][0:FIFO_DEPTH-1];

    genvar p, i;
    generate
        for (p = 0; p < 5; p = p + 1) begin: gen_port_fifo
            for (i = 0; i < FIFO_DEPTH; i = i + 1) begin: gen_fifo
                simple_fifo #(
                    .DATA_WIDRH(DATA_WIDRH),
                    .DEPTH(FIFO_DEPTH)
                ) u_fifo (
                    .clk(clk),
                    .rst(rst),
                    .wr_en(fifo_wr_en[p][i]),
                    .rd_en(fifo_rd_en[p][i]),
                    .din(inport_data[p]), // 每组fifo输入都来自同一个端口
                    .dout(fifo_dout[p][i]),
                    .empty(fifo_empty[p][i]),
                    .full(fifo_full[p][i]),
                    .almost_empty(almost_empty[p][i]),
                    .almost_full(almost_full[p][i])
                );
            end
        end
    endgenerate
// ------------------------------------------
    // inputport模块实例化（可根据需要保留或移除）
    genvar j;
    generate
        for (j = 0; j < 5; j = j + 1) begin: gen_inputport
            inputport u_inputport (
                .clk(clk),
                .rst(rst),
                .data_in(inport_data[j]),
                .route_sel(route_sel[j]), // 3bit，XY路由选择
                .stop(stop_signal[j])
            );
        end
    endgenerate

    // sw_alloc模块实例化
    sw_alloc u_sw_alloc (
        .clk(clk),
        .rst(rst),
        .route_sel(route_sel), // 5x3bit
        .stop(stop_signal),
        .grant(grant) // 5bit，哪个输入获得输出
    );

    // crossbar模块实例化
    crossbar u_crossbar (
        .clk(clk),
        .rst(rst),
        .data_in(inport_data),
        .grant(grant),
        .data_out(outport_data)
    );
endmodule
