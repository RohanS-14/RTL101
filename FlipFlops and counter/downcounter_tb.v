module downcounter_tb();
reg clk,rst,sel;
reg [0:3] d;
wire [0:3] q;

downcounter dut(d,sel,clk,rst,q);

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
end
endtask

//inputs
task fun;
begin
@(negedge clk)
d=4'b0000 ;sel=1'b0; #150; 
@(negedge clk)
d=4'b1111 ;sel=1'b1; #150;
end
endtask

initial
begin
initilize;
reset;
fun;
end


endmodule


