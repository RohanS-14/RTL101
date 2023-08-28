module decoder_tb();
reg a,b,en;
wire i0,i1,i2,i3;
integer j;

decoder24 dut(a,b,en,i);

initial 
begin
{a,b,en}=3'b000;
#5;
end

initial
begin
en=1'b1;
for(j=0;j<4;j=j+1)
begin
{a,b}=j;
#5;
end
end

initial #100 $finish();

endmodule
