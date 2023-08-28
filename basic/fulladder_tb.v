module fulladder_tb();
reg a,b,c;
wire sum,carry;
integer i;

fulladder dut(a,b,c,sum,carry);

initial 
begin
{a,b,c}=3'b000;
end

initial
begin
for(i=0;i<8;i=i+1)
begin
{a,b,c}=i;
#5;
end
end

initial #200 $finish();

endmodule