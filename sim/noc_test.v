/* test module for noc.v */
`include "defines.v"
`timescale 1ns/10ps

module noc_test;

parameter STEP  = 5.0;
parameter ARRAY = 4;

integer counter, stop, total_sent, total_recv;
reg clk, rst_, ready;

/* n0 */
reg     [`DATAW:0]      n0_idata_p0;
reg                     n0_ivalid_p0;
reg     [`VCHW:0]       n0_ivch_p0;
wire    [`VCH:0]        n0_ordy_p0;
wire    [`DATAW:0]      n0_odata_p0;
wire                    n0_ovalid_p0;
integer                 n0_sent, n0_recv;

/* n1 */
reg     [`DATAW:0]      n1_idata_p0;
reg                     n1_ivalid_p0;
reg     [`VCHW:0]       n1_ivch_p0;
wire    [`VCH:0]        n1_ordy_p0;
wire    [`DATAW:0]      n1_odata_p0;
wire                    n1_ovalid_p0;
integer                 n1_sent, n1_recv;

/* n2 */
reg     [`DATAW:0]      n2_idata_p0;
reg                     n2_ivalid_p0;
reg     [`VCHW:0]       n2_ivch_p0;
wire    [`VCH:0]        n2_ordy_p0;
wire    [`DATAW:0]      n2_odata_p0;
wire                    n2_ovalid_p0;
integer                 n2_sent, n2_recv;

/* n3 */
reg     [`DATAW:0]      n3_idata_p0;
reg                     n3_ivalid_p0;
reg     [`VCHW:0]       n3_ivch_p0;
wire    [`VCH:0]        n3_ordy_p0;
wire    [`DATAW:0]      n3_odata_p0;
wire                    n3_ovalid_p0;
integer                 n3_sent, n3_recv;

/* n4 */
reg     [`DATAW:0]      n4_idata_p0;
reg                     n4_ivalid_p0;
reg     [`VCHW:0]       n4_ivch_p0;
wire    [`VCH:0]        n4_ordy_p0;
wire    [`DATAW:0]      n4_odata_p0;
wire                    n4_ovalid_p0;
integer                 n4_sent, n4_recv;

/* n5 */
reg     [`DATAW:0]      n5_idata_p0;
reg                     n5_ivalid_p0;
reg     [`VCHW:0]       n5_ivch_p0;
wire    [`VCH:0]        n5_ordy_p0;
wire    [`DATAW:0]      n5_odata_p0;
wire                    n5_ovalid_p0;
integer                 n5_sent, n5_recv;

/* n6 */
reg     [`DATAW:0]      n6_idata_p0;
reg                     n6_ivalid_p0;
reg     [`VCHW:0]       n6_ivch_p0;
wire    [`VCH:0]        n6_ordy_p0;
wire    [`DATAW:0]      n6_odata_p0;
wire                    n6_ovalid_p0;
integer                 n6_sent, n6_recv;

/* n7 */
reg     [`DATAW:0]      n7_idata_p0;
reg                     n7_ivalid_p0;
reg     [`VCHW:0]       n7_ivch_p0;
wire    [`VCH:0]        n7_ordy_p0;
wire    [`DATAW:0]      n7_odata_p0;
wire                    n7_ovalid_p0;
integer                 n7_sent, n7_recv;

/* n8 */
reg     [`DATAW:0]      n8_idata_p0;
reg                     n8_ivalid_p0;
reg     [`VCHW:0]       n8_ivch_p0;
wire    [`VCH:0]        n8_ordy_p0;
wire    [`DATAW:0]      n8_odata_p0;
wire                    n8_ovalid_p0;
integer                 n8_sent, n8_recv;

/* n9 */
reg     [`DATAW:0]      n9_idata_p0;
reg                     n9_ivalid_p0;
reg     [`VCHW:0]       n9_ivch_p0;
wire    [`VCH:0]        n9_ordy_p0;
wire    [`DATAW:0]      n9_odata_p0;
wire                    n9_ovalid_p0;
integer                 n9_sent, n9_recv;

/* n10 */
reg     [`DATAW:0]      n10_idata_p0;
reg                     n10_ivalid_p0;
reg     [`VCHW:0]       n10_ivch_p0;
wire    [`VCH:0]        n10_ordy_p0;
wire    [`DATAW:0]      n10_odata_p0;
wire                    n10_ovalid_p0;
integer                 n10_sent, n10_recv;

/* n11 */
reg     [`DATAW:0]      n11_idata_p0;
reg                     n11_ivalid_p0;
reg     [`VCHW:0]       n11_ivch_p0;
wire    [`VCH:0]        n11_ordy_p0;
wire    [`DATAW:0]      n11_odata_p0;
wire                    n11_ovalid_p0;
integer                 n11_sent, n11_recv;

/* n12 */
reg     [`DATAW:0]      n12_idata_p0;
reg                     n12_ivalid_p0;
reg     [`VCHW:0]       n12_ivch_p0;
wire    [`VCH:0]        n12_ordy_p0;
wire    [`DATAW:0]      n12_odata_p0;
wire                    n12_ovalid_p0;
integer                 n12_sent, n12_recv;

/* n13 */
reg     [`DATAW:0]      n13_idata_p0;
reg                     n13_ivalid_p0;
reg     [`VCHW:0]       n13_ivch_p0;
wire    [`VCH:0]        n13_ordy_p0;
wire    [`DATAW:0]      n13_odata_p0;
wire                    n13_ovalid_p0;
integer                 n13_sent, n13_recv;

/* n14 */
reg     [`DATAW:0]      n14_idata_p0;
reg                     n14_ivalid_p0;
reg     [`VCHW:0]       n14_ivch_p0;
wire    [`VCH:0]        n14_ordy_p0;
wire    [`DATAW:0]      n14_odata_p0;
wire                    n14_ovalid_p0;
integer                 n14_sent, n14_recv;

/* n15 */
reg     [`DATAW:0]      n15_idata_p0;
reg                     n15_ivalid_p0;
reg     [`VCHW:0]       n15_ivch_p0;
wire    [`VCH:0]        n15_ordy_p0;
wire    [`DATAW:0]      n15_odata_p0;
wire                    n15_ovalid_p0;
integer                 n15_sent, n15_recv;

noc noc (
        /* n0 */
        .n0_idata_p0 ( n0_idata_p0  ),
        .n0_ivalid_p0( n0_ivalid_p0 ),
        .n0_ivch_p0  ( n0_ivch_p0   ),
        .n0_ordy_p0  ( n0_ordy_p0   ),
        .n0_odata_p0 ( n0_odata_p0  ),
        .n0_ovalid_p0( n0_ovalid_p0 ),

        /* n1 */
        .n1_idata_p0 ( n1_idata_p0  ),
        .n1_ivalid_p0( n1_ivalid_p0 ),
        .n1_ivch_p0  ( n1_ivch_p0   ),
        .n1_ordy_p0  ( n1_ordy_p0   ),
        .n1_odata_p0 ( n1_odata_p0  ),
        .n1_ovalid_p0( n1_ovalid_p0 ),

        /* n2 */
        .n2_idata_p0 ( n2_idata_p0  ),
        .n2_ivalid_p0( n2_ivalid_p0 ),
        .n2_ivch_p0  ( n2_ivch_p0   ),
        .n2_ordy_p0  ( n2_ordy_p0   ),
        .n2_odata_p0 ( n2_odata_p0  ),
        .n2_ovalid_p0( n2_ovalid_p0 ),

        /* n3 */
        .n3_idata_p0 ( n3_idata_p0  ),
        .n3_ivalid_p0( n3_ivalid_p0 ),
        .n3_ivch_p0  ( n3_ivch_p0   ),
        .n3_ordy_p0  ( n3_ordy_p0   ),
        .n3_odata_p0 ( n3_odata_p0  ),
        .n3_ovalid_p0( n3_ovalid_p0 ),

        /* n4 */
        .n4_idata_p0 ( n4_idata_p0  ),
        .n4_ivalid_p0( n4_ivalid_p0 ),
        .n4_ivch_p0  ( n4_ivch_p0   ),
        .n4_ordy_p0  ( n4_ordy_p0   ),
        .n4_odata_p0 ( n4_odata_p0  ),
        .n4_ovalid_p0( n4_ovalid_p0 ),

        /* n5 */
        .n5_idata_p0 ( n5_idata_p0  ),
        .n5_ivalid_p0( n5_ivalid_p0 ),
        .n5_ivch_p0  ( n5_ivch_p0   ),
        .n5_ordy_p0  ( n5_ordy_p0   ),
        .n5_odata_p0 ( n5_odata_p0  ),
        .n5_ovalid_p0( n5_ovalid_p0 ),

        /* n6 */
        .n6_idata_p0 ( n6_idata_p0  ),
        .n6_ivalid_p0( n6_ivalid_p0 ),
        .n6_ivch_p0  ( n6_ivch_p0   ),
        .n6_ordy_p0  ( n6_ordy_p0   ),
        .n6_odata_p0 ( n6_odata_p0  ),
        .n6_ovalid_p0( n6_ovalid_p0 ),

        /* n7 */
        .n7_idata_p0 ( n7_idata_p0  ),
        .n7_ivalid_p0( n7_ivalid_p0 ),
        .n7_ivch_p0  ( n7_ivch_p0   ),
        .n7_ordy_p0  ( n7_ordy_p0   ),
        .n7_odata_p0 ( n7_odata_p0  ),
        .n7_ovalid_p0( n7_ovalid_p0 ),

        /* n8 */
        .n8_idata_p0 ( n8_idata_p0  ),
        .n8_ivalid_p0( n8_ivalid_p0 ),
        .n8_ivch_p0  ( n8_ivch_p0   ),
        .n8_ordy_p0  ( n8_ordy_p0   ),
        .n8_odata_p0 ( n8_odata_p0  ),
        .n8_ovalid_p0( n8_ovalid_p0 ),

        /* n9 */
        .n9_idata_p0 ( n9_idata_p0  ),
        .n9_ivalid_p0( n9_ivalid_p0 ),
        .n9_ivch_p0  ( n9_ivch_p0   ),
        .n9_ordy_p0  ( n9_ordy_p0   ),
        .n9_odata_p0 ( n9_odata_p0  ),
        .n9_ovalid_p0( n9_ovalid_p0 ),

        /* n10 */
        .n10_idata_p0 ( n10_idata_p0  ),
        .n10_ivalid_p0( n10_ivalid_p0 ),
        .n10_ivch_p0  ( n10_ivch_p0   ),
        .n10_ordy_p0  ( n10_ordy_p0   ),
        .n10_odata_p0 ( n10_odata_p0  ),
        .n10_ovalid_p0( n10_ovalid_p0 ),

        /* n11 */
        .n11_idata_p0 ( n11_idata_p0  ),
        .n11_ivalid_p0( n11_ivalid_p0 ),
        .n11_ivch_p0  ( n11_ivch_p0   ),
        .n11_ordy_p0  ( n11_ordy_p0   ),
        .n11_odata_p0 ( n11_odata_p0  ),
        .n11_ovalid_p0( n11_ovalid_p0 ),

        /* n12 */
        .n12_idata_p0 ( n12_idata_p0  ),
        .n12_ivalid_p0( n12_ivalid_p0 ),
        .n12_ivch_p0  ( n12_ivch_p0   ),
        .n12_ordy_p0  ( n12_ordy_p0   ),
        .n12_odata_p0 ( n12_odata_p0  ),
        .n12_ovalid_p0( n12_ovalid_p0 ),

        /* n13 */
        .n13_idata_p0 ( n13_idata_p0  ),
        .n13_ivalid_p0( n13_ivalid_p0 ),
        .n13_ivch_p0  ( n13_ivch_p0   ),
        .n13_ordy_p0  ( n13_ordy_p0   ),
        .n13_odata_p0 ( n13_odata_p0  ),
        .n13_ovalid_p0( n13_ovalid_p0 ),

        /* n14 */
        .n14_idata_p0 ( n14_idata_p0  ),
        .n14_ivalid_p0( n14_ivalid_p0 ),
        .n14_ivch_p0  ( n14_ivch_p0   ),
        .n14_ordy_p0  ( n14_ordy_p0   ),
        .n14_odata_p0 ( n14_odata_p0  ),
        .n14_ovalid_p0( n14_ovalid_p0 ),

        /* n15 */
        .n15_idata_p0 ( n15_idata_p0  ),
        .n15_ivalid_p0( n15_ivalid_p0 ),
        .n15_ivch_p0  ( n15_ivch_p0   ),
        .n15_ordy_p0  ( n15_ordy_p0   ),
        .n15_odata_p0 ( n15_odata_p0  ),
        .n15_ovalid_p0( n15_ovalid_p0 ),

        .clk ( clk  ),
        .rst_( rst_ )
);

always #( STEP / 2) begin
        clk <= ~clk;
end
always #(STEP) begin
        counter = counter + 1;
end

