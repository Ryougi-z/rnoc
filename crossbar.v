// 5x5 crossbar for NoC router
module crossbar #(
    parameter int FLIT_WIDTH = 76,
    parameter int PORT_NUM = 5
) (
    input  logic                   clk,
    input  logic                   rst,
    input  logic [FLIT_WIDTH-1:0]  data_in [PORT_NUM-1:0], // 5 input ports
    input  logic [PORT_NUM-1:0]    grant,                  // 5-bit one-hot, which input to which output
    output logic [FLIT_WIDTH-1:0]  data_out [PORT_NUM-1:0] // 5 output ports
);
    // grant[i]为1时，data_in[i]连接到data_out[i]
    always_comb begin
        for (int i = 0; i < PORT_NUM; i++) begin
            if (grant[i])
                data_out[i] = data_in[i];
            else
                data_out[i] = '0;
        end
    end
endmodule
