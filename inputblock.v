// inputblock.v
// 实例化五个inputport模块，分别对应五个输入方向

module inputblock #(
    parameter int DATA_WIDTH = 64,
    parameter int FIFO_NUM = 5,
    parameter int FLIT_WIDRH = 80
) (
    input  logic                        clk            ,
    input  logic                        rst            ,
    input  logic [DATA_WIDTH-1:0]       Flit_in [0:4]  ,   // 五个方向输入
    output logic [$clog2(FIFO_NUM)-1:0] vc_req [0:4]   ,
    output logic [DATA_WIDTH-1:0]       buffer_out[0:4],   // 五个方向输出
    // RC模块信号
    outpur logic [1:0]                  dst_x   [0:4]  ,
    outpur logic [1:0]                  dst_y   [0:4]
);
    wire [2:0] vcx_in[0:4];

    genvar j;
    generate
        for (j = 0; j < 5; j = j + 1) begin: gen_vcx_in
            assign vcx_in[j] = Flit_in[j][15:11];
        end
    endgenerate

    genvar k;
    generate
        for (k = 0; k < 5; k = k + 1) begin: gen_dst
            assign dst_x[k] = Flit_in[k][8:7];
            assign dst_x[k] = Flit_in[k][10:9];
        end
    endgenerate

    genvar i;
    generate
        for (i = 0; i < 5; i = i + 1) begin: gen_inputport
            inputport #(
                .DATA_WIDTH(DATA_WIDTH),
                .FIFO_NUM(FIFO_NUM),
                .FLIT_WIDRH(FLIT_WIDRH)
            ) u_inputport (
                .clk(clk),
                .rst(rst),
                .Flit_in(Flit_in[i]),
                .vcx_in(vcx_in[i]),
                .buffer_out(buffer_out[i]),
                .vc_req(vc_req[i])
            );
        end
    endgenerate
endmodule
