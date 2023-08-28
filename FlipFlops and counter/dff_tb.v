module dff_tb();
reg clk,rst,d;
wire q;
wire qbar;

dff dut(d,clk,rst,q,qbar);
initial
begin
clk = 1'b0;
forever 
#5 clk = ~clk;
end

initial
begin
d=1'bz;
rst=1'bz;#10;
end

initial
begin
d=1'b1; rst=1'b1;#10;
d=1'b1; rst=1'b0;#10;
d=1'b0; rst=1'b0;#10;
d=1'b1; rst=1'b0;#10;
d=1'b1; rst=1'b0;#10;
end

initial #300 $finish();

endmodule