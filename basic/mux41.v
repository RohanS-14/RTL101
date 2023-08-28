module mux41(i0,i1,i2,i3,s0,s1,y);
input i0,i1,i2,i3,s0,s1;
output y;

wire y1,y2;

mux21 d1(s1,i0,i1,y1);
mux21 d2(s1,i2,i3,y2);
mux21 d3(s0,y1,y2,y);

endmodule