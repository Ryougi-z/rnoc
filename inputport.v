module inputport #(
    parameter int DATA_WIDTH = 64,
    parameter int FIFO_DEPTH = 4,
    parameter int FLIT_WIDRH = 76
) (
    input  logic                  clk,
    input  logic                  rst,
    input  logic                  grant,         // 来自sw_alloc的仲裁信号
    input  logic [DATA_WIDTH-1:0] Flit_in,       // 输入数据
    input  logic [3:0]            xaddr,         // 目标X坐标
    input  logic [3:0]            yaddr,         // 目标Y坐标
    output logic                  sw_req,        // 送给sw_alloc的请求信号
    output logic [DATA_WIDTH-1:0] Flit_out,      // 输出到crossbar的数据
    output logic [FIFO_DEPTH-1:0]     port_req       // 每个虚拟通道的请求信号
);

    logic [DATA_WIDTH-1:0] fifo_dout   [FIFO_DEPTH-1:0];
    logic                  fifo_empty  [FIFO_DEPTH-1:0];
    logic                  fifo_full   [FIFO_DEPTH-1:0];
    logic                  fifo_rd_en  [FIFO_DEPTH-1:0];
    logic                  fifo_wr_en  [FIFO_DEPTH-1:0];
    logic                  almost_empty [FIFO_DEPTH-1:0];
    logic                  almost_full  [FIFO_DEPTH-1:0];

    // 实例化4个FIFO
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

    //写入FIFO 读出FIFO逻辑选择
    // 选择哪个VC输出
    logic [$clog2(FIFO_DEPTH)-1:0] vc_sel;
    // VC选择逻辑（可根据XY路由算法实现，这里简单用xaddr/yaddr最低位做示例）
    always_comb begin
        vc_sel = {xaddr[0], yaddr[0]}; // 示例：可替换为更复杂的路由算法
    end

    // 写入FIFO
    always_comb begin
        for (int i = 0; i < FIFO_DEPTH; i++) begin
            fifo_wr_en[i] = (vc_sel == i) && !fifo_full[i]
        end
    end

    // 读出FIFO
    always_comb begin
        for (int i = 0; i < FIFO_DEPTH; i++) begin
            fifo_rd_en[i] = (grant && (vc_sel == i) && !fifo_empty[i]);
        end
    end

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
