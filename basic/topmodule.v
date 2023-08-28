module topmodule(i,y,idle);
input [7:0]i;
output [2:0]y;
output idle;
wire [7:0]x;

prici b1(i,x,idle);
binaryen b2(x,y);

endmodule