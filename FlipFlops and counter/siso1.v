module siso2(input si,so,clk,rst,output reg q);
reg [0:3]temp;

always@(posedge clk)
begin
if(rst)
q<=1'b0;
else
temp[0]<=si;
temp <= temp>>1;
q<=temp[3];
end

endmodule

