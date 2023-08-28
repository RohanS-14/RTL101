//Write an RTL and testbench for a 8x16 asynchronous dual port RAM memory.

module dualport_as_ram(rd_clk,wr_clk,rst,din,dout,re,we,re_ad,wr_ad);

parameter width=16; 
parameter depth=8 ;
parameter ad_bus=3;

input rd_clk,wr_clk,re,we,rst;
input [width-1:0] din;
output reg [width-1:0] dout;
input [ad_bus-1:0] re_ad,wr_ad;
reg [width-1:0] mem [depth-1:0];
integer i;

//for writing

always @(posedge wr_clk or posedge rst)
begin
if(rst)
	begin
	for(i=0;i<8;i=i+1)
		begin
		mem[i]<=0;
		end
	end
else if(we)
	begin
		mem[wr_ad]<=din;
	end
end
//for reading
always @(posedge rd_clk or posedge rst)
begin
if(rst)
	begin
	for(i=0;i<8;i=i+1)
		begin
		dout<=0;
		end
	end
else if(re)
	begin
		dout<=mem[re_ad];
	end
end

endmodule

