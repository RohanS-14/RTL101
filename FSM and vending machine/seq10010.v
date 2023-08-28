module seq10010(input clk,rst,in,output done);

reg [2:0] present_state,next_state;

parameter s0=3'b000;
parameter s1=3'b001;
parameter s2=3'b010;
parameter s3=3'b011;
parameter s4=3'b100;

always@(posedge clk)
begin
if(rst)
	present_state <= 2'b0;
	done = 2'b0;
else
	present_state <= next_state;

end

always@(*)
begin
	next_state=s0;
	case(present_state)
		s0: if(in)	
				next_state=s1;
			else
				next_state=s0;	
		s1: if(!in)
				next_state=s2;
			else 
				next_state=s1; 
		s2:  if(!in)
				next_state=s3;
			else 
				next_state=s1; 
		s3:  if(in)
				next_state=s4;
			else 
				next_state=s0; 
		s4: if(!in)
				next_state=s0;
			else
				next_state=s1; 
		endcase
	end
	
assign done = (present_state == s4)?1'b1:1'b0;

endmodule
	