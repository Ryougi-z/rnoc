module inputport #(
    parameter int DATA_WIDTH = 64,
    parameter int FIFO_NUM = 5,
    parameter int FLIT_WIDTH = 80
) (
    input  logic                          clk,
    input  logic                          rst,
    input  logic [FLIT_WIDTH-1:0]         Flit_in,       // 输入数据
    input  logic [FIFO_NUM-1:0]           vcx_in,        //输入VCx

    output logic [FIFO_NUM-1:0]           buffer_out,    // 输出到crossbar的数据
    output logic [$clog2(FIFO_NUM)-1:0]   vc_req         // 仲裁获胜虚拟通道
);

    logic [FLIT_WIDTH-1:0] fifo_dout  [0:FIFO_NUM-1];
    logic [FIFO_NUM-1:0]   fifo_empty   ;
    logic [FIFO_NUM-1:0]   fifo_full    ;
    logic [FIFO_NUM-1:0]   fifo_rd_en   ;
    logic [FIFO_NUM-1:0]   fifo_wr_en   ;
    logic [FIFO_NUM-1:0]   almost_empty ;
    logic [FIFO_NUM-1:0]   almost_full  ;

    // 实例化5个FIFO
    generate
        for (genvar i = 0; i < FIFO_NUM; i = i + 1) begin: gen_fifo
            simple_fifo #(
                .DATA_WIDTH(DATA_WIDTH),
                .DEPTH(4)
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

    // 写入FIFO vcx仲裁
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

    //读出FIFO 轮询仲裁
    reg [FIFO_NUM-1:0] grant;
    rr_arbiter u_rr_arbiter#(
        .N(FIFO_NUM)
    )(
        .clk(clk),
        .rst(rst),
        .req(vc_req),
        .grant(grant),
        .grant_idx(vc_req)
    )

    // 输出数据选择
    assign buffer_out = fifo_dout[vc_req];


endmodule
