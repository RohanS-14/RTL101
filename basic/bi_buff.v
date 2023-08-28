module bi_buff(a,b,ct);
inout a,b;
input ct;

bufif1 b1(b,a,ct);
bufif0 b2(a,b,ct);

endmodule