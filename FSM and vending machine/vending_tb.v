module vending_tb();
reg clk,rst;
reg [1:0]coin;
wire out;
wire change;

coin_vending dut(coin,rst,clk,out,change);

initial
begin
clk=1'b0;
forever 
#10
clk=~clk;
end

task resets;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask

task intilize;
begin
coin=0;
end
endtask

task coins(input [1:0]in);
begin
coin = in;
end
endtask

initial 
begin
intilize;#20;
resets;#20;
coin=1;#20;
coin=2;#30;
coin=2;#20;
coin=0;#20;
coin=2;#25;
end

initial
#1000 $finish();
endmodule

