module mux21(s,i1,i2,y);
input s,i1,i2;
output y;

assign y = (i1|~s) & (i2|s);

endmodule