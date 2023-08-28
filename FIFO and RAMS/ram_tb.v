
module mem16_4ram_tb();

parameter width = 8;
parameter depth =16;
parameter add_bus=4;

reg clk,rst,ra,wa;
reg [width-1:0] data_in;
reg [add_bus-1:0] re_ad,wr_ad;
wire [width-1:0]data_out;

dualport16_8ram dut(clk,rst,ra,wa,data_in,re_ad,wr_ad,data_out);

initial 
begin 
clk=1;
forever
#10 clk= ~clk;
end 

task resets;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask

task write(input [3:0] address,input [width-1:0]datawr);
begin
@(negedge clk)
wr_ad=address;
data_in=datawr;
wa=1'b0;
@(negedge clk)
wr_ad=address;
data_in=datawr;
wa=1'b1;
end
endtask

task read(input [3:0] address);
begin
@(negedge clk)
ra=1'b0;
re_ad=address;
@(negedge clk)
ra=1'b1;
re_ad=address;
end
endtask

task initialz();
begin
ra='b0;
wa='b0;
data_in='bzz;
end
endtask


initial
begin
initialz;
resets;
write(4'b0101,8'b01111101);#10;
write(4'b0000,8'b11001100);#10;
read(4'b0000);#10;
write(4'b1111,8'b11111111);#10;
read(4'b1111);#10;
end

endmodule