module bi_buff_tb();
wire a,b;
reg ct;
integer i;
reg tempa,tempb;

bi_buff dut(a,b,ct);

assign a=ct?tempa:1'bz;
assign b=~ct?tempb:1'bz;

initial
begin
for(i=0;i<=8;i=i+1)
begin
{tempa,tempb,ct}=i;
#10;
end
end

initial 
$monitor(" a = %b , b = %b ,ct = %b",a,b,ct);

initial
#200 $finish();

endmodule