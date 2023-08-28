module halfadder(a,b,sum,carry);
input a,b;
output sum,carry;

assign sum= a ^ b;
assign carry = a &b;

endmodule

module fulladder(sum,carry,a,b,c);
input a,b,c;
output sum,carry;

wire c1,c2,s1,s2;

halfadder d1(a,b,s1,c1);
halfadder d2(s1,c,sum,c2);
or d3(carry,c1,c2);

endmodule