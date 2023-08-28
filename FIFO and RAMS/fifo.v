//fifo 

module fifo(clk,rst,re,we,full,empty,datain,dataout);
parameter data_width=8,
  data_depth=16,
  address_bus=5;
    
	input clk,rst,we,re;
	
	reg [address_bus-1:0] wr_ad,re_ad; //pointers
	
	reg [data_width-1:0]mem[data_depth-1:0]; //memory
	
	output reg [data_width-1:0]dataout;
	input [data_width-1:0]datain;
	output full,empty;
	integer i;
	
	
	always@(posedge clk)
	begin
		if(rst)
		for(i=0;i<data_depth;i=i+1)
		begin
			mem[i]<=0;
			wr_ad<=0;
			dataout<=0;
			re_ad<=0;
		end
		else if(we==1&&full==0)
		begin
			mem[wr_ad[3:0]]<=datain;
			wr_ad<=wr_ad+1;
		end
		else if(re==1&& empty==0)
		begin
			dataout<= mem[re_ad[3:0]];
			re_ad<=re_ad+1;
		end
	end
		
	assign empty=(wr_ad==re_ad)?1'b1:1'b0;
	assign full=(wr_ad==({~re_ad[4],re_ad[3:0]}))?1'b1:1'b0;
	
endmodule

