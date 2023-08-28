//.Write a RTL to design 4 bit loadable binary synchronous up down counter.

module downcounter(input [0:3] d, input sel,clk,rst,output reg [0:3]q);

always@(posedge clk)
begin
if(rst)
q <=4'b0;
else if(sel==1'b0)
     if(d==4'b1111)
	 q<=4'b0000;
	 else
	 q<=q+1;
else 
    if(q==4'b0000)
	q<=4'b1111;
	else
	q=q-1;
end	 

endmodule