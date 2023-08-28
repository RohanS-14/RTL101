module siso_tb();
reg clk,rst;
reg d;
wire q;
siso dut(d,clk,rst,q,qbar);

//clk genration

initial
begin 
clk =1;
forever #10 clk=~clk;
end

//rest
task resets;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask

//initilize
task initilize;
begin
d=1'b0;
rst=1'b1;
end
endtask

task inputs(input reg i);
begin
@(negedge clk)
d= i;
end
endtask

initial
begin
initilize;
resets;
inputs(1);
inputs(0);
inputs(1);
inputs(0);
inputs(1);
end

endmodule
