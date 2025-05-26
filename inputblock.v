// inputblock.v
// 实例化五个inputport模块，分别对应五个输入方向

module inputblock #(
    parameter int DATA_WIDTH = 64,
    parameter int FIFO_DEPTH = 5,
    parameter int FLIT_WIDRH = 80
) (
    input  logic                  clk,
    input  logic                  rst,
    input  logic [DATA_WIDTH-1:0] Flit_in [4:0],   // 五个方向输入
    input  logic [2:0]            VCx     [4:0],   // 五个方向VCx
    output logic [DATA_WIDTH-1:0] Flit_out[4:0],   // 五个方向输出
    output logic                  sw_req  [4:0],   // 五个方向请求
    output logic [FIFO_DEPTH-1:0] port_req[4:0]    // 五个方向VC请求
);
    genvar i;
    generate
        for (i = 0; i < 5; i = i + 1) begin: gen_inputport
            inputport #(
                .DATA_WIDTH(DATA_WIDTH),
                .FIFO_DEPTH(FIFO_DEPTH),
                .FLIT_WIDRH(FLIT_WIDRH)
            ) u_inputport (
                .clk(clk),
                .rst(rst),
                .Flit_in(Flit_in[i]),
                .VCx(VCx[i]),
                .Flit_out(Flit_out[i]),
                .sw_req(sw_req[i]),
                .port_req(port_req[i])
            );
        end
    endgenerate
endmodule
