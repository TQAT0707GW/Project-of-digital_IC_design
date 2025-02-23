
module spiMaster_tb;
	reg clk;
	reg reset;
	reg [15:0] dataIn;
	wire spi_CS;
	wire spi_sclk;
	wire spiData;
	wire [4:0] counter;
	spiMaster dut(
		.clk(clk),
		.reset(reset),
		.dataIn(dataIn),
		.spi_CS(spi_CS),
		.spi_sclk(spi_sclk),
		.spiData(spiData),
		.counter(counter)
	);
	
	initial begin
		clk=0;
		reset =1;
		dataIn=0;
	end
	always #5 clk = ~clk;
	initial begin
	#10 	reset =1'b0;
	#10 	dataIn=16'hA569;
	#335 	dataIn=16'h2563;
	#335	dataIn=16'h9B63;
	#335	dataIn=16'h6A61;
	
	#335	dataIn=16'hA265;
	#335	dataIn=16'h7564;
	
	end
endmodule