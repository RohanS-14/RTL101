module topmodule_tc();
reg [7:0]i;
wire [2:0] y;
wire idle;
integer e;

topmodule dut(.i(i),.y(y),.idle(idle));

initial 
begin
i= 'bz;
#10;
end

initial 
begin
for(e=0;e<128;e=e+1)
begin
i=e;
#10;
$monitor("the value of i=%b and the output y=%b",i,y);
end
end



initial #300 $finish();
endmodule



