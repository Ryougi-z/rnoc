module inputport #(
    parameter int DATA_WIDTH = 64,
    parameter int FIFO_DEPTH = 5,
    parameter int FLIT_WIDRH = 76
) (
    input  logic                  clk,
    input  logic                  rst,
    input  logic [DATA_WIDTH-1:0] Flit_in,       // 输入数据
    input  logic [FIFO_DEPTH-1:0]            vcx_in,           //输入VCx
    input  logic [2:0]            nxt_hop,       //RC输入的路由信息

    output logic             sw_req,        // 送给sw_alloc的请求信号
    output logic [FIFO_DEPTH-1:0]           vcx_out,
    output logic [DATA_WIDTH-1:0] Flit_out,      // 输出到crossbar的数据
    output logic [FIFO_DEPTH-1:0]     port_req       // 每个虚拟通道的请求信号
); //BW

    logic [DATA_WIDTH-1:0] fifo_dout   [FIFO_DEPTH-1:0];
    logic                  fifo_empty  [FIFO_DEPTH-1:0];
    logic                  fifo_full   [FIFO_DEPTH-1:0];
    logic                  fifo_rd_en  [FIFO_DEPTH-1:0];
    logic                  fifo_wr_en  [FIFO_DEPTH-1:0];
    logic                  almost_empty [FIFO_DEPTH-1:0];
    logic                  almost_full  [FIFO_DEPTH-1:0];

    // 实例化5个FIFO
    generate
        for (genvar i = 0; i < FIFO_DEPTH; i = i + 1) begin: gen_fifo
            simple_fifo #(
                .DATA_WIDTH(DATA_WIDTH),
                .DEPTH(FIFO_DEPTH)
            ) u_fifo (
                .clk(clk),
                .rst(rst),
                .wr_en(fifo_wr_en[i]),
                .rd_en(fifo_rd_en[i]),
                .din(Flit_in),
                .dout(fifo_dout[i]),
                .empty(fifo_empty[i]),
                .full(fifo_full[i]),
                .almost_empty(almost_empty[i]),
                .almost_full(almost_full[i])
            );
        end
    endgenerate

    // 写入FIFO
    always @(posedge clk or reset)begin
        if(!reset)
            fifo_wr_en <= 0;
        else
            fifo_wr_en <= vcx_in;
    end

    reg [4:0]vc_req;
    always @(posedge clk or reset)begin
        if(!reset)
            almost_empty <= 0;
        else
            vc_req <= !almost_empty;
    end

    rr_arbiter u_rr_arbiter(
        .clk(clk),
        .rst(rst),
        .req(vc_req),
        .grant(grant),
        .grant_idx(grant_idx)
    )

    wire [2:0] id_x;
    wire [2:0] id_y;
    wire [2:0] dst_x;
    wire [2:0] dst_y;
    assign id_x = Flit_in[7:9];
    assign id_y = Flit_in[10:12];
    assign dst_x = Flit_in[7:9];
    assign dst_y = Flit_in[10:12];

    reg [2:0] route_sel;
    router_calc u_router_calc(
        .id_x(id_x),
        .id_y(id_y),
        .dst_x(dst_x),
        .dst_y(dst_y),
        .route_sel(route_sel)
    )
    


    // 端口请求信号
    always_comb begin
        for (int i = 0; i < FIFO_DEPTH; i++) begin
            port_req[i] = !fifo_empty[i];
        end
    end





    // sw_req信号：只要有任一VC非空即可请求
    assign sw_req = |port_req;

    // 输出数据选择
    assign Flit_out = fifo_dout[vc_sel];


endmodule
