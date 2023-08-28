module mux41_tb();
reg i0,i1,i2,i3,s0,s1;
wire y;
mux41 dut(i0,i1,i2,i3,s0,s1,y);
integer i;

initial 
begin
{s0,s1}=2'bxx;
#10;
end


initial
begin
for(i=0;i<64;i=i+1)
begin
{s0,s1,i3,i2,i1,i0}=i;
#10;
end
end

initial #1000 $finish();

endmodule