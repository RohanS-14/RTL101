module dff(input d,clk,rst, output reg q, output qbar);

always @(posedge clk)
begin
if(rst==1'b0)
q <= d;
else
q <= 1'b0;
end

assign qbar = ~q ;

endmodule