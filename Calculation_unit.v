`timescale 1ns / 1ps
module Calculation_unit(
    input [7:0] a,
	 input [7:0] b,
	 input [1:0] select,
	 input cin,
	 input clk,
	 input rst,
	 output [7:0] result
);
wire [7:0] cout;
reg [3:0] data1;
reg [3:0] data2;
reg [3:0] data3;
reg [3:0] data4;
reg [3:0] data5;
reg [3:0] data6;
reg [3:0] data7;
reg [3:0] data8;
wire [7:0] outmux;
wire [7:0] outfa;
Mux_Four_in_one mux1(
    .data(data1),
	 .select(select),
	 .rst(rst),
	 .clk(clk),
	 .out(outmux[0])
);
Mux_Four_in_one mux2(
    .data(data2),
	 .select(select),
	 .rst(rst),
	 .clk(clk),
	 .out(outmux[1])
);
Mux_Four_in_one mux3(
    .data(data3),
	 .select(select),
	 .rst(rst),
	 .clk(clk),
	 .out(outmux[2])
);
Mux_Four_in_one mux4(
    .data(data4),
	 .select(select),
	 .rst(rst),
	 .clk(clk),
	 .out(outmux[3])
);
Mux_Four_in_one mux5(
    .data(data5),
	 .select(select),
	 .rst(rst),
	 .clk(clk),
	 .out(outmux[4])
);
Mux_Four_in_one mux6(
    .data(data6),
	 .select(select),
	 .rst(rst),
	 .clk(clk),
	 .out(outmux[5])
);
Mux_Four_in_one mux7(
    .data(data7),
	 .select(select),
	 .rst(rst),
	 .clk(clk),
	 .out(outmux[6])
);
Mux_Four_in_one mux8(
    .data(data8),
	 .select(select),
	 .rst(rst),
	 .clk(clk),
	 .out(outmux[7])
);
FA fa1(
   .a(a[0]),
	.b(outmux[0]),
	.cin(cin),
	.cout(cout[0]),
	.sum(outfa[0])
);
FA fa2(
   .a(a[1]),
	.b(outmux[1]),
	.cin(cout[0]),
	.cout(cout[1]),
	.sum(outfa[1])
);
FA fa3(
   .a(a[2]),
	.b(outmux[2]),
	.cin(cout[1]),
	.cout(cout[2]),
	.sum(outfa[2])
);
FA fa4(
   .a(a[3]),
	.b(outmux[3]),
	.cin(cout[2]),
	.cout(cout[3]),
	.sum(outfa[3])
);
FA fa5(
   .a(a[4]),
	.b(outmux[4]),
	.cin(cout[3]),
	.cout(cout[4]),
	.sum(outfa[4])
);
FA fa6(
   .a(a[5]),
	.b(outmux[5]),
	.cin(cout[4]),
	.cout(cout[5]),
	.sum(outfa[5])
);
FA fa7(
   .a(a[6]),
	.b(outmux[6]),
	.cin(cout[5]),
	.cout(cout[6]),
	.sum(outfa[6])
);
FA fa8(
   .a(a[7]),
	.b(outmux[7]),
	.cin(cout[6]),
	.cout(cout[7]),
	.sum(outfa[7])
);
always @(posedge clk) begin
  if(rst) begin
    data1 = 4'b0000;
	 data2 = 4'b0000;
	 data3 = 4'b0000;
	 data4 = 4'b0000;
	 data5 = 4'b0000;
	 data6 = 4'b0000;
	 data7 = 4'b0000;
	 data8 = 4'b0000;
  end
  else begin
    case(select)
	   2'b00 : begin
		  data1[0] = b[0];
		  data2[0] = b[1];
		  data3[0] = b[2];
		  data4[0] = b[3];
		  data5[0] = b[4];
		  data6[0] = b[5];
		  data7[0] = b[6];
		  data8[0] = b[7];
		 end
		 2'b01 : begin
		   data1[1] = ~b[0];
			data2[1] = ~b[1];
			data3[1] = ~b[2];
			data4[1] = ~b[3];
			data5[1] = ~b[4];
			data6[1] = ~b[5];
			data7[1] = ~b[6];
			data8[1] = ~b[7];
		 end
		 2'b10 : begin
		   data1[2] = 0;
			data2[2] = 0;
			data3[2] = 0;
			data4[2] = 0;
			data5[2] = 0;
			data6[2] = 0;
			data7[2] = 0;
			data8[2] = 0;
		 end
		 2'b11 : begin
		   data1[3] = 1;
			data2[3] = 1;
			data3[3] = 1;
			data4[3] = 1;
			data5[3] = 1;
			data6[3] = 1;
			data7[3] = 1;
			data8[3] = 1;
		 end
		 default : begin
		   data1 = 4'b0000;
	      data2 = 4'b0000;
			data3 = 4'b0000;
			data4 = 4'b0000;
			data5 = 4'b0000;
			data6 = 4'b0000;
			data7 = 4'b0000;
			data8 = 4'b0000;
	    end
	 endcase
	end
end
assign result = outfa;
endmodule
