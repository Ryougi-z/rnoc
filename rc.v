module rc #(
    parameter int x_size = 4,
    parameter int y_size = 4
) (
    input logic [$clog2(x_size)-1:0] id_x,
    input logic [$clog2(y_size)-1:0] id_y,
    input logic [2:0] dst_x [0:4],
    input logic [2:0] dst_y [0:4],
    output logic [2:0] route_sel [0:4]
);

    genvar k;
    generate
        for (k = 0; k < 5; k = k + 1) begin: gen_router_calc
            router_calc u_router_calc (
                .id_x(id_x),
                .id_y(id_y),
                .dst_x(dst_x[k]),
                .dst_y(dst_y[k]),
                .route_sel(route_sel[k])
            );
        end
    endgenerate

endmodule
