`timescale 1ns / 1ps
module Mux_Eight_in_one(
   input [7:0] data,
	input [2:0] select,
	input rst,
	input clk,
	output reg out
);
always @(posedge clk) begin
  if(rst)
    out = 0;
   else begin
	  case(select)
	    3'b000 : out = data[0];
		 3'b001 : out = data[1];
		 3'b010 : out = data[2];
		 3'b011 : out = data[3];
		 3'b100 : out = data[4];
		 3'b101 : out = data[5];
		 3'b110 : out = data[6];
		 3'b111 : out = data[7];
		 default: out = 0;
	  endcase
	end
end
endmodule
