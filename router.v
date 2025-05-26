/****************************
Flit Format
Flit type(2bit) nxt_hop(5bit) dst_x(2bit) dst_y(2bit) VCx(5bit) data(64bit)
*****************************/
module router #(
    parameter int x_size = 4,
    parameter int y_size = 4,
    parameter int DATA_WIDRH = 64,
    parameter int FIFO_DEPTH = 5,
    parameter int FLIT_WIDRH = 80
) (
    input logic clk,
    input logic rst,
    // 端口定义，假设每个方向和本地端口均为FLIT_WIDRH宽度
    input  logic [FLIT_WIDRH-1:0] xp, // X+
    input  logic [FLIT_WIDRH-1:0] xm, // X-
    input  logic [FLIT_WIDRH-1:0] yp, // Y+
    input  logic [FLIT_WIDRH-1:0] ym, // Y-
    input  logic [FLIT_WIDRH-1:0] local_in,
    input  logic [$clog2(x_size)-1:0] id_x,      //network定义
    input  logic [$clog2(y_size)-1:0] id_y,

    output logic [FLIT_WIDRH-1:0] xp_out,
    output logic [FLIT_WIDRH-1:0] xm_out,
    output logic [FLIT_WIDRH-1:0] yp_out,
    output logic [FLIT_WIDRH-1:0] ym_out,
    output logic [FLIT_WIDRH-1:0] local_out，

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

    // inputblock模块实例化，替代五个inputport
    inputblock #(
        .DATA_WIDTH(DATA_WIDRH),
        .FIFO_DEPTH(FIFO_DEPTH),
        .FLIT_WIDRH(FLIT_WIDRH)
    ) u_inputblock (
        .clk(clk),
        .rst(rst),
        .Flit_in(inport_data),
        .Flit_out(outport_data),

    );

    // 路由计算(RC)
    rc #(
        .x_size(x_size),
        .y_size(y_size)
    ) u_rc (
        .id_x(id_x),
        .id_y(id_y),
        .dst_x(dst_x),
        .dst_y(dst_y),
        .route_sel(route_sel)
    );

    genvar k;
    generate
        for (k = 0; k < 5; k = k + 1) begin: gen_dst
            assign dst_x[k] = inport_data[k][9:7];
            assign dst_y[k] = inport_data[k][12:10];
        end
    endgenerate

    //虚拟通道分配(VA)
    reg [2:0] vcx_out[0:4];
    vc_alloc u_vc_alloc(
        //input
        .clk(clk),
        .rst(rst),
        .route_sel(route_sel),
        .req(),

        //output
        .state(),
        .vcx_out(vcx_out),


    )

    //开关分配(SA)
    sw_alloc #(
        .PORT_NUM(5)
    ) u_sw_alloc (
        .clk(clk),
        .rst(rst),
        .req(req),
        .route_sel(route_sel),
        .grant(grant)
    );


    //开关传输(ST)
    crossbar u_crossbar (
        .clk(clk),
        .rst(rst),
        .data_in(inport_data),
        .grant(grant),
        .data_out(outport_data)
    );
endmodule
