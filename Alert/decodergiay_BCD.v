module decoderdonvi_BCD(
    input [5:0] value,   
    output reg [6:0] display
);
reg [3:0] t;
always @(*) begin
	t<=value%4'd10;
    case(t)
        4'b0000: display = 7'b1000000; // 0
        4'b0001: display = 7'b1111001; // 1
        4'b0010: display = 7'b0100100; // 2
        4'b0011: display = 7'b0110000; // 3
        4'b0100: display = 7'b0011001; // 4
        4'b0101: display = 7'b0010010; // 5
        4'b0110: display = 7'b0000010; // 6
        4'b0111: display = 7'b1111000; // 7
        4'b1000: display = 7'b0000000; // 8
        4'b1001: display = 7'b0011000; // 9
        default: display = 7'b1111111; // 
    endcase
end
endmodule