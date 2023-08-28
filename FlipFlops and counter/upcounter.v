//3.Write an RTL description for 4-bit synchronous loadable up counter and verify using test bench.
module upcounter(input [0:3] d, input load,clk,rst,output reg [0:3]q);

always@(posedge clk)
begin
if(rst)
q<=4'b0;
else if(load == 1'b1)
q<=d;
else if(q==4'b1111)
q<= 4'b0;
else 
q<=q+1'b1;
end

endmodule

