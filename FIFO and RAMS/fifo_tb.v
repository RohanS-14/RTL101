module fifo_tb();

parameter data_width=8,
  data_depth=16,
  address_bus=5;
  
reg clk,rst,re,we;
wire [data_width-1:0]dataout;
reg [data_width-1:0]datain;
wire full,empty;
integer i;

fifo dut(clk,rst,re,we,full,empty,datain,dataout);

initial
begin 
	clk=1'b0;
	forever 
	#10 
	clk=~clk;
end

task reset;
	begin 
	@(negedge clk)
		rst=1'b1;
	@(negedge clk)
		rst=1'b0;
	end
endtask

task initilize;
	begin
		re=0;
		we=0;
	end
endtask

task write;
	begin
	for(i=0;i<16;i=i+1)
	@(negedge clk)
		begin
			we=1;
			datain=i;
		end
	end
endtask

task read;
	begin
	@(negedge clk)
		re =1;
	end
endtask

initial
begin
	initilize;
	reset;
	write;
	read;
end

endmodule
