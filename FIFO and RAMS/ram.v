module dualport16_8ram(clk,rst,ra,wa,data_in,re_ad,wr_ad,data_out);

parameter width = 8;
parameter depth =16;
parameter add_bus=4;
integer i;

input clk,rst,ra,wa;
input [width-1:0] data_in;
input [add_bus-1:0] re_ad,wr_ad;
output reg [width-1:0]data_out;



reg [width-1:0] mem [depth-1:0];

always@(posedge clk)
begin
//making all location 0 if rst
if(rst)
begin
data_out<=0;
for(i=0;i<width-1;i=i+1)
begin 
mem[i]<=0;
end
end

//read

else if(ra)
data_out <= mem[re_ad];

//write

else if(wa)
mem[wr_ad]<=data_in;
end
endmodule


