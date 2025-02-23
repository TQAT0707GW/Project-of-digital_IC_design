`timescale 1ns/1ns
module two_ram_port_testbench;

    // Testbench signals
    reg clk;
    reg wea, web;
    reg [1:0] addra, addrb;
    reg [3:0] dina, dinb;
    wire [3:0] douta, doutb;

    // Instantiate the dual_ram module
    two_ram_port_verilog uut (
        .clk(clk),
        .wea(wea),
        .web(web),
        .addra(addra),
        .addrb(addrb),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb)
    );

    // Clock generation
    always #5 clk = ~clk;

   // Initial block to apply test vectors
    initial begin
        // Initialize signals
        clk = 0;
        wea = 0;
        web = 0;
        addra = 0;
        addrb = 0;
        dina = 0;
        dinb = 0;

        // Write to port A
        #10;
        wea = 1;
        addra = 2'b00;
        dina = 4'b1010;
        #10;
        wea = 0;

        // Read from port A
        #10;
        addra = 2'b00;

        // Write to port B
        #10;
        web = 1;
        addrb = 2'b01;
        dinb = 4'b0101;
        #10;
        web = 0;

        // Read from port B
        #10;
        addrb = 2'b01;

        // Simultaneous write to port A and port B
        #10; //We=Wb=1 và adda # addb
        wea = 1;
        web = 1;
        addra = 2'b10;
        addrb = 2'b11;
        dina = 4'b1111;
        dinb = 4'b0010;
        #10;
        wea = 0;
        web = 0;
		
		#10;//Write port B
		web=1;
		dina=4'b0001;
		dinb=4'b1000;
		#10;
		web=0;
		
        // Read from both ports
        #10;
        addra = 2'b10;
        addrb = 2'b10;
		#10; //We=We=1, Adda=Addb=2'b11;
		wea = 1;
        web = 1;
        addra = 2'b11;
        addrb = 2'b11;
        dina = 4'b0000;
        dinb = 4'b0110;
		#10;
		wea=0;
		web=0;
		#10;
        addra = 2'b11;
        addrb = 2'b11;
		#10;
        addra = 2'b00;
        addrb = 2'b01;
        // Finish simulation
        #10;
        $finish;
    end

    // Monitor to display the signals
   

endmodule
