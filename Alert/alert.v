module alert(clk,hex0,hex1,hex2,hex3,KEY);
	input clk;
	input [1:0] KEY;
	output reg [6:0] hex0,hex1,hex2,hex3;
	reg [25:0] counter ;
	reg clk_1Hz,flag1,run;
	reg [5:0] phut,giay;
	wire [6:0] giay_hex0,giay_hex1,phut_hex2,phut_hex3;
	always @(posedge clk)
	begin
		counter<=counter+1'b1;
		if(counter ==26'd49999999)
		begin
			clk_1Hz=1;
			counter<=1'b0;
		end
		else
			clk_1Hz=0;
	end
	always @(posedge clk, negedge KEY[1])
	begin
		if(KEY[1]==1'b0)
		begin
			flag1=1'b1;
		end
		else
		begin
			run=run^flag1;
			flag1=1'b0;
		end
	end
	always @(posedge clk,negedge KEY[0])
	begin
		if(KEY[0]==1'b0)
		begin
			giay<=0;
			phut<=0;
		end
		else
		begin
			if(run==1'b0)
			begin
				if(giay == 6'd59) begin
					giay <= 6'd0;
					if (phut == 6'd59) 
					begin
						phut <= 6'd0;
					end 
					else 
					begin
						phut <= phut + 1'b1;
					end
				end 
				else 
				begin
					giay <= giay + 1'b1;
				end
			end
			else
			begin
				giay<=giay;
				phut<=phut;
			end
		end
		hex0<=giay_hex0[6:0];
		hex1<=giay_hex1[6:0];
		hex2<=phut_hex2[6:0];
		hex3<=phut_hex3[6:0];
	end
	decoderdonvi_BCD UU1(.value(giay),.display(giay_hex0));
	decoderchuc_BCD UU2(.value(giay),.display(giay_hex1));
	decoderdonvi_BCD UU3(.value(phut),.display(phut_hex2));
	decoderchuc_BCD UU4(.value(phut),.display(phut_hex3));
	
endmodule