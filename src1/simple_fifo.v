module simple_fifo #(
    parameter int DATA_WIDTH = 64,
    parameter int DEPTH = 4,
    parameter int ALMOST_EMPTY_THRESH = 1,
    parameter int ALMOST_FULL_THRESH  = 1
) (
    input  logic                 clk,
    input  logic                 rst,
    input  logic                 wr_en,
    input  logic                 rd_en,
    input  logic [DATA_WIDTH-1:0] din,
    output logic [DATA_WIDTH-1:0] dout,
    output logic                 empty,
    output logic                 full,
    output logic                 almost_empty,
    output logic                 almost_full
);
    localparam int ADDR_WIDTH = $clog2(DEPTH);
    logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];
    logic [ADDR_WIDTH-1:0] wptr, rptr;
    logic [ADDR_WIDTH:0]   count;

    // 写操作
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            wptr <= 0;
        end else if (wr_en && !full) begin
            mem[wptr] <= din;
            wptr <= wptr + 1;
        end
    end

    // 读操作
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            rptr <= 0;
        end else if (rd_en && !empty) begin
            rptr <= rptr + 1;
        end
    end

    // 计数器
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
        end else begin
            case ({wr_en && !full, rd_en && !empty})
                2'b10: count <= count + 1;
                2'b01: count <= count - 1;
                default: count <= count;
            endcase
        end
    end

    // 输出数据
    assign dout = mem[rptr];
    assign empty = (count == 0);
    assign full  = (count == DEPTH);
    assign almost_empty = (count <= ALMOST_EMPTY_THRESH);
    assign almost_full  = (count >= (DEPTH - ALMOST_FULL_THRESH));
endmodule
