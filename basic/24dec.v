module decoder24(a,b,en,i0,i1,i2,i3);
input a,b,en;
output i0,i1,i2,i3;

wire na,nb;
assign na= ~a;
assign nb= ~b;


assign i0 = na&nb&en;
assign i1 = na&b&en;
assign i2 = a&nb&en;
assign i3 = a&b&en;

endmodule