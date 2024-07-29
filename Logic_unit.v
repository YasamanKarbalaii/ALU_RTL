`timescale 1ns / 1ps
module Logic_unit(
   input [7:0] a,
	input [7:0] b,
	input [1:0] select,
	output [7:0] result
);
wire [3:0] data1;
wire [3:0] data2;
wire [3:0] data3;
wire [3:0] data4;
wire [3:0] data5;
wire [3:0] data6;
wire [3:0] data7;
wire [3:0] data8;
Mux_Four_in_one mux1(
   .data(data1),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(result[0])
);
Mux_Four_in_one mux2(
   .data(data2),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(result[1])
);
Mux_Four_in_one mux3(
   .data(data3),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(result[2])
);
Mux_Four_in_one mux4(
   .data(data4),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(result[3])
);
Mux_Four_in_one mux5(
   .data(data5),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(result[4])
);
Mux_Four_in_one mux6(
   .data(data6),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(result[5])
);
Mux_Four_in_one mux7(
   .data(data7),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(result[6])
);
Mux_Four_in_one mux8(
   .data(data8),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(result[7])
);
and(data1[0],a[0],b[0]);
and(data2[0],a[1],b[1]);
and(data3[0],a[2],b[2]);
and(data4[0],a[3],b[3]);
and(data5[0],a[4],b[4]);
and(data6[0],a[5],b[5]);
and(data7[0],a[6],b[6]);
and(data8[0],a[7],b[7]);
or(data1[1],a[0],b[0]);
or(data2[1],a[1],b[1]);
or(data3[1],a[2],b[2]);
or(data4[1],a[3],b[3]);
or(data5[1],a[4],b[4]);
or(data6[1],a[5],b[5]);
or(data7[1],a[6],b[6]);
or(data8[1],a[7],b[7]);
xor(data1[2],a[0],b[0]);
xor(data2[2],a[1],b[1]);
xor(data3[2],a[2],b[2]);
xor(data4[2],a[3],b[3]);
xor(data5[2],a[4],b[4]);
xor(data6[2],a[5],b[5]);
xor(data7[2],a[6],b[6]);
xor(data8[2],a[7],b[7]);
not(data1[3],a[0]);
not(data2[3],a[1]);
not(data3[3],a[2]);
not(data4[3],a[3]);
not(data5[3],a[4]);
not(data6[3],a[5]);
not(data7[3],a[6]);
not(data8[3],a[7]);
endmodule
