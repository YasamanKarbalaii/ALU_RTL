`timescale 1ns / 1ps
module ALU_RTL(
   input [7:0] a,
	input [7:0] b,
	input cin,
	input clk,
	input rst,
	input [2:0] select,
	input [1:0] select_Calculation,
	input [1:0] select_Logic,
	output [7:0] final
);
wire [7:0] outc;
wire [7:0] outl;
reg [7:0] result;
Calculation_unit C(
   .a(a),
	.b(b),
	.select(select_Calculation),
	.cin(cin),
	.clk(clk),
	.rst(rst),
	.result(outc)
);
Logic_unit L(
   .a(a),
	.b(b),
	.select(select_Logic),
	.result(outl)
);
always @(posedge clk) begin
   if(rst)
	 result = 8'b00000000;
	else begin
	 case(select)
	   3'b000 : result = outc;
		3'b001 : result = outl;
		3'b010 : result = a >> 1;
		3'b011 : result = a << 1;
		3'b100 : result = {a[0] , a[7:1]};
		3'b101 : result = {a[6:0] , a[7]};
		default : result = 8'b00000000;
	 endcase
   end
end
assign final = result;
endmodule
