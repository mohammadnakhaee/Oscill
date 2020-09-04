`default_nettype none
//`timescale 1ps / 1ps

module cmd_send(output wire[7:0] dy1, input wire[7:0] y2);
  assign dy1 = y2;
endmodule