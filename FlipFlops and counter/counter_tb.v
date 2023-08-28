module counter_tb();
reg clk,rst,load;
wire [0:3]q;
reg [0:3] dn;

counter dut(clk,rst,load,dn,q);

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
dn=4'b0000;
load=1'b0;
end
endtask

//inputs

task inputs(input [0:3]i);
begin
@(negedge clk)
load=1'b1;
dn = i;
@(negedge clk)
load=1'b0;
end
endtask

initial
begin
initilize;
reset;
inputs(4'b0111);
end

initial #1000 $finish();

endmodule
