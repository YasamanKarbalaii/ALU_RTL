`timescale 1ns / 1ps
module FA(a,b,cin,cout,sum);
input a,b,cin;
output cout,sum;
assign sum = a^b^cin;
assign cout = (a&b) | (a&cin) | (b&cin);
endmodule
