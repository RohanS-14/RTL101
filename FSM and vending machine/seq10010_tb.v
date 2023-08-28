module sequnce_tb();
reg clk,rst,in;
wire done;
integer i;

seq10010 dut(clk,rst,in,done);

initial
begin 
clk =1'b1;
forever #10 clk=~clk;
end

task reset();
begin
@(negedge clk)
rst=1'b1; #10;
@(negedge clk)
rst=1'b0; 
end
endtask

task initilize();
begin
@(negedge clk)
in=1'b0;
rst=1'b0;
end
endtask

task inputs(input i);
begin
@(negedge clk)
in=i;#30;
end
endtask

initial
begin
initilize;
reset; 
inputs(1'b0);
inputs(1'b1);
inputs(1'b0);
inputs(1'b0);
inputs(1'b1);
inputs(1'b0);
end
initial #1000 $finish;

endmodule