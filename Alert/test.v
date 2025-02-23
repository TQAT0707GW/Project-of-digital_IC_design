`timescale 1ns/1ps

module test;

    // Testbench signals
    reg clk;
    reg [1:0] KEY;
    wire [6:0] hex0, hex1, hex2, hex3;

    // Instance of DUT (Device Under Test)
    alert uut (
        .clk(clk),
        .KEY(KEY),
        .hex0(hex0),
        .hex1(hex1),
        .hex2(hex2),
        .hex3(hex3)
    );

    // Clock generation (50 MHz clock)
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 50 MHz -> Period = 20ns (10ns high, 10ns low)
    end

    // Test sequence
    initial begin
        // Initialize inputs
        KEY = 2'b10; // No reset, no start/stop

        // Monitor output
        $monitor("Time: %0t | hex0: %b | hex1: %b | hex2: %b | hex3: %b | giay: %0d | phut: %0d", $time, hex0, hex1, hex2, hex3, uut.giay, uut.phut);
		
		#40; KEY=2'b11;
		#30; KEY=2'b01;
		#30;KEY=2'b11;
		#30;KEY=2'b01;
		#30;KEY=2'b11;
        // Test reset
        
        // Observe behavior for a while longer
        // Run for 200ms simulation time

        $stop; // End simulation
    end

endmodule