initial begin
        /* Initialization */
        #0
        counter = 0;
        stop    = 200;
        clk     <= `High;
        ready   <= `Disable;
        /* Send/recv counters */
        n0_sent = 0; n0_recv = 0;
        n1_sent = 0; n1_recv = 0;
        n2_sent = 0; n2_recv = 0;
        n3_sent = 0; n3_recv = 0;
        n4_sent = 0; n4_recv = 0;
        n5_sent = 0; n5_recv = 0;
        n6_sent = 0; n6_recv = 0;
        n7_sent = 0; n7_recv = 0;
        n8_sent = 0; n8_recv = 0;
        n9_sent = 0; n9_recv = 0;
        n10_sent = 0; n10_recv = 0;
        n11_sent = 0; n11_recv = 0;
        n12_sent = 0; n12_recv = 0;
        n13_sent = 0; n13_recv = 0;
        n14_sent = 0; n14_recv = 0;
        n15_sent = 0; n15_recv = 0;
        #(STEP / 2)
        noc_reset;
        /* Now we can start simulation! */
        ready   <= `Enable;

        /* Waiting for the end of the simulation */
        while (counter < stop) begin
                #(STEP);
        end

        /* Statistics */
        total_sent = n0_sent + n1_sent + n2_sent + n3_sent + n4_sent + n5_sent + n6_sent + n7_sent + n8_sent + n9_sent + n10_sent + n11_sent + n12_sent + n13_sent + n14_sent + n15_sent;
        total_recv = n0_recv + n1_recv + n2_recv + n3_recv + n4_recv + n5_recv + n6_recv + n7_recv + n8_recv + n9_recv + n10_recv + n11_recv + n12_recv + n13_recv + n14_recv + n15_recv;
        $write("\n\n");
        $write("*** statistics (%d) *** \n", counter);
        $write("n0_sent %d \t n0_recv %d \n", n0_sent, n0_recv);
        $write("n1_sent %d \t n1_recv %d \n", n1_sent, n1_recv);
        $write("n2_sent %d \t n2_recv %d \n", n2_sent, n2_recv);
        $write("n3_sent %d \t n3_recv %d \n", n3_sent, n3_recv);
        $write("n4_sent %d \t n4_recv %d \n", n4_sent, n4_recv);
        $write("n5_sent %d \t n5_recv %d \n", n5_sent, n5_recv);
        $write("n6_sent %d \t n6_recv %d \n", n6_sent, n6_recv);
        $write("n7_sent %d \t n7_recv %d \n", n7_sent, n7_recv);
        $write("n8_sent %d \t n8_recv %d \n", n8_sent, n8_recv);
        $write("n9_sent %d \t n9_recv %d \n", n9_sent, n9_recv);
        $write("n10_sent %d \t n10_recv %d \n", n10_sent, n10_recv);
        $write("n11_sent %d \t n11_recv %d \n", n11_sent, n11_recv);
        $write("n12_sent %d \t n12_recv %d \n", n12_sent, n12_recv);
        $write("n13_sent %d \t n13_recv %d \n", n13_sent, n13_recv);
        $write("n14_sent %d \t n14_recv %d \n", n14_sent, n14_recv);
        $write("n15_sent %d \t n15_recv %d \n", n15_sent, n15_recv);
        $write("total_sent %d \t total_recv %d \n", total_sent, total_recv);
        $write("\n\n");
        $finish;
end

/* packet generator for n0 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 0 dst: 5 vch: 1 len: 4) *** \n");
        send_packet_0(5, 1, 4);
        $write("*** send (src: 0 dst: 10 vch: 1 len: 5) *** \n");
        send_packet_0(10, 1, 5);
        $write("*** send (src: 0 dst: 7 vch: 0 len: 2) *** \n");
        send_packet_0(7, 0, 2);
        $write("*** send (src: 0 dst: 5 vch: 0 len: 1) *** \n");
        send_packet_0(5, 0, 1);
        $write("*** send (src: 0 dst: 14 vch: 1 len: 3) *** \n");
        send_packet_0(14, 1, 3);
        $write("*** send (src: 0 dst: 9 vch: 0 len: 3) *** \n");
        send_packet_0(9, 0, 3);
        $write("*** send (src: 0 dst: 7 vch: 0 len: 5) *** \n");
        send_packet_0(7, 0, 5);
        $write("*** send (src: 0 dst: 3 vch: 0 len: 1) *** \n");
        send_packet_0(3, 0, 1);
        $write("*** send (src: 0 dst: 13 vch: 1 len: 2) *** \n");
        send_packet_0(13, 1, 2);
        $write("*** send (src: 0 dst: 6 vch: 1 len: 5) *** \n");
        send_packet_0(6, 1, 5);
        $write("*** send (src: 0 dst: 5 vch: 0 len: 1) *** \n");
        send_packet_0(5, 0, 1);
        $write("*** send (src: 0 dst: 1 vch: 1 len: 5) *** \n");
        send_packet_0(1, 1, 5);
        $write("*** send (src: 0 dst: 1 vch: 1 len: 4) *** \n");
        send_packet_0(1, 1, 4);
        $write("*** send (src: 0 dst: 7 vch: 0 len: 5) *** \n");
        send_packet_0(7, 0, 5);
        $write("*** send (src: 0 dst: 14 vch: 1 len: 2) *** \n");
        send_packet_0(14, 1, 2);
        $write("*** send (src: 0 dst: 3 vch: 0 len: 2) *** \n");
        send_packet_0(3, 0, 2);
        $write("*** send (src: 0 dst: 3 vch: 0 len: 4) *** \n");
        send_packet_0(3, 0, 4);
        $write("*** send (src: 0 dst: 13 vch: 1 len: 2) *** \n");
        send_packet_0(13, 1, 2);
        $write("*** send (src: 0 dst: 2 vch: 0 len: 2) *** \n");
        send_packet_0(2, 0, 2);
        $write("*** send (src: 0 dst: 7 vch: 0 len: 5) *** \n");
        send_packet_0(7, 0, 5);
        $write("*** send (src: 0 dst: 4 vch: 0 len: 1) *** \n");
        send_packet_0(4, 0, 1);
        $write("*** send (src: 0 dst: 2 vch: 1 len: 5) *** \n");
        send_packet_0(2, 1, 5);
        $write("*** send (src: 0 dst: 3 vch: 0 len: 3) *** \n");
        send_packet_0(3, 0, 3);
        $write("*** send (src: 0 dst: 10 vch: 0 len: 4) *** \n");
        send_packet_0(10, 0, 4);
        $write("*** send (src: 0 dst: 6 vch: 1 len: 3) *** \n");
        send_packet_0(6, 1, 3);
        $write("*** send (src: 0 dst: 14 vch: 1 len: 4) *** \n");
        send_packet_0(14, 1, 4);
        $write("*** send (src: 0 dst: 4 vch: 0 len: 5) *** \n");
        send_packet_0(4, 0, 5);
        $write("*** send (src: 0 dst: 3 vch: 1 len: 2) *** \n");
        send_packet_0(3, 1, 2);
        $write("*** send (src: 0 dst: 5 vch: 1 len: 2) *** \n");
        send_packet_0(5, 1, 2);
        $write("*** send (src: 0 dst: 14 vch: 1 len: 4) *** \n");
        send_packet_0(14, 1, 4);
        $write("*** send (src: 0 dst: 11 vch: 0 len: 2) *** \n");
        send_packet_0(11, 0, 2);
        $write("*** send (src: 0 dst: 10 vch: 1 len: 3) *** \n");
        send_packet_0(10, 1, 3);
end

/* packet generator for n1 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 1 dst: 2 vch: 0 len: 2) *** \n");
        send_packet_1(2, 0, 2);
        $write("*** send (src: 1 dst: 3 vch: 0 len: 3) *** \n");
        send_packet_1(3, 0, 3);
        $write("*** send (src: 1 dst: 9 vch: 1 len: 2) *** \n");
        send_packet_1(9, 1, 2);
        $write("*** send (src: 1 dst: 10 vch: 1 len: 1) *** \n");
        send_packet_1(10, 1, 1);
        $write("*** send (src: 1 dst: 12 vch: 0 len: 1) *** \n");
        send_packet_1(12, 0, 1);
        $write("*** send (src: 1 dst: 12 vch: 1 len: 4) *** \n");
        send_packet_1(12, 1, 4);
        $write("*** send (src: 1 dst: 9 vch: 0 len: 4) *** \n");
        send_packet_1(9, 0, 4);
        $write("*** send (src: 1 dst: 13 vch: 1 len: 5) *** \n");
        send_packet_1(13, 1, 5);
        $write("*** send (src: 1 dst: 7 vch: 1 len: 5) *** \n");
        send_packet_1(7, 1, 5);
        $write("*** send (src: 1 dst: 0 vch: 0 len: 5) *** \n");
        send_packet_1(0, 0, 5);
        $write("*** send (src: 1 dst: 13 vch: 1 len: 1) *** \n");
        send_packet_1(13, 1, 1);
        $write("*** send (src: 1 dst: 13 vch: 1 len: 1) *** \n");
        send_packet_1(13, 1, 1);
        $write("*** send (src: 1 dst: 13 vch: 0 len: 1) *** \n");
        send_packet_1(13, 0, 1);
        $write("*** send (src: 1 dst: 3 vch: 0 len: 2) *** \n");
        send_packet_1(3, 0, 2);
        $write("*** send (src: 1 dst: 0 vch: 1 len: 2) *** \n");
        send_packet_1(0, 1, 2);
        $write("*** send (src: 1 dst: 2 vch: 0 len: 4) *** \n");
        send_packet_1(2, 0, 4);
        $write("*** send (src: 1 dst: 6 vch: 1 len: 4) *** \n");
        send_packet_1(6, 1, 4);
        $write("*** send (src: 1 dst: 9 vch: 1 len: 3) *** \n");
        send_packet_1(9, 1, 3);
        $write("*** send (src: 1 dst: 14 vch: 0 len: 5) *** \n");
        send_packet_1(14, 0, 5);
        $write("*** send (src: 1 dst: 14 vch: 1 len: 2) *** \n");
        send_packet_1(14, 1, 2);
        $write("*** send (src: 1 dst: 0 vch: 1 len: 5) *** \n");
        send_packet_1(0, 1, 5);
        $write("*** send (src: 1 dst: 0 vch: 0 len: 1) *** \n");
        send_packet_1(0, 0, 1);
        $write("*** send (src: 1 dst: 8 vch: 0 len: 1) *** \n");
        send_packet_1(8, 0, 1);
        $write("*** send (src: 1 dst: 5 vch: 0 len: 1) *** \n");
        send_packet_1(5, 0, 1);
        $write("*** send (src: 1 dst: 3 vch: 1 len: 1) *** \n");
        send_packet_1(3, 1, 1);
        $write("*** send (src: 1 dst: 6 vch: 0 len: 1) *** \n");
        send_packet_1(6, 0, 1);
        $write("*** send (src: 1 dst: 0 vch: 0 len: 3) *** \n");
        send_packet_1(0, 0, 3);
        $write("*** send (src: 1 dst: 0 vch: 0 len: 4) *** \n");
        send_packet_1(0, 0, 4);
        $write("*** send (src: 1 dst: 11 vch: 0 len: 4) *** \n");
        send_packet_1(11, 0, 4);
        $write("*** send (src: 1 dst: 11 vch: 1 len: 2) *** \n");
        send_packet_1(11, 1, 2);
        $write("*** send (src: 1 dst: 7 vch: 1 len: 4) *** \n");
        send_packet_1(7, 1, 4);
        $write("*** send (src: 1 dst: 7 vch: 0 len: 1) *** \n");
        send_packet_1(7, 0, 1);
end

/* packet generator for n2 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 2 dst: 10 vch: 1 len: 5) *** \n");
        send_packet_2(10, 1, 5);
        $write("*** send (src: 2 dst: 6 vch: 1 len: 1) *** \n");
        send_packet_2(6, 1, 1);
        $write("*** send (src: 2 dst: 13 vch: 1 len: 1) *** \n");
        send_packet_2(13, 1, 1);
        $write("*** send (src: 2 dst: 15 vch: 1 len: 5) *** \n");
        send_packet_2(15, 1, 5);
        $write("*** send (src: 2 dst: 15 vch: 1 len: 2) *** \n");
        send_packet_2(15, 1, 2);
        $write("*** send (src: 2 dst: 14 vch: 1 len: 3) *** \n");
        send_packet_2(14, 1, 3);
        $write("*** send (src: 2 dst: 9 vch: 1 len: 1) *** \n");
        send_packet_2(9, 1, 1);
        $write("*** send (src: 2 dst: 14 vch: 0 len: 5) *** \n");
        send_packet_2(14, 0, 5);
        $write("*** send (src: 2 dst: 9 vch: 1 len: 2) *** \n");
        send_packet_2(9, 1, 2);
        $write("*** send (src: 2 dst: 9 vch: 0 len: 3) *** \n");
        send_packet_2(9, 0, 3);
        $write("*** send (src: 2 dst: 4 vch: 0 len: 5) *** \n");
        send_packet_2(4, 0, 5);
        $write("*** send (src: 2 dst: 0 vch: 1 len: 4) *** \n");
        send_packet_2(0, 1, 4);
        $write("*** send (src: 2 dst: 10 vch: 1 len: 3) *** \n");
        send_packet_2(10, 1, 3);
        $write("*** send (src: 2 dst: 5 vch: 1 len: 3) *** \n");
        send_packet_2(5, 1, 3);
        $write("*** send (src: 2 dst: 11 vch: 0 len: 5) *** \n");
        send_packet_2(11, 0, 5);
        $write("*** send (src: 2 dst: 12 vch: 0 len: 2) *** \n");
        send_packet_2(12, 0, 2);
        $write("*** send (src: 2 dst: 8 vch: 0 len: 1) *** \n");
        send_packet_2(8, 0, 1);
        $write("*** send (src: 2 dst: 0 vch: 1 len: 2) *** \n");
        send_packet_2(0, 1, 2);
        $write("*** send (src: 2 dst: 1 vch: 1 len: 3) *** \n");
        send_packet_2(1, 1, 3);
        $write("*** send (src: 2 dst: 4 vch: 1 len: 1) *** \n");
        send_packet_2(4, 1, 1);
        $write("*** send (src: 2 dst: 0 vch: 0 len: 3) *** \n");
        send_packet_2(0, 0, 3);
        $write("*** send (src: 2 dst: 4 vch: 0 len: 2) *** \n");
        send_packet_2(4, 0, 2);
        $write("*** send (src: 2 dst: 1 vch: 0 len: 3) *** \n");
        send_packet_2(1, 0, 3);
        $write("*** send (src: 2 dst: 0 vch: 1 len: 5) *** \n");
        send_packet_2(0, 1, 5);
        $write("*** send (src: 2 dst: 15 vch: 1 len: 5) *** \n");
        send_packet_2(15, 1, 5);
        $write("*** send (src: 2 dst: 0 vch: 1 len: 5) *** \n");
        send_packet_2(0, 1, 5);
        $write("*** send (src: 2 dst: 1 vch: 0 len: 3) *** \n");
        send_packet_2(1, 0, 3);
        $write("*** send (src: 2 dst: 12 vch: 0 len: 3) *** \n");
        send_packet_2(12, 0, 3);
        $write("*** send (src: 2 dst: 9 vch: 1 len: 5) *** \n");
        send_packet_2(9, 1, 5);
        $write("*** send (src: 2 dst: 8 vch: 1 len: 1) *** \n");
        send_packet_2(8, 1, 1);
        $write("*** send (src: 2 dst: 4 vch: 1 len: 3) *** \n");
        send_packet_2(4, 1, 3);
        $write("*** send (src: 2 dst: 3 vch: 1 len: 4) *** \n");
        send_packet_2(3, 1, 4);
end

/* packet generator for n3 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 3 dst: 4 vch: 0 len: 5) *** \n");
        send_packet_3(4, 0, 5);
        $write("*** send (src: 3 dst: 11 vch: 0 len: 5) *** \n");
        send_packet_3(11, 0, 5);
        $write("*** send (src: 3 dst: 10 vch: 1 len: 3) *** \n");
        send_packet_3(10, 1, 3);
        $write("*** send (src: 3 dst: 8 vch: 0 len: 5) *** \n");
        send_packet_3(8, 0, 5);
        $write("*** send (src: 3 dst: 13 vch: 0 len: 5) *** \n");
        send_packet_3(13, 0, 5);
        $write("*** send (src: 3 dst: 6 vch: 1 len: 5) *** \n");
        send_packet_3(6, 1, 5);
        $write("*** send (src: 3 dst: 12 vch: 1 len: 4) *** \n");
        send_packet_3(12, 1, 4);
        $write("*** send (src: 3 dst: 12 vch: 1 len: 5) *** \n");
        send_packet_3(12, 1, 5);
        $write("*** send (src: 3 dst: 2 vch: 0 len: 1) *** \n");
        send_packet_3(2, 0, 1);
        $write("*** send (src: 3 dst: 11 vch: 1 len: 2) *** \n");
        send_packet_3(11, 1, 2);
        $write("*** send (src: 3 dst: 6 vch: 1 len: 5) *** \n");
        send_packet_3(6, 1, 5);
        $write("*** send (src: 3 dst: 6 vch: 1 len: 1) *** \n");
        send_packet_3(6, 1, 1);
        $write("*** send (src: 3 dst: 2 vch: 1 len: 1) *** \n");
        send_packet_3(2, 1, 1);
        $write("*** send (src: 3 dst: 9 vch: 1 len: 4) *** \n");
        send_packet_3(9, 1, 4);
        $write("*** send (src: 3 dst: 9 vch: 1 len: 2) *** \n");
        send_packet_3(9, 1, 2);
        $write("*** send (src: 3 dst: 7 vch: 0 len: 1) *** \n");
        send_packet_3(7, 0, 1);
        $write("*** send (src: 3 dst: 6 vch: 1 len: 4) *** \n");
        send_packet_3(6, 1, 4);
        $write("*** send (src: 3 dst: 7 vch: 0 len: 5) *** \n");
        send_packet_3(7, 0, 5);
        $write("*** send (src: 3 dst: 8 vch: 0 len: 5) *** \n");
        send_packet_3(8, 0, 5);
        $write("*** send (src: 3 dst: 12 vch: 0 len: 4) *** \n");
        send_packet_3(12, 0, 4);
        $write("*** send (src: 3 dst: 14 vch: 1 len: 4) *** \n");
        send_packet_3(14, 1, 4);
        $write("*** send (src: 3 dst: 9 vch: 0 len: 1) *** \n");
        send_packet_3(9, 0, 1);
        $write("*** send (src: 3 dst: 14 vch: 1 len: 1) *** \n");
        send_packet_3(14, 1, 1);
        $write("*** send (src: 3 dst: 7 vch: 0 len: 3) *** \n");
        send_packet_3(7, 0, 3);
        $write("*** send (src: 3 dst: 0 vch: 1 len: 1) *** \n");
        send_packet_3(0, 1, 1);
        $write("*** send (src: 3 dst: 15 vch: 0 len: 2) *** \n");
        send_packet_3(15, 0, 2);
        $write("*** send (src: 3 dst: 10 vch: 1 len: 2) *** \n");
        send_packet_3(10, 1, 2);
        $write("*** send (src: 3 dst: 1 vch: 1 len: 1) *** \n");
        send_packet_3(1, 1, 1);
        $write("*** send (src: 3 dst: 2 vch: 0 len: 1) *** \n");
        send_packet_3(2, 0, 1);
        $write("*** send (src: 3 dst: 9 vch: 0 len: 3) *** \n");
        send_packet_3(9, 0, 3);
        $write("*** send (src: 3 dst: 12 vch: 1 len: 4) *** \n");
        send_packet_3(12, 1, 4);
        $write("*** send (src: 3 dst: 8 vch: 1 len: 5) *** \n");
        send_packet_3(8, 1, 5);
end

/* packet generator for n4 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 4 dst: 1 vch: 1 len: 2) *** \n");
        send_packet_4(1, 1, 2);
        $write("*** send (src: 4 dst: 10 vch: 1 len: 4) *** \n");
        send_packet_4(10, 1, 4);
        $write("*** send (src: 4 dst: 10 vch: 0 len: 5) *** \n");
        send_packet_4(10, 0, 5);
        $write("*** send (src: 4 dst: 2 vch: 1 len: 1) *** \n");
        send_packet_4(2, 1, 1);
        $write("*** send (src: 4 dst: 15 vch: 1 len: 4) *** \n");
        send_packet_4(15, 1, 4);
        $write("*** send (src: 4 dst: 11 vch: 0 len: 2) *** \n");
        send_packet_4(11, 0, 2);
        $write("*** send (src: 4 dst: 8 vch: 0 len: 1) *** \n");
        send_packet_4(8, 0, 1);
        $write("*** send (src: 4 dst: 5 vch: 0 len: 1) *** \n");
        send_packet_4(5, 0, 1);
        $write("*** send (src: 4 dst: 13 vch: 1 len: 3) *** \n");
        send_packet_4(13, 1, 3);
        $write("*** send (src: 4 dst: 9 vch: 0 len: 2) *** \n");
        send_packet_4(9, 0, 2);
        $write("*** send (src: 4 dst: 6 vch: 0 len: 1) *** \n");
        send_packet_4(6, 0, 1);
        $write("*** send (src: 4 dst: 8 vch: 0 len: 5) *** \n");
        send_packet_4(8, 0, 5);
        $write("*** send (src: 4 dst: 3 vch: 0 len: 1) *** \n");
        send_packet_4(3, 0, 1);
        $write("*** send (src: 4 dst: 8 vch: 1 len: 5) *** \n");
        send_packet_4(8, 1, 5);
        $write("*** send (src: 4 dst: 5 vch: 0 len: 5) *** \n");
        send_packet_4(5, 0, 5);
        $write("*** send (src: 4 dst: 7 vch: 0 len: 3) *** \n");
        send_packet_4(7, 0, 3);
        $write("*** send (src: 4 dst: 1 vch: 0 len: 1) *** \n");
        send_packet_4(1, 0, 1);
        $write("*** send (src: 4 dst: 7 vch: 1 len: 1) *** \n");
        send_packet_4(7, 1, 1);
        $write("*** send (src: 4 dst: 3 vch: 0 len: 4) *** \n");
        send_packet_4(3, 0, 4);
        $write("*** send (src: 4 dst: 10 vch: 0 len: 2) *** \n");
        send_packet_4(10, 0, 2);
        $write("*** send (src: 4 dst: 14 vch: 1 len: 4) *** \n");
        send_packet_4(14, 1, 4);
        $write("*** send (src: 4 dst: 6 vch: 0 len: 1) *** \n");
        send_packet_4(6, 0, 1);
        $write("*** send (src: 4 dst: 9 vch: 1 len: 5) *** \n");
        send_packet_4(9, 1, 5);
        $write("*** send (src: 4 dst: 11 vch: 0 len: 5) *** \n");
        send_packet_4(11, 0, 5);
        $write("*** send (src: 4 dst: 9 vch: 1 len: 2) *** \n");
        send_packet_4(9, 1, 2);
        $write("*** send (src: 4 dst: 12 vch: 1 len: 3) *** \n");
        send_packet_4(12, 1, 3);
        $write("*** send (src: 4 dst: 14 vch: 0 len: 5) *** \n");
        send_packet_4(14, 0, 5);
        $write("*** send (src: 4 dst: 13 vch: 1 len: 2) *** \n");
        send_packet_4(13, 1, 2);
        $write("*** send (src: 4 dst: 12 vch: 0 len: 3) *** \n");
        send_packet_4(12, 0, 3);
        $write("*** send (src: 4 dst: 6 vch: 1 len: 2) *** \n");
        send_packet_4(6, 1, 2);
        $write("*** send (src: 4 dst: 10 vch: 1 len: 2) *** \n");
        send_packet_4(10, 1, 2);
        $write("*** send (src: 4 dst: 6 vch: 1 len: 1) *** \n");
        send_packet_4(6, 1, 1);
end

/* packet generator for n5 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 5 dst: 1 vch: 1 len: 4) *** \n");
        send_packet_5(1, 1, 4);
        $write("*** send (src: 5 dst: 12 vch: 1 len: 1) *** \n");
        send_packet_5(12, 1, 1);
        $write("*** send (src: 5 dst: 11 vch: 1 len: 3) *** \n");
        send_packet_5(11, 1, 3);
        $write("*** send (src: 5 dst: 15 vch: 1 len: 2) *** \n");
        send_packet_5(15, 1, 2);
        $write("*** send (src: 5 dst: 14 vch: 1 len: 5) *** \n");
        send_packet_5(14, 1, 5);
        $write("*** send (src: 5 dst: 12 vch: 0 len: 2) *** \n");
        send_packet_5(12, 0, 2);
        $write("*** send (src: 5 dst: 1 vch: 0 len: 3) *** \n");
        send_packet_5(1, 0, 3);
        $write("*** send (src: 5 dst: 13 vch: 1 len: 5) *** \n");
        send_packet_5(13, 1, 5);
        $write("*** send (src: 5 dst: 2 vch: 1 len: 5) *** \n");
        send_packet_5(2, 1, 5);
        $write("*** send (src: 5 dst: 15 vch: 1 len: 3) *** \n");
        send_packet_5(15, 1, 3);
        $write("*** send (src: 5 dst: 6 vch: 1 len: 4) *** \n");
        send_packet_5(6, 1, 4);
        $write("*** send (src: 5 dst: 15 vch: 1 len: 3) *** \n");
        send_packet_5(15, 1, 3);
        $write("*** send (src: 5 dst: 2 vch: 0 len: 1) *** \n");
        send_packet_5(2, 0, 1);
        $write("*** send (src: 5 dst: 13 vch: 0 len: 2) *** \n");
        send_packet_5(13, 0, 2);
        $write("*** send (src: 5 dst: 14 vch: 1 len: 5) *** \n");
        send_packet_5(14, 1, 5);
        $write("*** send (src: 5 dst: 9 vch: 1 len: 4) *** \n");
        send_packet_5(9, 1, 4);
        $write("*** send (src: 5 dst: 7 vch: 1 len: 4) *** \n");
        send_packet_5(7, 1, 4);
        $write("*** send (src: 5 dst: 2 vch: 0 len: 3) *** \n");
        send_packet_5(2, 0, 3);
        $write("*** send (src: 5 dst: 2 vch: 1 len: 5) *** \n");
        send_packet_5(2, 1, 5);
        $write("*** send (src: 5 dst: 4 vch: 1 len: 3) *** \n");
        send_packet_5(4, 1, 3);
        $write("*** send (src: 5 dst: 8 vch: 0 len: 1) *** \n");
        send_packet_5(8, 0, 1);
        $write("*** send (src: 5 dst: 2 vch: 1 len: 1) *** \n");
        send_packet_5(2, 1, 1);
        $write("*** send (src: 5 dst: 0 vch: 1 len: 3) *** \n");
        send_packet_5(0, 1, 3);
        $write("*** send (src: 5 dst: 0 vch: 0 len: 3) *** \n");
        send_packet_5(0, 0, 3);
        $write("*** send (src: 5 dst: 2 vch: 1 len: 3) *** \n");
        send_packet_5(2, 1, 3);
        $write("*** send (src: 5 dst: 13 vch: 1 len: 5) *** \n");
        send_packet_5(13, 1, 5);
        $write("*** send (src: 5 dst: 6 vch: 0 len: 3) *** \n");
        send_packet_5(6, 0, 3);
        $write("*** send (src: 5 dst: 7 vch: 1 len: 5) *** \n");
        send_packet_5(7, 1, 5);
        $write("*** send (src: 5 dst: 14 vch: 0 len: 5) *** \n");
        send_packet_5(14, 0, 5);
        $write("*** send (src: 5 dst: 0 vch: 1 len: 2) *** \n");
        send_packet_5(0, 1, 2);
        $write("*** send (src: 5 dst: 2 vch: 1 len: 4) *** \n");
        send_packet_5(2, 1, 4);
        $write("*** send (src: 5 dst: 8 vch: 1 len: 1) *** \n");
        send_packet_5(8, 1, 1);
end

/* packet generator for n6 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 6 dst: 7 vch: 0 len: 2) *** \n");
        send_packet_6(7, 0, 2);
        $write("*** send (src: 6 dst: 9 vch: 0 len: 2) *** \n");
        send_packet_6(9, 0, 2);
        $write("*** send (src: 6 dst: 4 vch: 1 len: 5) *** \n");
        send_packet_6(4, 1, 5);
        $write("*** send (src: 6 dst: 7 vch: 0 len: 4) *** \n");
        send_packet_6(7, 0, 4);
        $write("*** send (src: 6 dst: 7 vch: 0 len: 5) *** \n");
        send_packet_6(7, 0, 5);
        $write("*** send (src: 6 dst: 11 vch: 0 len: 3) *** \n");
        send_packet_6(11, 0, 3);
        $write("*** send (src: 6 dst: 15 vch: 1 len: 3) *** \n");
        send_packet_6(15, 1, 3);
        $write("*** send (src: 6 dst: 14 vch: 1 len: 3) *** \n");
        send_packet_6(14, 1, 3);
        $write("*** send (src: 6 dst: 15 vch: 0 len: 1) *** \n");
        send_packet_6(15, 0, 1);
        $write("*** send (src: 6 dst: 3 vch: 1 len: 4) *** \n");
        send_packet_6(3, 1, 4);
        $write("*** send (src: 6 dst: 14 vch: 0 len: 3) *** \n");
        send_packet_6(14, 0, 3);
        $write("*** send (src: 6 dst: 14 vch: 0 len: 3) *** \n");
        send_packet_6(14, 0, 3);
        $write("*** send (src: 6 dst: 14 vch: 0 len: 1) *** \n");
        send_packet_6(14, 0, 1);
        $write("*** send (src: 6 dst: 5 vch: 0 len: 5) *** \n");
        send_packet_6(5, 0, 5);
        $write("*** send (src: 6 dst: 8 vch: 1 len: 1) *** \n");
        send_packet_6(8, 1, 1);
        $write("*** send (src: 6 dst: 5 vch: 1 len: 1) *** \n");
        send_packet_6(5, 1, 1);
        $write("*** send (src: 6 dst: 0 vch: 0 len: 4) *** \n");
        send_packet_6(0, 0, 4);
        $write("*** send (src: 6 dst: 3 vch: 0 len: 1) *** \n");
        send_packet_6(3, 0, 1);
        $write("*** send (src: 6 dst: 10 vch: 1 len: 5) *** \n");
        send_packet_6(10, 1, 5);
        $write("*** send (src: 6 dst: 5 vch: 0 len: 1) *** \n");
        send_packet_6(5, 0, 1);
        $write("*** send (src: 6 dst: 11 vch: 1 len: 3) *** \n");
        send_packet_6(11, 1, 3);
        $write("*** send (src: 6 dst: 10 vch: 1 len: 3) *** \n");
        send_packet_6(10, 1, 3);
        $write("*** send (src: 6 dst: 5 vch: 1 len: 1) *** \n");
        send_packet_6(5, 1, 1);
        $write("*** send (src: 6 dst: 14 vch: 1 len: 2) *** \n");
        send_packet_6(14, 1, 2);
        $write("*** send (src: 6 dst: 4 vch: 1 len: 5) *** \n");
        send_packet_6(4, 1, 5);
        $write("*** send (src: 6 dst: 1 vch: 1 len: 3) *** \n");
        send_packet_6(1, 1, 3);
        $write("*** send (src: 6 dst: 4 vch: 1 len: 2) *** \n");
        send_packet_6(4, 1, 2);
        $write("*** send (src: 6 dst: 0 vch: 0 len: 3) *** \n");
        send_packet_6(0, 0, 3);
        $write("*** send (src: 6 dst: 4 vch: 0 len: 4) *** \n");
        send_packet_6(4, 0, 4);
        $write("*** send (src: 6 dst: 5 vch: 0 len: 1) *** \n");
        send_packet_6(5, 0, 1);
        $write("*** send (src: 6 dst: 13 vch: 1 len: 1) *** \n");
        send_packet_6(13, 1, 1);
        $write("*** send (src: 6 dst: 4 vch: 1 len: 5) *** \n");
        send_packet_6(4, 1, 5);
end

/* packet generator for n7 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 7 dst: 3 vch: 1 len: 4) *** \n");
        send_packet_7(3, 1, 4);
        $write("*** send (src: 7 dst: 1 vch: 0 len: 3) *** \n");
        send_packet_7(1, 0, 3);
        $write("*** send (src: 7 dst: 6 vch: 0 len: 4) *** \n");
        send_packet_7(6, 0, 4);
        $write("*** send (src: 7 dst: 13 vch: 0 len: 2) *** \n");
        send_packet_7(13, 0, 2);
        $write("*** send (src: 7 dst: 10 vch: 1 len: 3) *** \n");
        send_packet_7(10, 1, 3);
        $write("*** send (src: 7 dst: 8 vch: 1 len: 5) *** \n");
        send_packet_7(8, 1, 5);
        $write("*** send (src: 7 dst: 8 vch: 1 len: 4) *** \n");
        send_packet_7(8, 1, 4);
        $write("*** send (src: 7 dst: 4 vch: 1 len: 2) *** \n");
        send_packet_7(4, 1, 2);
        $write("*** send (src: 7 dst: 6 vch: 0 len: 5) *** \n");
        send_packet_7(6, 0, 5);
        $write("*** send (src: 7 dst: 8 vch: 0 len: 4) *** \n");
        send_packet_7(8, 0, 4);
        $write("*** send (src: 7 dst: 14 vch: 1 len: 1) *** \n");
        send_packet_7(14, 1, 1);
        $write("*** send (src: 7 dst: 9 vch: 0 len: 2) *** \n");
        send_packet_7(9, 0, 2);
        $write("*** send (src: 7 dst: 8 vch: 1 len: 5) *** \n");
        send_packet_7(8, 1, 5);
        $write("*** send (src: 7 dst: 13 vch: 1 len: 2) *** \n");
        send_packet_7(13, 1, 2);
        $write("*** send (src: 7 dst: 10 vch: 1 len: 4) *** \n");
        send_packet_7(10, 1, 4);
        $write("*** send (src: 7 dst: 0 vch: 0 len: 5) *** \n");
        send_packet_7(0, 0, 5);
        $write("*** send (src: 7 dst: 9 vch: 1 len: 5) *** \n");
        send_packet_7(9, 1, 5);
        $write("*** send (src: 7 dst: 8 vch: 1 len: 4) *** \n");
        send_packet_7(8, 1, 4);
        $write("*** send (src: 7 dst: 5 vch: 1 len: 2) *** \n");
        send_packet_7(5, 1, 2);
        $write("*** send (src: 7 dst: 0 vch: 1 len: 4) *** \n");
        send_packet_7(0, 1, 4);
        $write("*** send (src: 7 dst: 1 vch: 1 len: 3) *** \n");
        send_packet_7(1, 1, 3);
        $write("*** send (src: 7 dst: 8 vch: 1 len: 2) *** \n");
        send_packet_7(8, 1, 2);
        $write("*** send (src: 7 dst: 15 vch: 1 len: 1) *** \n");
        send_packet_7(15, 1, 1);
        $write("*** send (src: 7 dst: 0 vch: 1 len: 4) *** \n");
        send_packet_7(0, 1, 4);
        $write("*** send (src: 7 dst: 6 vch: 0 len: 1) *** \n");
        send_packet_7(6, 0, 1);
        $write("*** send (src: 7 dst: 11 vch: 1 len: 4) *** \n");
        send_packet_7(11, 1, 4);
        $write("*** send (src: 7 dst: 2 vch: 0 len: 2) *** \n");
        send_packet_7(2, 0, 2);
        $write("*** send (src: 7 dst: 12 vch: 1 len: 5) *** \n");
        send_packet_7(12, 1, 5);
        $write("*** send (src: 7 dst: 9 vch: 0 len: 1) *** \n");
        send_packet_7(9, 0, 1);
        $write("*** send (src: 7 dst: 4 vch: 1 len: 3) *** \n");
        send_packet_7(4, 1, 3);
        $write("*** send (src: 7 dst: 8 vch: 1 len: 5) *** \n");
        send_packet_7(8, 1, 5);
        $write("*** send (src: 7 dst: 9 vch: 0 len: 5) *** \n");
        send_packet_7(9, 0, 5);
end

/* packet generator for n8 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 8 dst: 12 vch: 0 len: 2) *** \n");
        send_packet_8(12, 0, 2);
        $write("*** send (src: 8 dst: 4 vch: 0 len: 3) *** \n");
        send_packet_8(4, 0, 3);
        $write("*** send (src: 8 dst: 9 vch: 0 len: 3) *** \n");
        send_packet_8(9, 0, 3);
        $write("*** send (src: 8 dst: 4 vch: 1 len: 5) *** \n");
        send_packet_8(4, 1, 5);
        $write("*** send (src: 8 dst: 2 vch: 1 len: 1) *** \n");
        send_packet_8(2, 1, 1);
        $write("*** send (src: 8 dst: 14 vch: 1 len: 5) *** \n");
        send_packet_8(14, 1, 5);
        $write("*** send (src: 8 dst: 2 vch: 1 len: 3) *** \n");
        send_packet_8(2, 1, 3);
        $write("*** send (src: 8 dst: 3 vch: 0 len: 1) *** \n");
        send_packet_8(3, 0, 1);
        $write("*** send (src: 8 dst: 7 vch: 1 len: 2) *** \n");
        send_packet_8(7, 1, 2);
        $write("*** send (src: 8 dst: 15 vch: 0 len: 1) *** \n");
        send_packet_8(15, 0, 1);
        $write("*** send (src: 8 dst: 5 vch: 1 len: 2) *** \n");
        send_packet_8(5, 1, 2);
        $write("*** send (src: 8 dst: 1 vch: 1 len: 1) *** \n");
        send_packet_8(1, 1, 1);
        $write("*** send (src: 8 dst: 7 vch: 1 len: 3) *** \n");
        send_packet_8(7, 1, 3);
        $write("*** send (src: 8 dst: 2 vch: 0 len: 1) *** \n");
        send_packet_8(2, 0, 1);
        $write("*** send (src: 8 dst: 9 vch: 1 len: 2) *** \n");
        send_packet_8(9, 1, 2);
        $write("*** send (src: 8 dst: 4 vch: 0 len: 1) *** \n");
        send_packet_8(4, 0, 1);
        $write("*** send (src: 8 dst: 9 vch: 1 len: 1) *** \n");
        send_packet_8(9, 1, 1);
        $write("*** send (src: 8 dst: 7 vch: 0 len: 5) *** \n");
        send_packet_8(7, 0, 5);
        $write("*** send (src: 8 dst: 7 vch: 1 len: 5) *** \n");
        send_packet_8(7, 1, 5);
        $write("*** send (src: 8 dst: 5 vch: 1 len: 3) *** \n");
        send_packet_8(5, 1, 3);
        $write("*** send (src: 8 dst: 0 vch: 1 len: 3) *** \n");
        send_packet_8(0, 1, 3);
        $write("*** send (src: 8 dst: 9 vch: 1 len: 4) *** \n");
        send_packet_8(9, 1, 4);
        $write("*** send (src: 8 dst: 1 vch: 1 len: 1) *** \n");
        send_packet_8(1, 1, 1);
        $write("*** send (src: 8 dst: 13 vch: 1 len: 3) *** \n");
        send_packet_8(13, 1, 3);
        $write("*** send (src: 8 dst: 9 vch: 0 len: 1) *** \n");
        send_packet_8(9, 0, 1);
        $write("*** send (src: 8 dst: 3 vch: 1 len: 5) *** \n");
        send_packet_8(3, 1, 5);
        $write("*** send (src: 8 dst: 14 vch: 0 len: 4) *** \n");
        send_packet_8(14, 0, 4);
        $write("*** send (src: 8 dst: 14 vch: 1 len: 3) *** \n");
        send_packet_8(14, 1, 3);
        $write("*** send (src: 8 dst: 4 vch: 1 len: 2) *** \n");
        send_packet_8(4, 1, 2);
        $write("*** send (src: 8 dst: 10 vch: 0 len: 5) *** \n");
        send_packet_8(10, 0, 5);
        $write("*** send (src: 8 dst: 12 vch: 0 len: 2) *** \n");
        send_packet_8(12, 0, 2);
        $write("*** send (src: 8 dst: 9 vch: 0 len: 2) *** \n");
        send_packet_8(9, 0, 2);
end

/* packet generator for n9 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 9 dst: 5 vch: 0 len: 4) *** \n");
        send_packet_9(5, 0, 4);
        $write("*** send (src: 9 dst: 8 vch: 1 len: 3) *** \n");
        send_packet_9(8, 1, 3);
        $write("*** send (src: 9 dst: 10 vch: 0 len: 2) *** \n");
        send_packet_9(10, 0, 2);
        $write("*** send (src: 9 dst: 11 vch: 1 len: 5) *** \n");
        send_packet_9(11, 1, 5);
        $write("*** send (src: 9 dst: 14 vch: 1 len: 3) *** \n");
        send_packet_9(14, 1, 3);
        $write("*** send (src: 9 dst: 10 vch: 0 len: 1) *** \n");
        send_packet_9(10, 0, 1);
        $write("*** send (src: 9 dst: 15 vch: 0 len: 4) *** \n");
        send_packet_9(15, 0, 4);
        $write("*** send (src: 9 dst: 1 vch: 0 len: 1) *** \n");
        send_packet_9(1, 0, 1);
        $write("*** send (src: 9 dst: 12 vch: 0 len: 2) *** \n");
        send_packet_9(12, 0, 2);
        $write("*** send (src: 9 dst: 4 vch: 0 len: 2) *** \n");
        send_packet_9(4, 0, 2);
        $write("*** send (src: 9 dst: 13 vch: 1 len: 4) *** \n");
        send_packet_9(13, 1, 4);
        $write("*** send (src: 9 dst: 8 vch: 1 len: 1) *** \n");
        send_packet_9(8, 1, 1);
        $write("*** send (src: 9 dst: 1 vch: 0 len: 1) *** \n");
        send_packet_9(1, 0, 1);
        $write("*** send (src: 9 dst: 2 vch: 0 len: 1) *** \n");
        send_packet_9(2, 0, 1);
        $write("*** send (src: 9 dst: 12 vch: 0 len: 4) *** \n");
        send_packet_9(12, 0, 4);
        $write("*** send (src: 9 dst: 14 vch: 1 len: 5) *** \n");
        send_packet_9(14, 1, 5);
        $write("*** send (src: 9 dst: 7 vch: 0 len: 4) *** \n");
        send_packet_9(7, 0, 4);
        $write("*** send (src: 9 dst: 3 vch: 1 len: 5) *** \n");
        send_packet_9(3, 1, 5);
        $write("*** send (src: 9 dst: 3 vch: 0 len: 2) *** \n");
        send_packet_9(3, 0, 2);
        $write("*** send (src: 9 dst: 5 vch: 0 len: 4) *** \n");
        send_packet_9(5, 0, 4);
        $write("*** send (src: 9 dst: 12 vch: 0 len: 3) *** \n");
        send_packet_9(12, 0, 3);
        $write("*** send (src: 9 dst: 11 vch: 0 len: 1) *** \n");
        send_packet_9(11, 0, 1);
        $write("*** send (src: 9 dst: 5 vch: 0 len: 2) *** \n");
        send_packet_9(5, 0, 2);
        $write("*** send (src: 9 dst: 0 vch: 1 len: 1) *** \n");
        send_packet_9(0, 1, 1);
        $write("*** send (src: 9 dst: 1 vch: 1 len: 2) *** \n");
        send_packet_9(1, 1, 2);
        $write("*** send (src: 9 dst: 8 vch: 1 len: 1) *** \n");
        send_packet_9(8, 1, 1);
        $write("*** send (src: 9 dst: 12 vch: 0 len: 5) *** \n");
        send_packet_9(12, 0, 5);
        $write("*** send (src: 9 dst: 15 vch: 0 len: 4) *** \n");
        send_packet_9(15, 0, 4);
        $write("*** send (src: 9 dst: 4 vch: 1 len: 2) *** \n");
        send_packet_9(4, 1, 2);
        $write("*** send (src: 9 dst: 10 vch: 1 len: 2) *** \n");
        send_packet_9(10, 1, 2);
        $write("*** send (src: 9 dst: 15 vch: 0 len: 4) *** \n");
        send_packet_9(15, 0, 4);
        $write("*** send (src: 9 dst: 8 vch: 0 len: 1) *** \n");
        send_packet_9(8, 0, 1);
end

/* packet generator for n10 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 10 dst: 0 vch: 1 len: 2) *** \n");
        send_packet_10(0, 1, 2);
        $write("*** send (src: 10 dst: 8 vch: 0 len: 1) *** \n");
        send_packet_10(8, 0, 1);
        $write("*** send (src: 10 dst: 3 vch: 0 len: 5) *** \n");
        send_packet_10(3, 0, 5);
        $write("*** send (src: 10 dst: 5 vch: 0 len: 5) *** \n");
        send_packet_10(5, 0, 5);
        $write("*** send (src: 10 dst: 1 vch: 0 len: 1) *** \n");
        send_packet_10(1, 0, 1);
        $write("*** send (src: 10 dst: 11 vch: 1 len: 3) *** \n");
        send_packet_10(11, 1, 3);
        $write("*** send (src: 10 dst: 1 vch: 0 len: 4) *** \n");
        send_packet_10(1, 0, 4);
        $write("*** send (src: 10 dst: 7 vch: 1 len: 5) *** \n");
        send_packet_10(7, 1, 5);
        $write("*** send (src: 10 dst: 1 vch: 1 len: 3) *** \n");
        send_packet_10(1, 1, 3);
        $write("*** send (src: 10 dst: 6 vch: 1 len: 5) *** \n");
        send_packet_10(6, 1, 5);
        $write("*** send (src: 10 dst: 11 vch: 0 len: 2) *** \n");
        send_packet_10(11, 0, 2);
        $write("*** send (src: 10 dst: 1 vch: 0 len: 5) *** \n");
        send_packet_10(1, 0, 5);
        $write("*** send (src: 10 dst: 1 vch: 1 len: 3) *** \n");
        send_packet_10(1, 1, 3);
        $write("*** send (src: 10 dst: 3 vch: 0 len: 5) *** \n");
        send_packet_10(3, 0, 5);
        $write("*** send (src: 10 dst: 11 vch: 1 len: 1) *** \n");
        send_packet_10(11, 1, 1);
        $write("*** send (src: 10 dst: 8 vch: 0 len: 1) *** \n");
        send_packet_10(8, 0, 1);
        $write("*** send (src: 10 dst: 1 vch: 1 len: 4) *** \n");
        send_packet_10(1, 1, 4);
        $write("*** send (src: 10 dst: 11 vch: 1 len: 2) *** \n");
        send_packet_10(11, 1, 2);
        $write("*** send (src: 10 dst: 3 vch: 0 len: 3) *** \n");
        send_packet_10(3, 0, 3);
        $write("*** send (src: 10 dst: 6 vch: 0 len: 3) *** \n");
        send_packet_10(6, 0, 3);
        $write("*** send (src: 10 dst: 13 vch: 0 len: 3) *** \n");
        send_packet_10(13, 0, 3);
        $write("*** send (src: 10 dst: 5 vch: 1 len: 1) *** \n");
        send_packet_10(5, 1, 1);
        $write("*** send (src: 10 dst: 5 vch: 1 len: 5) *** \n");
        send_packet_10(5, 1, 5);
        $write("*** send (src: 10 dst: 12 vch: 1 len: 2) *** \n");
        send_packet_10(12, 1, 2);
        $write("*** send (src: 10 dst: 4 vch: 0 len: 4) *** \n");
        send_packet_10(4, 0, 4);
        $write("*** send (src: 10 dst: 0 vch: 1 len: 4) *** \n");
        send_packet_10(0, 1, 4);
        $write("*** send (src: 10 dst: 1 vch: 1 len: 4) *** \n");
        send_packet_10(1, 1, 4);
        $write("*** send (src: 10 dst: 4 vch: 1 len: 2) *** \n");
        send_packet_10(4, 1, 2);
        $write("*** send (src: 10 dst: 15 vch: 1 len: 4) *** \n");
        send_packet_10(15, 1, 4);
        $write("*** send (src: 10 dst: 9 vch: 0 len: 2) *** \n");
        send_packet_10(9, 0, 2);
        $write("*** send (src: 10 dst: 3 vch: 1 len: 4) *** \n");
        send_packet_10(3, 1, 4);
        $write("*** send (src: 10 dst: 2 vch: 0 len: 2) *** \n");
        send_packet_10(2, 0, 2);
end

/* packet generator for n11 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 11 dst: 2 vch: 0 len: 2) *** \n");
        send_packet_11(2, 0, 2);
        $write("*** send (src: 11 dst: 15 vch: 1 len: 5) *** \n");
        send_packet_11(15, 1, 5);
        $write("*** send (src: 11 dst: 6 vch: 1 len: 3) *** \n");
        send_packet_11(6, 1, 3);
        $write("*** send (src: 11 dst: 4 vch: 1 len: 2) *** \n");
        send_packet_11(4, 1, 2);
        $write("*** send (src: 11 dst: 12 vch: 0 len: 1) *** \n");
        send_packet_11(12, 0, 1);
        $write("*** send (src: 11 dst: 2 vch: 0 len: 3) *** \n");
        send_packet_11(2, 0, 3);
        $write("*** send (src: 11 dst: 7 vch: 1 len: 3) *** \n");
        send_packet_11(7, 1, 3);
        $write("*** send (src: 11 dst: 7 vch: 1 len: 2) *** \n");
        send_packet_11(7, 1, 2);
        $write("*** send (src: 11 dst: 13 vch: 0 len: 4) *** \n");
        send_packet_11(13, 0, 4);
        $write("*** send (src: 11 dst: 7 vch: 0 len: 3) *** \n");
        send_packet_11(7, 0, 3);
        $write("*** send (src: 11 dst: 15 vch: 1 len: 4) *** \n");
        send_packet_11(15, 1, 4);
        $write("*** send (src: 11 dst: 4 vch: 1 len: 3) *** \n");
        send_packet_11(4, 1, 3);
        $write("*** send (src: 11 dst: 4 vch: 1 len: 2) *** \n");
        send_packet_11(4, 1, 2);
        $write("*** send (src: 11 dst: 7 vch: 0 len: 2) *** \n");
        send_packet_11(7, 0, 2);
        $write("*** send (src: 11 dst: 5 vch: 1 len: 4) *** \n");
        send_packet_11(5, 1, 4);
        $write("*** send (src: 11 dst: 1 vch: 1 len: 3) *** \n");
        send_packet_11(1, 1, 3);
        $write("*** send (src: 11 dst: 5 vch: 1 len: 4) *** \n");
        send_packet_11(5, 1, 4);
        $write("*** send (src: 11 dst: 3 vch: 1 len: 3) *** \n");
        send_packet_11(3, 1, 3);
        $write("*** send (src: 11 dst: 5 vch: 1 len: 4) *** \n");
        send_packet_11(5, 1, 4);
        $write("*** send (src: 11 dst: 9 vch: 1 len: 1) *** \n");
        send_packet_11(9, 1, 1);
        $write("*** send (src: 11 dst: 2 vch: 0 len: 1) *** \n");
        send_packet_11(2, 0, 1);
        $write("*** send (src: 11 dst: 6 vch: 0 len: 4) *** \n");
        send_packet_11(6, 0, 4);
        $write("*** send (src: 11 dst: 12 vch: 1 len: 3) *** \n");
        send_packet_11(12, 1, 3);
        $write("*** send (src: 11 dst: 10 vch: 0 len: 4) *** \n");
        send_packet_11(10, 0, 4);
        $write("*** send (src: 11 dst: 6 vch: 0 len: 1) *** \n");
        send_packet_11(6, 0, 1);
        $write("*** send (src: 11 dst: 1 vch: 1 len: 2) *** \n");
        send_packet_11(1, 1, 2);
        $write("*** send (src: 11 dst: 0 vch: 1 len: 1) *** \n");
        send_packet_11(0, 1, 1);
        $write("*** send (src: 11 dst: 7 vch: 0 len: 3) *** \n");
        send_packet_11(7, 0, 3);
        $write("*** send (src: 11 dst: 7 vch: 0 len: 2) *** \n");
        send_packet_11(7, 0, 2);
        $write("*** send (src: 11 dst: 7 vch: 0 len: 2) *** \n");
        send_packet_11(7, 0, 2);
        $write("*** send (src: 11 dst: 2 vch: 1 len: 3) *** \n");
        send_packet_11(2, 1, 3);
        $write("*** send (src: 11 dst: 9 vch: 0 len: 1) *** \n");
        send_packet_11(9, 0, 1);
end

/* packet generator for n12 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 12 dst: 11 vch: 1 len: 1) *** \n");
        send_packet_12(11, 1, 1);
        $write("*** send (src: 12 dst: 9 vch: 1 len: 5) *** \n");
        send_packet_12(9, 1, 5);
        $write("*** send (src: 12 dst: 13 vch: 0 len: 5) *** \n");
        send_packet_12(13, 0, 5);
        $write("*** send (src: 12 dst: 6 vch: 0 len: 4) *** \n");
        send_packet_12(6, 0, 4);
        $write("*** send (src: 12 dst: 1 vch: 0 len: 4) *** \n");
        send_packet_12(1, 0, 4);
        $write("*** send (src: 12 dst: 15 vch: 1 len: 5) *** \n");
        send_packet_12(15, 1, 5);
        $write("*** send (src: 12 dst: 10 vch: 1 len: 1) *** \n");
        send_packet_12(10, 1, 1);
        $write("*** send (src: 12 dst: 8 vch: 0 len: 4) *** \n");
        send_packet_12(8, 0, 4);
        $write("*** send (src: 12 dst: 13 vch: 1 len: 4) *** \n");
        send_packet_12(13, 1, 4);
        $write("*** send (src: 12 dst: 13 vch: 1 len: 4) *** \n");
        send_packet_12(13, 1, 4);
        $write("*** send (src: 12 dst: 9 vch: 0 len: 1) *** \n");
        send_packet_12(9, 0, 1);
        $write("*** send (src: 12 dst: 2 vch: 1 len: 2) *** \n");
        send_packet_12(2, 1, 2);
        $write("*** send (src: 12 dst: 8 vch: 0 len: 2) *** \n");
        send_packet_12(8, 0, 2);
        $write("*** send (src: 12 dst: 6 vch: 0 len: 5) *** \n");
        send_packet_12(6, 0, 5);
        $write("*** send (src: 12 dst: 2 vch: 1 len: 1) *** \n");
        send_packet_12(2, 1, 1);
        $write("*** send (src: 12 dst: 7 vch: 0 len: 5) *** \n");
        send_packet_12(7, 0, 5);
        $write("*** send (src: 12 dst: 15 vch: 0 len: 1) *** \n");
        send_packet_12(15, 0, 1);
        $write("*** send (src: 12 dst: 15 vch: 0 len: 5) *** \n");
        send_packet_12(15, 0, 5);
        $write("*** send (src: 12 dst: 0 vch: 0 len: 2) *** \n");
        send_packet_12(0, 0, 2);
        $write("*** send (src: 12 dst: 2 vch: 0 len: 4) *** \n");
        send_packet_12(2, 0, 4);
        $write("*** send (src: 12 dst: 11 vch: 1 len: 2) *** \n");
        send_packet_12(11, 1, 2);
        $write("*** send (src: 12 dst: 13 vch: 0 len: 3) *** \n");
        send_packet_12(13, 0, 3);
        $write("*** send (src: 12 dst: 2 vch: 1 len: 4) *** \n");
        send_packet_12(2, 1, 4);
        $write("*** send (src: 12 dst: 1 vch: 0 len: 2) *** \n");
        send_packet_12(1, 0, 2);
        $write("*** send (src: 12 dst: 15 vch: 1 len: 1) *** \n");
        send_packet_12(15, 1, 1);
        $write("*** send (src: 12 dst: 8 vch: 0 len: 3) *** \n");
        send_packet_12(8, 0, 3);
        $write("*** send (src: 12 dst: 13 vch: 0 len: 1) *** \n");
        send_packet_12(13, 0, 1);
        $write("*** send (src: 12 dst: 9 vch: 0 len: 3) *** \n");
        send_packet_12(9, 0, 3);
        $write("*** send (src: 12 dst: 3 vch: 0 len: 1) *** \n");
        send_packet_12(3, 0, 1);
        $write("*** send (src: 12 dst: 15 vch: 1 len: 2) *** \n");
        send_packet_12(15, 1, 2);
        $write("*** send (src: 12 dst: 2 vch: 0 len: 2) *** \n");
        send_packet_12(2, 0, 2);
        $write("*** send (src: 12 dst: 11 vch: 1 len: 1) *** \n");
        send_packet_12(11, 1, 1);
end

/* packet generator for n13 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 13 dst: 11 vch: 1 len: 5) *** \n");
        send_packet_13(11, 1, 5);
        $write("*** send (src: 13 dst: 4 vch: 1 len: 5) *** \n");
        send_packet_13(4, 1, 5);
        $write("*** send (src: 13 dst: 15 vch: 0 len: 4) *** \n");
        send_packet_13(15, 0, 4);
        $write("*** send (src: 13 dst: 2 vch: 0 len: 1) *** \n");
        send_packet_13(2, 0, 1);
        $write("*** send (src: 13 dst: 11 vch: 1 len: 4) *** \n");
        send_packet_13(11, 1, 4);
        $write("*** send (src: 13 dst: 11 vch: 0 len: 3) *** \n");
        send_packet_13(11, 0, 3);
        $write("*** send (src: 13 dst: 11 vch: 0 len: 3) *** \n");
        send_packet_13(11, 0, 3);
        $write("*** send (src: 13 dst: 14 vch: 1 len: 2) *** \n");
        send_packet_13(14, 1, 2);
        $write("*** send (src: 13 dst: 12 vch: 1 len: 3) *** \n");
        send_packet_13(12, 1, 3);
        $write("*** send (src: 13 dst: 4 vch: 0 len: 2) *** \n");
        send_packet_13(4, 0, 2);
        $write("*** send (src: 13 dst: 3 vch: 1 len: 4) *** \n");
        send_packet_13(3, 1, 4);
        $write("*** send (src: 13 dst: 9 vch: 0 len: 1) *** \n");
        send_packet_13(9, 0, 1);
        $write("*** send (src: 13 dst: 3 vch: 1 len: 5) *** \n");
        send_packet_13(3, 1, 5);
        $write("*** send (src: 13 dst: 9 vch: 0 len: 3) *** \n");
        send_packet_13(9, 0, 3);
        $write("*** send (src: 13 dst: 11 vch: 0 len: 2) *** \n");
        send_packet_13(11, 0, 2);
        $write("*** send (src: 13 dst: 9 vch: 0 len: 3) *** \n");
        send_packet_13(9, 0, 3);
        $write("*** send (src: 13 dst: 3 vch: 0 len: 3) *** \n");
        send_packet_13(3, 0, 3);
        $write("*** send (src: 13 dst: 1 vch: 0 len: 1) *** \n");
        send_packet_13(1, 0, 1);
        $write("*** send (src: 13 dst: 3 vch: 1 len: 1) *** \n");
        send_packet_13(3, 1, 1);
        $write("*** send (src: 13 dst: 1 vch: 0 len: 5) *** \n");
        send_packet_13(1, 0, 5);
        $write("*** send (src: 13 dst: 9 vch: 0 len: 1) *** \n");
        send_packet_13(9, 0, 1);
        $write("*** send (src: 13 dst: 12 vch: 0 len: 4) *** \n");
        send_packet_13(12, 0, 4);
        $write("*** send (src: 13 dst: 10 vch: 1 len: 2) *** \n");
        send_packet_13(10, 1, 2);
        $write("*** send (src: 13 dst: 7 vch: 0 len: 3) *** \n");
        send_packet_13(7, 0, 3);
        $write("*** send (src: 13 dst: 8 vch: 0 len: 5) *** \n");
        send_packet_13(8, 0, 5);
        $write("*** send (src: 13 dst: 10 vch: 0 len: 5) *** \n");
        send_packet_13(10, 0, 5);
        $write("*** send (src: 13 dst: 3 vch: 1 len: 1) *** \n");
        send_packet_13(3, 1, 1);
        $write("*** send (src: 13 dst: 14 vch: 0 len: 5) *** \n");
        send_packet_13(14, 0, 5);
        $write("*** send (src: 13 dst: 1 vch: 1 len: 2) *** \n");
        send_packet_13(1, 1, 2);
        $write("*** send (src: 13 dst: 4 vch: 0 len: 4) *** \n");
        send_packet_13(4, 0, 4);
        $write("*** send (src: 13 dst: 1 vch: 1 len: 3) *** \n");
        send_packet_13(1, 1, 3);
        $write("*** send (src: 13 dst: 11 vch: 1 len: 5) *** \n");
        send_packet_13(11, 1, 5);
end

/* packet generator for n14 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 14 dst: 8 vch: 1 len: 4) *** \n");
        send_packet_14(8, 1, 4);
        $write("*** send (src: 14 dst: 13 vch: 0 len: 4) *** \n");
        send_packet_14(13, 0, 4);
        $write("*** send (src: 14 dst: 10 vch: 1 len: 1) *** \n");
        send_packet_14(10, 1, 1);
        $write("*** send (src: 14 dst: 8 vch: 1 len: 4) *** \n");
        send_packet_14(8, 1, 4);
        $write("*** send (src: 14 dst: 11 vch: 0 len: 3) *** \n");
        send_packet_14(11, 0, 3);
        $write("*** send (src: 14 dst: 12 vch: 0 len: 5) *** \n");
        send_packet_14(12, 0, 5);
        $write("*** send (src: 14 dst: 2 vch: 1 len: 3) *** \n");
        send_packet_14(2, 1, 3);
        $write("*** send (src: 14 dst: 4 vch: 0 len: 4) *** \n");
        send_packet_14(4, 0, 4);
        $write("*** send (src: 14 dst: 7 vch: 0 len: 5) *** \n");
        send_packet_14(7, 0, 5);
        $write("*** send (src: 14 dst: 1 vch: 0 len: 1) *** \n");
        send_packet_14(1, 0, 1);
        $write("*** send (src: 14 dst: 15 vch: 1 len: 1) *** \n");
        send_packet_14(15, 1, 1);
        $write("*** send (src: 14 dst: 15 vch: 1 len: 4) *** \n");
        send_packet_14(15, 1, 4);
        $write("*** send (src: 14 dst: 6 vch: 1 len: 5) *** \n");
        send_packet_14(6, 1, 5);
        $write("*** send (src: 14 dst: 5 vch: 1 len: 1) *** \n");
        send_packet_14(5, 1, 1);
        $write("*** send (src: 14 dst: 2 vch: 0 len: 5) *** \n");
        send_packet_14(2, 0, 5);
        $write("*** send (src: 14 dst: 8 vch: 1 len: 1) *** \n");
        send_packet_14(8, 1, 1);
        $write("*** send (src: 14 dst: 9 vch: 1 len: 1) *** \n");
        send_packet_14(9, 1, 1);
        $write("*** send (src: 14 dst: 8 vch: 0 len: 2) *** \n");
        send_packet_14(8, 0, 2);
        $write("*** send (src: 14 dst: 8 vch: 1 len: 1) *** \n");
        send_packet_14(8, 1, 1);
        $write("*** send (src: 14 dst: 1 vch: 1 len: 5) *** \n");
        send_packet_14(1, 1, 5);
        $write("*** send (src: 14 dst: 10 vch: 1 len: 3) *** \n");
        send_packet_14(10, 1, 3);
        $write("*** send (src: 14 dst: 7 vch: 0 len: 4) *** \n");
        send_packet_14(7, 0, 4);
        $write("*** send (src: 14 dst: 7 vch: 1 len: 1) *** \n");
        send_packet_14(7, 1, 1);
        $write("*** send (src: 14 dst: 10 vch: 0 len: 1) *** \n");
        send_packet_14(10, 0, 1);
        $write("*** send (src: 14 dst: 4 vch: 1 len: 2) *** \n");
        send_packet_14(4, 1, 2);
        $write("*** send (src: 14 dst: 2 vch: 0 len: 4) *** \n");
        send_packet_14(2, 0, 4);
        $write("*** send (src: 14 dst: 5 vch: 1 len: 3) *** \n");
        send_packet_14(5, 1, 3);
        $write("*** send (src: 14 dst: 4 vch: 0 len: 1) *** \n");
        send_packet_14(4, 0, 1);
        $write("*** send (src: 14 dst: 7 vch: 0 len: 4) *** \n");
        send_packet_14(7, 0, 4);
        $write("*** send (src: 14 dst: 11 vch: 0 len: 4) *** \n");
        send_packet_14(11, 0, 4);
        $write("*** send (src: 14 dst: 11 vch: 1 len: 5) *** \n");
        send_packet_14(11, 1, 5);
        $write("*** send (src: 14 dst: 2 vch: 1 len: 4) *** \n");
        send_packet_14(2, 1, 4);
end

/* packet generator for n15 */
initial begin
        #(STEP / 2);
        #(STEP * 10);
        while (~ready) begin
                #(STEP);
        end

        $write("*** send (src: 15 dst: 0 vch: 0 len: 1) *** \n");
        send_packet_15(0, 0, 1);
        $write("*** send (src: 15 dst: 10 vch: 1 len: 2) *** \n");
        send_packet_15(10, 1, 2);
        $write("*** send (src: 15 dst: 10 vch: 0 len: 1) *** \n");
        send_packet_15(10, 0, 1);
        $write("*** send (src: 15 dst: 10 vch: 1 len: 2) *** \n");
        send_packet_15(10, 1, 2);
        $write("*** send (src: 15 dst: 14 vch: 1 len: 2) *** \n");
        send_packet_15(14, 1, 2);
        $write("*** send (src: 15 dst: 9 vch: 1 len: 1) *** \n");
        send_packet_15(9, 1, 1);
        $write("*** send (src: 15 dst: 13 vch: 0 len: 1) *** \n");
        send_packet_15(13, 0, 1);
        $write("*** send (src: 15 dst: 8 vch: 1 len: 2) *** \n");
        send_packet_15(8, 1, 2);
        $write("*** send (src: 15 dst: 5 vch: 0 len: 4) *** \n");
        send_packet_15(5, 0, 4);
        $write("*** send (src: 15 dst: 11 vch: 0 len: 4) *** \n");
        send_packet_15(11, 0, 4);
        $write("*** send (src: 15 dst: 7 vch: 0 len: 1) *** \n");
        send_packet_15(7, 0, 1);
        $write("*** send (src: 15 dst: 10 vch: 1 len: 2) *** \n");
        send_packet_15(10, 1, 2);
        $write("*** send (src: 15 dst: 10 vch: 0 len: 1) *** \n");
        send_packet_15(10, 0, 1);
        $write("*** send (src: 15 dst: 7 vch: 1 len: 1) *** \n");
        send_packet_15(7, 1, 1);
        $write("*** send (src: 15 dst: 0 vch: 1 len: 5) *** \n");
        send_packet_15(0, 1, 5);
        $write("*** send (src: 15 dst: 6 vch: 1 len: 2) *** \n");
        send_packet_15(6, 1, 2);
        $write("*** send (src: 15 dst: 10 vch: 1 len: 4) *** \n");
        send_packet_15(10, 1, 4);
        $write("*** send (src: 15 dst: 6 vch: 0 len: 4) *** \n");
        send_packet_15(6, 0, 4);
        $write("*** send (src: 15 dst: 2 vch: 1 len: 1) *** \n");
        send_packet_15(2, 1, 1);
        $write("*** send (src: 15 dst: 4 vch: 0 len: 2) *** \n");
        send_packet_15(4, 0, 2);
        $write("*** send (src: 15 dst: 13 vch: 0 len: 5) *** \n");
        send_packet_15(13, 0, 5);
        $write("*** send (src: 15 dst: 3 vch: 1 len: 4) *** \n");
        send_packet_15(3, 1, 4);
        $write("*** send (src: 15 dst: 8 vch: 0 len: 4) *** \n");
        send_packet_15(8, 0, 4);
        $write("*** send (src: 15 dst: 0 vch: 0 len: 4) *** \n");
        send_packet_15(0, 0, 4);
        $write("*** send (src: 15 dst: 5 vch: 1 len: 3) *** \n");
        send_packet_15(5, 1, 3);
        $write("*** send (src: 15 dst: 14 vch: 0 len: 2) *** \n");
        send_packet_15(14, 0, 2);
        $write("*** send (src: 15 dst: 6 vch: 1 len: 4) *** \n");
        send_packet_15(6, 1, 4);
        $write("*** send (src: 15 dst: 5 vch: 0 len: 2) *** \n");
        send_packet_15(5, 0, 2);
        $write("*** send (src: 15 dst: 12 vch: 1 len: 1) *** \n");
        send_packet_15(12, 1, 1);
        $write("*** send (src: 15 dst: 8 vch: 0 len: 5) *** \n");
        send_packet_15(8, 0, 5);
        $write("*** send (src: 15 dst: 4 vch: 1 len: 1) *** \n");
        send_packet_15(4, 1, 1);
        $write("*** send (src: 15 dst: 5 vch: 1 len: 1) *** \n");
        send_packet_15(5, 1, 1);
end



/* Send/recv event monitor */
always @ (posedge clk) begin
        if ( n0_ivalid_p0 == `Enable ) begin
                $write("%d n0 send %x \n", counter, n0_idata_p0);
                n0_sent = n0_sent + 1;
        end
        if ( n1_ivalid_p0 == `Enable ) begin
                $write("%d n1 send %x \n", counter, n1_idata_p0);
                n1_sent = n1_sent + 1;
        end
        if ( n2_ivalid_p0 == `Enable ) begin
                $write("%d n2 send %x \n", counter, n2_idata_p0);
                n2_sent = n2_sent + 1;
        end
        if ( n3_ivalid_p0 == `Enable ) begin
                $write("%d n3 send %x \n", counter, n3_idata_p0);
                n3_sent = n3_sent + 1;
        end
        if ( n4_ivalid_p0 == `Enable ) begin
                $write("%d n4 send %x \n", counter, n4_idata_p0);
                n4_sent = n4_sent + 1;
        end
        if ( n5_ivalid_p0 == `Enable ) begin
                $write("%d n5 send %x \n", counter, n5_idata_p0);
                n5_sent = n5_sent + 1;
        end
        if ( n6_ivalid_p0 == `Enable ) begin
                $write("%d n6 send %x \n", counter, n6_idata_p0);
                n6_sent = n6_sent + 1;
        end
        if ( n7_ivalid_p0 == `Enable ) begin
                $write("%d n7 send %x \n", counter, n7_idata_p0);
                n7_sent = n7_sent + 1;
        end
        if ( n8_ivalid_p0 == `Enable ) begin
                $write("%d n8 send %x \n", counter, n8_idata_p0);
                n8_sent = n8_sent + 1;
        end
        if ( n9_ivalid_p0 == `Enable ) begin
                $write("%d n9 send %x \n", counter, n9_idata_p0);
                n9_sent = n9_sent + 1;
        end
        if ( n10_ivalid_p0 == `Enable ) begin
                $write("%d n10 send %x \n", counter, n10_idata_p0);
                n10_sent = n10_sent + 1;
        end
        if ( n11_ivalid_p0 == `Enable ) begin
                $write("%d n11 send %x \n", counter, n11_idata_p0);
                n11_sent = n11_sent + 1;
        end
        if ( n12_ivalid_p0 == `Enable ) begin
                $write("%d n12 send %x \n", counter, n12_idata_p0);
                n12_sent = n12_sent + 1;
        end
        if ( n13_ivalid_p0 == `Enable ) begin
                $write("%d n13 send %x \n", counter, n13_idata_p0);
                n13_sent = n13_sent + 1;
        end
        if ( n14_ivalid_p0 == `Enable ) begin
                $write("%d n14 send %x \n", counter, n14_idata_p0);
                n14_sent = n14_sent + 1;
        end
        if ( n15_ivalid_p0 == `Enable ) begin
                $write("%d n15 send %x \n", counter, n15_idata_p0);
                n15_sent = n15_sent + 1;
        end
end

always @ (posedge clk) begin
        if ( n0_ovalid_p0 == `Enable ) begin
                $write("        %d n0 recv %x \n", counter, n0_odata_p0);
                n0_recv = n0_recv + 1;
                stop     = counter + 200;
        end
        if ( n1_ovalid_p0 == `Enable ) begin
                $write("        %d n1 recv %x \n", counter, n1_odata_p0);
                n1_recv = n1_recv + 1;
                stop     = counter + 200;
        end
        if ( n2_ovalid_p0 == `Enable ) begin
                $write("        %d n2 recv %x \n", counter, n2_odata_p0);
                n2_recv = n2_recv + 1;
                stop     = counter + 200;
        end
        if ( n3_ovalid_p0 == `Enable ) begin
                $write("        %d n3 recv %x \n", counter, n3_odata_p0);
                n3_recv = n3_recv + 1;
                stop     = counter + 200;
        end
        if ( n4_ovalid_p0 == `Enable ) begin
                $write("        %d n4 recv %x \n", counter, n4_odata_p0);
                n4_recv = n4_recv + 1;
                stop     = counter + 200;
        end
        if ( n5_ovalid_p0 == `Enable ) begin
                $write("        %d n5 recv %x \n", counter, n5_odata_p0);
                n5_recv = n5_recv + 1;
                stop     = counter + 200;
        end
        if ( n6_ovalid_p0 == `Enable ) begin
                $write("        %d n6 recv %x \n", counter, n6_odata_p0);
                n6_recv = n6_recv + 1;
                stop     = counter + 200;
        end
        if ( n7_ovalid_p0 == `Enable ) begin
                $write("        %d n7 recv %x \n", counter, n7_odata_p0);
                n7_recv = n7_recv + 1;
                stop     = counter + 200;
        end
        if ( n8_ovalid_p0 == `Enable ) begin
                $write("        %d n8 recv %x \n", counter, n8_odata_p0);
                n8_recv = n8_recv + 1;
                stop     = counter + 200;
        end
        if ( n9_ovalid_p0 == `Enable ) begin
                $write("        %d n9 recv %x \n", counter, n9_odata_p0);
                n9_recv = n9_recv + 1;
                stop     = counter + 200;
        end
        if ( n10_ovalid_p0 == `Enable ) begin
                $write("        %d n10 recv %x \n", counter, n10_odata_p0);
                n10_recv = n10_recv + 1;
                stop     = counter + 200;
        end
        if ( n11_ovalid_p0 == `Enable ) begin
                $write("        %d n11 recv %x \n", counter, n11_odata_p0);
                n11_recv = n11_recv + 1;
                stop     = counter + 200;
        end
        if ( n12_ovalid_p0 == `Enable ) begin
                $write("        %d n12 recv %x \n", counter, n12_odata_p0);
                n12_recv = n12_recv + 1;
                stop     = counter + 200;
        end
        if ( n13_ovalid_p0 == `Enable ) begin
                $write("        %d n13 recv %x \n", counter, n13_odata_p0);
                n13_recv = n13_recv + 1;
                stop     = counter + 200;
        end
        if ( n14_ovalid_p0 == `Enable ) begin
                $write("        %d n14 recv %x \n", counter, n14_odata_p0);
                n14_recv = n14_recv + 1;
                stop     = counter + 200;
        end
        if ( n15_ovalid_p0 == `Enable ) begin
                $write("        %d n15 recv %x \n", counter, n15_odata_p0);
                n15_recv = n15_recv + 1;
                stop     = counter + 200;
        end
end

/* Port 0 */
always @ (posedge clk) begin
	if ( noc.n0.ovalid_0 == `Enable ) $write("                %d n0(0 %d) go thru %x \n", counter, noc.n0.ovch_0, noc.n0.odata_0);
	if ( noc.n1.ovalid_0 == `Enable ) $write("                %d n1(0 %d) go thru %x \n", counter, noc.n1.ovch_0, noc.n1.odata_0);
	if ( noc.n2.ovalid_0 == `Enable ) $write("                %d n2(0 %d) go thru %x \n", counter, noc.n2.ovch_0, noc.n2.odata_0);
	if ( noc.n3.ovalid_0 == `Enable ) $write("                %d n3(0 %d) go thru %x \n", counter, noc.n3.ovch_0, noc.n3.odata_0);
	if ( noc.n4.ovalid_0 == `Enable ) $write("                %d n4(0 %d) go thru %x \n", counter, noc.n4.ovch_0, noc.n4.odata_0);
	if ( noc.n5.ovalid_0 == `Enable ) $write("                %d n5(0 %d) go thru %x \n", counter, noc.n5.ovch_0, noc.n5.odata_0);
	if ( noc.n6.ovalid_0 == `Enable ) $write("                %d n6(0 %d) go thru %x \n", counter, noc.n6.ovch_0, noc.n6.odata_0);
	if ( noc.n7.ovalid_0 == `Enable ) $write("                %d n7(0 %d) go thru %x \n", counter, noc.n7.ovch_0, noc.n7.odata_0);
	if ( noc.n8.ovalid_0 == `Enable ) $write("                %d n8(0 %d) go thru %x \n", counter, noc.n8.ovch_0, noc.n8.odata_0);
	if ( noc.n9.ovalid_0 == `Enable ) $write("                %d n9(0 %d) go thru %x \n", counter, noc.n9.ovch_0, noc.n9.odata_0);
	if ( noc.n10.ovalid_0 == `Enable ) $write("                %d n10(0 %d) go thru %x \n", counter, noc.n10.ovch_0, noc.n10.odata_0);
	if ( noc.n11.ovalid_0 == `Enable ) $write("                %d n11(0 %d) go thru %x \n", counter, noc.n11.ovch_0, noc.n11.odata_0);
	if ( noc.n12.ovalid_0 == `Enable ) $write("                %d n12(0 %d) go thru %x \n", counter, noc.n12.ovch_0, noc.n12.odata_0);
	if ( noc.n13.ovalid_0 == `Enable ) $write("                %d n13(0 %d) go thru %x \n", counter, noc.n13.ovch_0, noc.n13.odata_0);
	if ( noc.n14.ovalid_0 == `Enable ) $write("                %d n14(0 %d) go thru %x \n", counter, noc.n14.ovch_0, noc.n14.odata_0);
	if ( noc.n15.ovalid_0 == `Enable ) $write("                %d n15(0 %d) go thru %x \n", counter, noc.n15.ovch_0, noc.n15.odata_0);
end
/* Port 1 */
always @ (posedge clk) begin
	if ( noc.n0.ovalid_1 == `Enable ) $write("                %d n0(1 %d) go thru %x \n", counter, noc.n0.ovch_1, noc.n0.odata_1);
	if ( noc.n1.ovalid_1 == `Enable ) $write("                %d n1(1 %d) go thru %x \n", counter, noc.n1.ovch_1, noc.n1.odata_1);
	if ( noc.n2.ovalid_1 == `Enable ) $write("                %d n2(1 %d) go thru %x \n", counter, noc.n2.ovch_1, noc.n2.odata_1);
	if ( noc.n3.ovalid_1 == `Enable ) $write("                %d n3(1 %d) go thru %x \n", counter, noc.n3.ovch_1, noc.n3.odata_1);
	if ( noc.n4.ovalid_1 == `Enable ) $write("                %d n4(1 %d) go thru %x \n", counter, noc.n4.ovch_1, noc.n4.odata_1);
	if ( noc.n5.ovalid_1 == `Enable ) $write("                %d n5(1 %d) go thru %x \n", counter, noc.n5.ovch_1, noc.n5.odata_1);
	if ( noc.n6.ovalid_1 == `Enable ) $write("                %d n6(1 %d) go thru %x \n", counter, noc.n6.ovch_1, noc.n6.odata_1);
	if ( noc.n7.ovalid_1 == `Enable ) $write("                %d n7(1 %d) go thru %x \n", counter, noc.n7.ovch_1, noc.n7.odata_1);
	if ( noc.n8.ovalid_1 == `Enable ) $write("                %d n8(1 %d) go thru %x \n", counter, noc.n8.ovch_1, noc.n8.odata_1);
	if ( noc.n9.ovalid_1 == `Enable ) $write("                %d n9(1 %d) go thru %x \n", counter, noc.n9.ovch_1, noc.n9.odata_1);
	if ( noc.n10.ovalid_1 == `Enable ) $write("                %d n10(1 %d) go thru %x \n", counter, noc.n10.ovch_1, noc.n10.odata_1);
	if ( noc.n11.ovalid_1 == `Enable ) $write("                %d n11(1 %d) go thru %x \n", counter, noc.n11.ovch_1, noc.n11.odata_1);
	if ( noc.n12.ovalid_1 == `Enable ) $write("                %d n12(1 %d) go thru %x \n", counter, noc.n12.ovch_1, noc.n12.odata_1);
	if ( noc.n13.ovalid_1 == `Enable ) $write("                %d n13(1 %d) go thru %x \n", counter, noc.n13.ovch_1, noc.n13.odata_1);
	if ( noc.n14.ovalid_1 == `Enable ) $write("                %d n14(1 %d) go thru %x \n", counter, noc.n14.ovch_1, noc.n14.odata_1);
	if ( noc.n15.ovalid_1 == `Enable ) $write("                %d n15(1 %d) go thru %x \n", counter, noc.n15.ovch_1, noc.n15.odata_1);
end
/* Port 2 */
always @ (posedge clk) begin
	if ( noc.n0.ovalid_2 == `Enable ) $write("                %d n0(2 %d) go thru %x \n", counter, noc.n0.ovch_2, noc.n0.odata_2);
	if ( noc.n1.ovalid_2 == `Enable ) $write("                %d n1(2 %d) go thru %x \n", counter, noc.n1.ovch_2, noc.n1.odata_2);
	if ( noc.n2.ovalid_2 == `Enable ) $write("                %d n2(2 %d) go thru %x \n", counter, noc.n2.ovch_2, noc.n2.odata_2);
	if ( noc.n3.ovalid_2 == `Enable ) $write("                %d n3(2 %d) go thru %x \n", counter, noc.n3.ovch_2, noc.n3.odata_2);
	if ( noc.n4.ovalid_2 == `Enable ) $write("                %d n4(2 %d) go thru %x \n", counter, noc.n4.ovch_2, noc.n4.odata_2);
	if ( noc.n5.ovalid_2 == `Enable ) $write("                %d n5(2 %d) go thru %x \n", counter, noc.n5.ovch_2, noc.n5.odata_2);
	if ( noc.n6.ovalid_2 == `Enable ) $write("                %d n6(2 %d) go thru %x \n", counter, noc.n6.ovch_2, noc.n6.odata_2);
	if ( noc.n7.ovalid_2 == `Enable ) $write("                %d n7(2 %d) go thru %x \n", counter, noc.n7.ovch_2, noc.n7.odata_2);
	if ( noc.n8.ovalid_2 == `Enable ) $write("                %d n8(2 %d) go thru %x \n", counter, noc.n8.ovch_2, noc.n8.odata_2);
	if ( noc.n9.ovalid_2 == `Enable ) $write("                %d n9(2 %d) go thru %x \n", counter, noc.n9.ovch_2, noc.n9.odata_2);
	if ( noc.n10.ovalid_2 == `Enable ) $write("                %d n10(2 %d) go thru %x \n", counter, noc.n10.ovch_2, noc.n10.odata_2);
	if ( noc.n11.ovalid_2 == `Enable ) $write("                %d n11(2 %d) go thru %x \n", counter, noc.n11.ovch_2, noc.n11.odata_2);
	if ( noc.n12.ovalid_2 == `Enable ) $write("                %d n12(2 %d) go thru %x \n", counter, noc.n12.ovch_2, noc.n12.odata_2);
	if ( noc.n13.ovalid_2 == `Enable ) $write("                %d n13(2 %d) go thru %x \n", counter, noc.n13.ovch_2, noc.n13.odata_2);
	if ( noc.n14.ovalid_2 == `Enable ) $write("                %d n14(2 %d) go thru %x \n", counter, noc.n14.ovch_2, noc.n14.odata_2);
	if ( noc.n15.ovalid_2 == `Enable ) $write("                %d n15(2 %d) go thru %x \n", counter, noc.n15.ovch_2, noc.n15.odata_2);
end
/* Port 3 */
always @ (posedge clk) begin
	if ( noc.n0.ovalid_3 == `Enable ) $write("                %d n0(3 %d) go thru %x \n", counter, noc.n0.ovch_3, noc.n0.odata_3);
	if ( noc.n1.ovalid_3 == `Enable ) $write("                %d n1(3 %d) go thru %x \n", counter, noc.n1.ovch_3, noc.n1.odata_3);
	if ( noc.n2.ovalid_3 == `Enable ) $write("                %d n2(3 %d) go thru %x \n", counter, noc.n2.ovch_3, noc.n2.odata_3);
	if ( noc.n3.ovalid_3 == `Enable ) $write("                %d n3(3 %d) go thru %x \n", counter, noc.n3.ovch_3, noc.n3.odata_3);
	if ( noc.n4.ovalid_3 == `Enable ) $write("                %d n4(3 %d) go thru %x \n", counter, noc.n4.ovch_3, noc.n4.odata_3);
	if ( noc.n5.ovalid_3 == `Enable ) $write("                %d n5(3 %d) go thru %x \n", counter, noc.n5.ovch_3, noc.n5.odata_3);
	if ( noc.n6.ovalid_3 == `Enable ) $write("                %d n6(3 %d) go thru %x \n", counter, noc.n6.ovch_3, noc.n6.odata_3);
	if ( noc.n7.ovalid_3 == `Enable ) $write("                %d n7(3 %d) go thru %x \n", counter, noc.n7.ovch_3, noc.n7.odata_3);
	if ( noc.n8.ovalid_3 == `Enable ) $write("                %d n8(3 %d) go thru %x \n", counter, noc.n8.ovch_3, noc.n8.odata_3);
	if ( noc.n9.ovalid_3 == `Enable ) $write("                %d n9(3 %d) go thru %x \n", counter, noc.n9.ovch_3, noc.n9.odata_3);
	if ( noc.n10.ovalid_3 == `Enable ) $write("                %d n10(3 %d) go thru %x \n", counter, noc.n10.ovch_3, noc.n10.odata_3);
	if ( noc.n11.ovalid_3 == `Enable ) $write("                %d n11(3 %d) go thru %x \n", counter, noc.n11.ovch_3, noc.n11.odata_3);
	if ( noc.n12.ovalid_3 == `Enable ) $write("                %d n12(3 %d) go thru %x \n", counter, noc.n12.ovch_3, noc.n12.odata_3);
	if ( noc.n13.ovalid_3 == `Enable ) $write("                %d n13(3 %d) go thru %x \n", counter, noc.n13.ovch_3, noc.n13.odata_3);
	if ( noc.n14.ovalid_3 == `Enable ) $write("                %d n14(3 %d) go thru %x \n", counter, noc.n14.ovch_3, noc.n14.odata_3);
	if ( noc.n15.ovalid_3 == `Enable ) $write("                %d n15(3 %d) go thru %x \n", counter, noc.n15.ovch_3, noc.n15.odata_3);
end

initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,noc_test);
        `ifdef __POST_PR__
        $sdf_annotate("router.sdf", noc_test.noc.n0, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n1, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n2, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n3, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n4, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n5, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n6, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n7, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n8, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n9, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n10, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n11, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n12, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n13, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n14, , "sdf.log", "MAXIMUM");
        $sdf_annotate("router.sdf", noc_test.noc.n15, , "sdf.log", "MAXIMUM");
        `endif
end

/* send_packet_0(dst, vch, len): send a packet from n0 to destination. */
task send_packet_0;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n0_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 0;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n0_ordy_p0[vch]) || id > 0 ) begin
                        n0_idata_p0 <= packet[id]; n0_ivalid_p0 <= `Enable; n0_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n0_idata_p0 <= `DATAW_P1'b0; n0_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n0_ivalid_p0 <= `Disable;
        n0_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_1(dst, vch, len): send a packet from n1 to destination. */
task send_packet_1;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n1_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 1;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n1_ordy_p0[vch]) || id > 0 ) begin
                        n1_idata_p0 <= packet[id]; n1_ivalid_p0 <= `Enable; n1_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n1_idata_p0 <= `DATAW_P1'b0; n1_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n1_ivalid_p0 <= `Disable;
        n1_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_2(dst, vch, len): send a packet from n2 to destination. */
