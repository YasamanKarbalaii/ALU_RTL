`timescale 1ns / 1ps

module ALU_RTL_TB;
	reg [7:0] a;
	reg [7:0] b;
	reg cin;
	reg clk;
	reg rst;
	reg [2:0] select;
	reg [1:0] select_Calculation;
	reg [1:0] select_Logic;
	wire [7:0] result;
	ALU_RTL uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.clk(clk), 
		.rst(rst), 
		.select(select), 
		.select_Calculation(select_Calculation), 
		.select_Logic(select_Logic), 
		.final(result)
	);
	initial begin
	  clk = 0;
	  forever #5 clk = ~clk;
	end
	initial begin
	  rst = 1;
	  #20;
	  rst = 0;
	  #50;
	  a = 8'b01010101;
	  b = 8'b10110101;
	  select = 3'b000;
	  select_Calculation = 2'b00;
	  cin = 0;
	  #50; 
	  a = 8'b11011011;
	  b = 8'b10101010;
	  select_Calculation = 2'b01;
	  cin = 1;
	  #50; 
     select_Calculation = 2'b10;
	  cin = 1;
     #50; 
     select_Calculation = 2'b11;
	  cin = 0;
	  #50; 
	  select = 3'b001;
	  a = 8'b0101010;
	  b = 8'b11100011;
	  select_Logic = 2'b00;
	  #50;
	  select_Logic = 2'b01;
	  #50;
	  select_Logic = 2'b10;
	  #50;
	  select_Logic = 2'b11;
	  #50;
	  a = 8'b00010111;
	  select = 3'b010;
	  #50;
	  a = 8'b10010111;
	  select = 3'b011;
	  #50;
	  select = 3'b100;
	  #50;
	  select = 3'b101;
	  #50;
	  $stop;
	end
endmodule

