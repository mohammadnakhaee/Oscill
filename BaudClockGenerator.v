`default_nettype none
//`timescale 1ps / 1ps

//Adjusted for BaudRate = 1200
//12MHz / 1200 / 2 = 5000
//factor 1/2 is because of toggling clock
//So posedge of baudclock has 1200 buad rate

module BaudClockGenerator 
(
   input wire clk,
   input wire rst,
   output reg baudclock
);

reg[24:0] baudcounter = 0;
always @(posedge clk) begin
	if (rst) begin
		baudcounter <= 24'd0;
		baudclock <= 1'b0;
	end else begin
	    if (baudcounter == 24'd5000) begin
            baudcounter <= 0;
	    	baudclock <= ~baudclock;
        end else begin
		    baudcounter <= baudcounter + 1;
	    end
	end
end

endmodule