task send_packet_2;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n2_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 2;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n2_ordy_p0[vch]) || id > 0 ) begin
                        n2_idata_p0 <= packet[id]; n2_ivalid_p0 <= `Enable; n2_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n2_idata_p0 <= `DATAW_P1'b0; n2_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n2_ivalid_p0 <= `Disable;
        n2_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_3(dst, vch, len): send a packet from n3 to destination. */
task send_packet_3;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n3_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 3;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n3_ordy_p0[vch]) || id > 0 ) begin
                        n3_idata_p0 <= packet[id]; n3_ivalid_p0 <= `Enable; n3_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n3_idata_p0 <= `DATAW_P1'b0; n3_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n3_ivalid_p0 <= `Disable;
        n3_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_4(dst, vch, len): send a packet from n4 to destination. */
task send_packet_4;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n4_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 4;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n4_ordy_p0[vch]) || id > 0 ) begin
                        n4_idata_p0 <= packet[id]; n4_ivalid_p0 <= `Enable; n4_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n4_idata_p0 <= `DATAW_P1'b0; n4_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n4_ivalid_p0 <= `Disable;
        n4_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_5(dst, vch, len): send a packet from n5 to destination. */
task send_packet_5;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n5_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 5;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n5_ordy_p0[vch]) || id > 0 ) begin
                        n5_idata_p0 <= packet[id]; n5_ivalid_p0 <= `Enable; n5_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n5_idata_p0 <= `DATAW_P1'b0; n5_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n5_ivalid_p0 <= `Disable;
        n5_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_6(dst, vch, len): send a packet from n6 to destination. */
