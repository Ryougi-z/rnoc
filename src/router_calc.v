module router_calc #(
    parameter int X_WIDTH = 2,
    parameter int Y_WIDTH = 2
) (
    input  logic [X_WIDTH-1:0] id_x,
    input  logic [Y_WIDTH-1:0] id_y,
    input  logic [X_WIDTH-1:0] dst_x,
    input  logic [Y_WIDTH-1:0] dst_y,
    output logic [2:0] route_sel // 3位编码：000=本地，001=X+，010=X-，011=Y+，100=Y-
);
    always_comb begin
        if (dst_x > id_x)
            route_sel = 3'b001; // X+
        else if (dst_x < id_x)
            route_sel = 3'b010; // X-
        else if (dst_y > id_y)
            route_sel = 3'b011; // Y+
        else if (dst_y < id_y)
            route_sel = 3'b100; // Y-
        else
            route_sel = 3'b000; // local
    end
endmodule
