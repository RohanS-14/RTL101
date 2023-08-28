module mux24_tb();
reg s0,s1;
reg [3:0]i;
tri y;
integer x;
integer v;

mux24 dut(.s0(s0),.s1(s1),.i(i),.y(y));


initial
begin 
for(x=0;x<4;x=x+1)
begin
{s0,s1}=x;
#10;
end
end
initial
begin 
for(v=0;v<16;v=v+1)
begin
i=v;
#10;
end
end

initial
#200 $finish();

endmodule

