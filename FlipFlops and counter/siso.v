module siso(input d,clk,rst,output q,output qbar);

wire q1,q2,q3,qbar1,qbar2,qbar3;


dff d1(d,clk,rst,q1,qbar1);
dff d2(q1,clk,rst,q2,qbar2);
dff d3(q2,clk,rst,q3,qbar3);
dff d4(q3,clk,rst,q,qbar);

endmodule