//.Write structural model for T flip flop using D flip flop
module tff(t,clk,rst,q,qbar);
input t,clk,rst;
output q;
output qbar;
wire c;

assign c=~t;

dff d1(c,clk,rst,q,qbar);

endmodule
