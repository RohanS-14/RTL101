module halfadder_tb();
reg a,b;
wire sum,carry;
integer i;

halfadder dut(sum,carry,a,b);

initial 
begin
#10 {a,b}=2'b00;
end

initial 
begin
for(i=0;i<4;i=i+1)
begin
{a,b}=i;
#5;
end
end

initial #100 $finish();

endmodule