task send_packet_6;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n6_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 6;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n6_ordy_p0[vch]) || id > 0 ) begin
                        n6_idata_p0 <= packet[id]; n6_ivalid_p0 <= `Enable; n6_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n6_idata_p0 <= `DATAW_P1'b0; n6_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n6_ivalid_p0 <= `Disable;
        n6_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_7(dst, vch, len): send a packet from n7 to destination. */
task send_packet_7;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n7_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 7;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n7_ordy_p0[vch]) || id > 0 ) begin
                        n7_idata_p0 <= packet[id]; n7_ivalid_p0 <= `Enable; n7_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n7_idata_p0 <= `DATAW_P1'b0; n7_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n7_ivalid_p0 <= `Disable;
        n7_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_8(dst, vch, len): send a packet from n8 to destination. */
task send_packet_8;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n8_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 8;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n8_ordy_p0[vch]) || id > 0 ) begin
                        n8_idata_p0 <= packet[id]; n8_ivalid_p0 <= `Enable; n8_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n8_idata_p0 <= `DATAW_P1'b0; n8_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n8_ivalid_p0 <= `Disable;
        n8_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_9(dst, vch, len): send a packet from n9 to destination. */
task send_packet_9;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n9_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 9;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n9_ordy_p0[vch]) || id > 0 ) begin
                        n9_idata_p0 <= packet[id]; n9_ivalid_p0 <= `Enable; n9_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n9_idata_p0 <= `DATAW_P1'b0; n9_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n9_ivalid_p0 <= `Disable;
        n9_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_10(dst, vch, len): send a packet from n10 to destination. */
