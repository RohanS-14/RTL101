//implement SR latch in gate level modelling and verify using test bench.

module srlatch(input s,r,output q,qbar);

nor(qbar,s,q);
nor(q,r,qbar);

endmodule
