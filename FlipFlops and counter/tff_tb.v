module tff_tb();
reg t;
reg clk,rst;
wire q ,qbar;

tff dut(t,clk,rst,q,qbar);
always #5 clk= ~clk;
always #40 rst =~rst;

initial 
begin 
rst=1'b0;clk=1'b1;
#10 t=1'b0;
#10 t=1'b1;
#10 t=1'b1;
#10 t=1'b0;
#10 t=1'b0;
#10 t=1'b1;
#10 t=1'b1;
#10 t=1'b0;
end

initial #200 $finish;
endmodule