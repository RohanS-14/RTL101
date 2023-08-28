module sequence_dect(input clk,rst,dn,output y);

//1100

parameter S0=3'b000;
parameter S1=3'b001;
parameter S2=3'b010;
parameter S3=3'b011;
parameter S4=3'b100;

reg [2:0] present_state,next_state;

always@(posedge clk)
begin
if(rst)
present_state <= S0;
else
present_state <= next_state;
end

always@(*)
begin
next_state= S0;
case(present_state)
S0 : if(dn) 
next_state=S1;
else
next_state=S0;
S1 : if(dn) 
next_state=S2;
else
next_state=S0;
S2 : if(~dn) 
next_state=S3;
else
next_state=S2;
S3 : if(~dn) 
next_state<=S4;
else
next_state=S0;
S4 : if(~dn) 
next_state=S1;
else
next_state=S0;
default : next_state = S0;
endcase
end

assign y = (present_state == S4) ? 1'b1 : 1'b0 ;

endmodule