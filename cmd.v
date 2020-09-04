`default_nettype none
//`timescale 1ps / 1ps

module cmd_send(input wire baud_clk,  output reg uart_enable, output reg[7:0] output_byte, input wire[7:0] command[0:63], input wire[5:0] n_command, input wire enable);
reg [5:0] i = 0;
reg send = 0;
reg	[9:0]	send_cnt = 0;


always @(posedge baud_clk) begin
	if (enable == 1) begin
		send <= 1;
		send_cnt <= 0;
	end
	
	if (send==1) begin			
		if (send_cnt == 0) begin
			output_byte <= command[i + 64 - n_command];
			send_cnt <= send_cnt + 1;
			
			if (i == n_command) begin
				i <= 0;
				send <= 0;
				uart_enable <= 0;
			end else begin
				i <= i + 1;
				uart_enable <= 1;
			end
			
		end else begin
			send_cnt <= send_cnt + 1;
			uart_enable <= 0;
		end
		
		if (send_cnt == 10'd10) begin
			send_cnt <= 0;
		end
	end
end


endmodule