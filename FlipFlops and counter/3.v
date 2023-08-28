module counter(clk,rst,load,dn,q);
input [0:3] dn;
output reg [0:3] q;
input clk,rst,load;

always @(posedge clk)
begin
if (rst)
q <= 4'b0;
else if (load)
q<= dn;
else if(q >= 4'd11)
q<=4'b0;
else
q<= q+1;
end

endmodule