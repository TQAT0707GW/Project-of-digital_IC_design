
module buttonControl(
input clock,
input reset,
input button,
output reg valid_vote
);

reg [3:0] counter;

always @(posedge clock)
begin
    if(reset)
        counter <= 0;
    else
    begin
        if(button & counter < 11) //if button is pressed and waiting until 10ns (I assume)
            counter <= counter + 1;
        else if(!button)
            counter <= 0;
    end
end


always @(posedge clock)
begin
    if(reset)
        valid_vote <= 1'b0;
    else
    begin
        if(counter == 10) // until 10ns we get a one vote
            valid_vote <= 1'b1;
        else
            valid_vote <= 1'b0;
    end
end

endmodule
