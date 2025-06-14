/* energy estimation module for a router */
`timescale 1ns/10ps
`include "defines.v"

module noc_test;
    noc noc();
endmodule

module noc;

parameter ENABLE = 1;
parameter STEP   = 5.0;
parameter STREAM = __NUM_STREAM__;

integer i, j;
integer count, seed, flag;
reg clk, rst_;

/* port0 */
reg     [`DATAW:0]      idata_0;
reg                     ivalid_0;
reg     [`VCHW:0]       ivch_0;
wire    [`VCH:0]        ordy_0;
wire    [`VCH:0]        olck_0;
wire    [`DATAW:0]      odata_0;
wire                    ovalid_0;
wire    [`VCHW:0]       ovch_0;
reg     [`VCH:0]        iack_0;
reg     [`VCH:0]        ilck_0;

/* port1 */
reg     [`DATAW:0]      idata_1;
reg                     ivalid_1;
reg     [`VCHW:0]       ivch_1;
wire    [`VCH:0]        ordy_1;
wire    [`VCH:0]        olck_1;
wire    [`DATAW:0]      odata_1;
wire                    ovalid_1;
wire    [`VCHW:0]       ovch_1;
reg     [`VCH:0]        iack_1;
reg     [`VCH:0]        ilck_1;

/* port2 */
reg     [`DATAW:0]      idata_2;
reg                     ivalid_2;
reg     [`VCHW:0]       ivch_2;
wire    [`VCH:0]        ordy_2;
wire    [`VCH:0]        olck_2;
wire    [`DATAW:0]      odata_2;
wire                    ovalid_2;
wire    [`VCHW:0]       ovch_2;
reg     [`VCH:0]        iack_2;
reg     [`VCH:0]        ilck_2;

/* port3 */
reg     [`DATAW:0]      idata_3;
reg                     ivalid_3;
reg     [`VCHW:0]       ivch_3;
wire    [`VCH:0]        ordy_3;
wire    [`VCH:0]        olck_3;
wire    [`DATAW:0]      odata_3;
wire                    ovalid_3;
wire    [`VCHW:0]       ovch_3;
reg     [`VCH:0]        iack_3;
reg     [`VCH:0]        ilck_3;

/* port4 */
reg     [`DATAW:0]      idata_4;
reg                     ivalid_4;
reg     [`VCHW:0]       ivch_4;
wire    [`VCH:0]        ordy_4;
wire    [`VCH:0]        olck_4;
wire    [`DATAW:0]      odata_4;
wire                    ovalid_4;
wire    [`VCHW:0]       ovch_4;
reg     [`VCH:0]        iack_4;
reg     [`VCH:0]        ilck_4;

always #( STEP / 2 ) begin
        clk <= ~clk;
end
always #( STEP ) begin
        count = count + 1;
        seed  = seed  + 1;
end

router n0 (
        /* port0 */
        .idata_0  ( idata_0  ),
        .ivalid_0 ( ivalid_0 ),
        .ivch_0   ( ivch_0   ),
        .ordy_0   ( ordy_0   ),
        .olck_0   ( olck_0   ),
        .odata_0  ( odata_0  ),
        .ovalid_0 ( ovalid_0 ),
        .ovch_0   ( ovch_0   ),
        .iack_0   ( iack_0   ),
        .ilck_0   ( ilck_0   ),

        /* port1 */
        .idata_1  ( idata_1  ),
        .ivalid_1 ( ivalid_1 ),
        .ivch_1   ( ivch_1   ),
        .ordy_1   ( ordy_1   ),
        .olck_1   ( olck_1   ),
        .odata_1  ( odata_1  ),
        .ovalid_1 ( ovalid_1 ),
        .ovch_1   ( ovch_1   ),
        .iack_1   ( iack_1   ),
        .ilck_1   ( ilck_1   ),

        /* port2 */
        .idata_2  ( idata_2  ),
        .ivalid_2 ( ivalid_2 ),
        .ivch_2   ( ivch_2   ),
        .ordy_2   ( ordy_2   ),
        .olck_2   ( olck_2   ),
        .odata_2  ( odata_2  ),
        .ovalid_2 ( ovalid_2 ),
        .ovch_2   ( ovch_2   ),
        .iack_2   ( iack_2   ),
        .ilck_2   ( ilck_2   ),

        /* port3 */
        .idata_3  ( idata_3  ),
        .ivalid_3 ( ivalid_3 ),
        .ivch_3   ( ivch_3   ),
        .ordy_3   ( ordy_3   ),
        .olck_3   ( olck_3   ),
        .odata_3  ( odata_3  ),
        .ovalid_3 ( ovalid_3 ),
        .ovch_3   ( ovch_3   ),
        .iack_3   ( iack_3   ),
        .ilck_3   ( ilck_3   ),

        /* port4 */
        .idata_4  ( idata_4  ),
        .ivalid_4 ( ivalid_4 ),
        .ivch_4   ( ivch_4   ),
        .ordy_4   ( ordy_4   ),
        .olck_4   ( olck_4   ),
        .odata_4  ( odata_4  ),
        .ovalid_4 ( ovalid_4 ),
        .ovch_4   ( ovch_4   ),
        .iack_4   ( iack_4   ),
        .ilck_4   ( ilck_4   ),

        .my_xpos( 1 ),
        .my_ypos( 1 ),
        .clk  ( clk  ),
        .rst_ ( rst_ )
);

initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0,noc_test.noc.n0);
        $dumpoff;
        `ifdef __POST_PR__
        $sdf_annotate("router.sdf", noc_test.noc.n0, , "sdf.log", "MAXIMUM");
        `endif

        /* Initialization */
        #0
        clk     <= `High;
        rst_    <= `Enable_;
        count   = 0;
        flag    = 0;

        /* port0 */
        idata_0 <= `DATAW_P1'b0;
        ivalid_0<= `Disable;
        ivch_0  <= `VCHW_P1'b0;
        iack_0  <= `VCH_P1'hf;
        ilck_0  <= `VCH_P1'h0;

        /* port1 */
        idata_1 <= `DATAW_P1'b0;
        ivalid_1<= `Disable;
        ivch_1  <= `VCHW_P1'b0;
        iack_1  <= `VCH_P1'hf;
        ilck_1  <= `VCH_P1'h0;

        /* port2 */
        idata_2 <= `DATAW_P1'b0;
        ivalid_2<= `Disable;
        ivch_2  <= `VCHW_P1'b0;
        iack_2  <= `VCH_P1'hf;
        ilck_2  <= `VCH_P1'h0;

        /* port3 */
        idata_3 <= `DATAW_P1'b0;
        ivalid_3<= `Disable;
        ivch_3  <= `VCHW_P1'b0;
        iack_3  <= `VCH_P1'hf;
        ilck_3  <= `VCH_P1'h0;

        /* port4 */
        idata_4 <= `DATAW_P1'b0;
        ivalid_4<= `Disable;
        ivch_4  <= `VCHW_P1'b0;
        iack_4  <= `VCH_P1'hf;
        ilck_4  <= `VCH_P1'h0;


        #(STEP)
        #(STEP / 2)
        rst_    <= `Disable_;
        #(STEP)

        $write("Start clock %d \n", count);
        $dumpon;
        flag  = 1;

        for (i = 0; i < 100; i = i + 1) begin
                forward_packet( STREAM, 4, ENABLE );
                #(STEP*7)         // Link utilization 4/13=0.30
                $write("------------------------\n");
        end
        flag = 0;

        #(STEP)
        $write("Stop clock %d \n", count);
        $dumpoff;
        $finish;
end

task forward_packet;
input [31:0] n;
input [31:0] len;
input [31:0] enable;
reg   [31:0] ran0;
reg   [31:0] ran1;
reg   [31:0] ran2;
reg   [31:0] ran3;
begin
        /* Initialization */
        if ( n > 0 && enable == 1 ) begin
                idata_0 <= {`TYPE_HEAD, 32'h09};
                ivalid_0<= `Enable;
        end
        if ( n > 1 && enable == 1 ) begin
                idata_1 <= {`TYPE_HEAD, 32'h04};
                ivalid_1<= `Enable;
        end
        if ( n > 2 && enable == 1 ) begin
                idata_2 <= {`TYPE_HEAD, 32'h01};
                ivalid_2<= `Enable;
        end
        if ( n > 3 && enable == 1 ) begin
                idata_3 <= {`TYPE_HEAD, 32'h06};
                ivalid_3<= `Enable;
        end
        if ( n > 4 && enable == 1 ) begin
                idata_4 <= {`TYPE_HEAD, 32'h05};
                ivalid_4<= `Enable;
        end

        /* Packet transfer */
        for (j = 0; j < len; j = j + 1) begin
                ran0 <= $random(seed);
                ran1 <= $random(seed);
                ran2 <= $random(seed);
                ran3 <= $random(seed);
                #(STEP)
                if ( n > 0 && enable == 1 )
                        idata_0 <= {`TYPE_DATA, ran0};
                if ( n > 1 && enable == 1 )
                        idata_1 <= {`TYPE_DATA, ran0};
                if ( n > 2 && enable == 1 )
                        idata_2 <= {`TYPE_DATA, ran0};
                if ( n > 3 && enable == 1 )
                        idata_3 <= {`TYPE_DATA, ran0};
                if ( n > 4 && enable == 1 )
                        idata_4 <= {`TYPE_DATA, ran0};
        end
        ran0 <= $random(seed);
        ran1 <= $random(seed);
        ran2 <= $random(seed);
        ran3 <= $random(seed);
        #(STEP)
        if ( n > 0 && enable == 1 )
                idata_0 <= {`TYPE_TAIL, ran0};
        if ( n > 1 && enable == 1 )
                idata_1 <= {`TYPE_TAIL, ran0};
        if ( n > 2 && enable == 1 )
                idata_2 <= {`TYPE_TAIL, ran0};
        if ( n > 3 && enable == 1 )
                idata_3 <= {`TYPE_TAIL, ran0};
        if ( n > 4 && enable == 1 )
                idata_4 <= {`TYPE_TAIL, ran0};
        #(STEP)
        idata_0 <= {`TYPE_NONE, 32'h0};
        ivalid_0<= `Disable;
        idata_1 <= {`TYPE_NONE, 32'h0};
        ivalid_1<= `Disable;
        idata_2 <= {`TYPE_NONE, 32'h0};
        ivalid_2<= `Disable;
        idata_3 <= {`TYPE_NONE, 32'h0};
        ivalid_3<= `Disable;
        idata_4 <= {`TYPE_NONE, 32'h0};
        ivalid_4<= `Disable;
end
endtask

always #( STEP ) begin
        //$write("i0={%x,%x}", idata_0, ivalid_0);
        $write("o0={%x,%x}", odata_0, ovalid_0);
        $write("o1={%x,%x}", odata_1, ovalid_1);
        $write("o2={%x,%x}", odata_2, ovalid_2);
        $write("o3={%x,%x}", odata_3, ovalid_3);
        $write("o4={%x,%x}", odata_4, ovalid_4);
        $write("\n");
end
endmodule
