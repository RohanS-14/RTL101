module srlatch_tb();
reg s,r;
wire q,qbar;

srlatch dut(s,r,q,qbar);

initial
begin
{s,r}=2'b00; #10;
{s,r}=2'b10; #10;
{s,r}=2'b01; #10;
{s,r}=2'b11; #10;
end

initial
#50 $finish();
endmodule