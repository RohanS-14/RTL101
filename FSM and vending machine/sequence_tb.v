module sequnce_tb();
reg clk,rst,dn;
wire y;
integer i;

sequence_dect dut(clk,rst,dn,y);

initial
begin 
clk =1'b1;
forever #10 clk=~clk;
end

task reset();
begin
@(negedge clk)
rst=1'b1; 
@(negedge clk)
rst=1'b0; 
end
endtask

task initilize();
begin
@(negedge clk)
dn=1'b0;
rst=1'b0;
end
endtask

task inputs();
begin
dn=1'b1;#20;
dn=1'b1;#20;
dn=1'b1;#20;
dn=1'b0;#20;
dn=1'b0;#20;
dn=1'b0;#20;
end
endtask

initial
begin
initilize;
reset; 
inputs;
end

endmodule