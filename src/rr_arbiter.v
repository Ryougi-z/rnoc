// Round Robin Arbiter for N requesters
module rr_arbiter #(
    parameter int N = 5
) (
    input  logic        clk,
    input  logic        rst,
    input  logic [N-1:0] req,    // 请求信号
    output logic [N-1:0] grant,  // 授权信号，one-hot
    output logic [$clog2(N)-1:0] grant_idx // 授权编号
);
    logic [$clog2(N)-1:0] last_grant;
    integer i;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            last_grant <= 0;
        end else if (|grant) begin
            for (i = 0; i < N; i = i + 1) begin
                if (grant[i])
                    last_grant <= i;
            end
        end
    end

    always_comb begin
        grant = '0;
        grant_idx = 0;
        for (i = 1; i <= N; i = i + 1) begin
            int idx = (last_grant + i) % N;
            if (req[idx]) begin
                grant[idx] = 1'b1;
                grant_idx = idx;
                break;
            end
        end
    end
endmodule
