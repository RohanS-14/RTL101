module upcounter_tb();
reg clk,rst,load;
reg [0:3] d;
wire [0:3] q;

upcounter dut(d,load,clk,rst,q);

//clk generation

initial 
begin 
clk=1;
forever
#10 clk= ~clk;
end
//reset

task reset;
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
rst=1'b0;
d=4'b0000;
load=1'b0;
end
endtask

//inputs

task inputs(input [0:3]i);
begin
@(negedge clk)
load=1'b1;
d = i;
@(negedge clk)
load=1'b0;
end
endtask

initial
begin
initilize;
reset;
inputs(4'b0110);
end

initial #500 $finish();

endmodule