task send_packet_10;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n10_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 10;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n10_ordy_p0[vch]) || id > 0 ) begin
                        n10_idata_p0 <= packet[id]; n10_ivalid_p0 <= `Enable; n10_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n10_idata_p0 <= `DATAW_P1'b0; n10_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n10_ivalid_p0 <= `Disable;
        n10_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_11(dst, vch, len): send a packet from n11 to destination. */
task send_packet_11;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n11_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 11;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n11_ordy_p0[vch]) || id > 0 ) begin
                        n11_idata_p0 <= packet[id]; n11_ivalid_p0 <= `Enable; n11_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n11_idata_p0 <= `DATAW_P1'b0; n11_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n11_ivalid_p0 <= `Disable;
        n11_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_12(dst, vch, len): send a packet from n12 to destination. */
task send_packet_12;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n12_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 12;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n12_ordy_p0[vch]) || id > 0 ) begin
                        n12_idata_p0 <= packet[id]; n12_ivalid_p0 <= `Enable; n12_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n12_idata_p0 <= `DATAW_P1'b0; n12_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n12_ivalid_p0 <= `Disable;
        n12_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_13(dst, vch, len): send a packet from n13 to destination. */
task send_packet_13;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n13_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 13;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n13_ordy_p0[vch]) || id > 0 ) begin
                        n13_idata_p0 <= packet[id]; n13_ivalid_p0 <= `Enable; n13_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n13_idata_p0 <= `DATAW_P1'b0; n13_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n13_ivalid_p0 <= `Disable;
        n13_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_14(dst, vch, len): send a packet from n14 to destination. */
