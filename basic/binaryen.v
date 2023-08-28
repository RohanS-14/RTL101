module binaryen(p,y);
input [7:0]p;
output [3:0]y;

assign y[0]=p[7]||p[5]||p[3]||p[1];
assign y[1]=p[7]||p[6]||p[3]||p[2];
assign y[2]=p[7]||p[6]||p[5]||p[4];

endmodule