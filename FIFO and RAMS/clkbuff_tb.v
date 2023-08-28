module clkbuff_tb();
reg iclk;
wire oclk;
parameter t = 1.90625;
realtime t1,t2,t3,t4,t5,t6;

clkbuff dut(iclk,oclk);

initial
begin
	iclk=1'b0;
	forever
	#(t/2) iclk=~iclk;
end

task master;
	begin
	@(posedge iclk) t1=$realtime;
	@(posedge iclk) t2=$realtime;
	t3=t2-t1;
	end
endtask

task buffout;
	begin
	@(posedge oclk) t4=$realtime;
	@(posedge oclk) t5=$realtime;
	t6=t5-t4;
	end
endtask

task freq_phase;
	realtime f,p;
	begin
	f=t6-t3;
	p=t4-t1;
	$display("freq diff = %0t ,phase diff =%0t",f,p);
	end
endtask

initial
	begin
		fork master;
			buffout;
		join freq_phase;
	end
	
endmodule