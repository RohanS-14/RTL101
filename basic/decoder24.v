module deco24(a,b,p);
input a,b;
output [3:0]p;
assign p[3]=~a&~b;
assign p[2]=~a&b;
assign p[1]=a&~b;
assign p[0]=a&b;
endmodule