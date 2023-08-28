module coin_vending(input [1:0] coin,input rst,clk,output reg out,output reg change);

parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;

reg [1:0] pre,next;

always @(posedge clk)
    begin
	    if(rst)
		pre<=s0;
		else
		pre<=next;
	end

always @(posedge clk)
	begin 
		next=s0;
		case(coin)
		s0: if(coin ==1)
				next=s1;
			else if(coin==2)
				next=s2;
		s1: if(coin ==2)
				next=s2;
			else if(coin==2)
				next=s0;
			else
				next=s1;
		s2 :if(coin==1 || coin==2)
				next=s0;
			else
				next=s2;
		endcase
	end

always@(posedge clk)
	begin
		out<=0;
		change<=0;
		case(pre)
			s1:if(coin==2)
				out<=1;
			s2:if(coin==1)
				out<=1;
				else if(coin==2)
				begin
					out<=1;
					change<=1;
				end
		endcase
	end
	
endmodule
	