task send_packet_14;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n14_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 14;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n14_ordy_p0[vch]) || id > 0 ) begin
                        n14_idata_p0 <= packet[id]; n14_ivalid_p0 <= `Enable; n14_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n14_idata_p0 <= `DATAW_P1'b0; n14_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n14_ivalid_p0 <= `Disable;
        n14_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* send_packet_15(dst, vch, len): send a packet from n15 to destination. */
task send_packet_15;
input [31:0] dst;
input [31:0] vch;
input [31:0] len;
reg [`DATAW:0]  packet [0:63];
integer id;
begin
        n15_ivalid_p0 <= `Disable;
        for ( id = 0; id < len; id = id + 1 )
                packet[id] <= 0;
        #(STEP)
        if (len == 1)
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEADTAIL;
        else
                packet[0][`TYPE_MSB:`TYPE_LSB] <= `TYPE_HEAD;
        packet[0][`DST_MSB:`DST_LSB] <= dst;    /* Dest ID (4-bit)   */
        packet[0][`SRC_MSB:`SRC_LSB] <= 15;     /* Source ID (4-bit) */
        packet[0][`VCH_MSB:`VCH_LSB] <= vch;    /* Vch ID (4-bit)    */
        for ( id = 1; id < len; id = id + 1 ) begin
                if ( id == len - 1 )
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_TAIL;
                else
                        packet[id][`TYPE_MSB:`TYPE_LSB] <= `TYPE_DATA;
                packet[id][15:12] <= id;	/* Flit ID   (4-bit) */
                packet[id][31:16] <= counter;	/* Enqueue time (16-bit) */
        end
        id = 0;
        while ( id < len ) begin
                #(STEP)
                /* Packet level flow control */
                if ( (id == 0 && n15_ordy_p0[vch]) || id > 0 ) begin
                        n15_idata_p0 <= packet[id]; n15_ivalid_p0 <= `Enable; n15_ivch_p0 <= vch; id = id + 1;
                end else begin
                        n15_idata_p0 <= `DATAW_P1'b0; n15_ivalid_p0 <= `Disable;
                end
        end
        #(STEP)
        n15_ivalid_p0 <= `Disable;
        n15_idata_p0 <= `DATAW_P1'b0;
end
endtask

/* noc_reset(): Reset all routers. */
task noc_reset;
begin
        rst_    <= `Enable_;
        #(STEP)
        n0_idata_p0 <= `DATAW_P1'h0; n0_ivalid_p0 <= `Disable; n0_ivch_p0 <= `VCHW_P1'h0;
        n1_idata_p0 <= `DATAW_P1'h0; n1_ivalid_p0 <= `Disable; n1_ivch_p0 <= `VCHW_P1'h0;
        n2_idata_p0 <= `DATAW_P1'h0; n2_ivalid_p0 <= `Disable; n2_ivch_p0 <= `VCHW_P1'h0;
        n3_idata_p0 <= `DATAW_P1'h0; n3_ivalid_p0 <= `Disable; n3_ivch_p0 <= `VCHW_P1'h0;
        n4_idata_p0 <= `DATAW_P1'h0; n4_ivalid_p0 <= `Disable; n4_ivch_p0 <= `VCHW_P1'h0;
        n5_idata_p0 <= `DATAW_P1'h0; n5_ivalid_p0 <= `Disable; n5_ivch_p0 <= `VCHW_P1'h0;
        n6_idata_p0 <= `DATAW_P1'h0; n6_ivalid_p0 <= `Disable; n6_ivch_p0 <= `VCHW_P1'h0;
        n7_idata_p0 <= `DATAW_P1'h0; n7_ivalid_p0 <= `Disable; n7_ivch_p0 <= `VCHW_P1'h0;
        n8_idata_p0 <= `DATAW_P1'h0; n8_ivalid_p0 <= `Disable; n8_ivch_p0 <= `VCHW_P1'h0;
        n9_idata_p0 <= `DATAW_P1'h0; n9_ivalid_p0 <= `Disable; n9_ivch_p0 <= `VCHW_P1'h0;
        n10_idata_p0 <= `DATAW_P1'h0; n10_ivalid_p0 <= `Disable; n10_ivch_p0 <= `VCHW_P1'h0;
        n11_idata_p0 <= `DATAW_P1'h0; n11_ivalid_p0 <= `Disable; n11_ivch_p0 <= `VCHW_P1'h0;
        n12_idata_p0 <= `DATAW_P1'h0; n12_ivalid_p0 <= `Disable; n12_ivch_p0 <= `VCHW_P1'h0;
        n13_idata_p0 <= `DATAW_P1'h0; n13_ivalid_p0 <= `Disable; n13_ivch_p0 <= `VCHW_P1'h0;
        n14_idata_p0 <= `DATAW_P1'h0; n14_ivalid_p0 <= `Disable; n14_ivch_p0 <= `VCHW_P1'h0;
        n15_idata_p0 <= `DATAW_P1'h0; n15_ivalid_p0 <= `Disable; n15_ivch_p0 <= `VCHW_P1'h0;
        #(STEP)
        rst_    <= `Disable_;

end
endtask

endmodule
