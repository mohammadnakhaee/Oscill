// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.11.0.396.4
// Netlist written on Sat May 23 09:45:31 2020
//
// Verilog Description of module main
//

module main (clk_x1, rstn, DIPSW, LED) /* synthesis syn_module_defined=1 */ ;   // c:/users/mohammad/documents/fpga/dft/top.v(1[8:12])
    input clk_x1;   // c:/users/mohammad/documents/fpga/dft/top.v(3[29:35])
    input rstn;   // c:/users/mohammad/documents/fpga/dft/top.v(4[29:33])
    input [3:0]DIPSW;   // c:/users/mohammad/documents/fpga/dft/top.v(5[29:34])
    output [7:0]LED;   // c:/users/mohammad/documents/fpga/dft/top.v(8[29:32])
    
    
    wire GND_net, VCC_net;
    
    VHI i14 (.Z(VCC_net));
    OB LED_pad_7 (.I(GND_net), .O(LED[7]));   // c:/users/mohammad/documents/fpga/dft/top.v(8[29:32])
    OB LED_pad_6 (.I(GND_net), .O(LED[6]));   // c:/users/mohammad/documents/fpga/dft/top.v(8[29:32])
    OB LED_pad_5 (.I(GND_net), .O(LED[5]));   // c:/users/mohammad/documents/fpga/dft/top.v(8[29:32])
    OB LED_pad_4 (.I(GND_net), .O(LED[4]));   // c:/users/mohammad/documents/fpga/dft/top.v(8[29:32])
    OB LED_pad_3 (.I(GND_net), .O(LED[3]));   // c:/users/mohammad/documents/fpga/dft/top.v(8[29:32])
    OB LED_pad_2 (.I(GND_net), .O(LED[2]));   // c:/users/mohammad/documents/fpga/dft/top.v(8[29:32])
    OB LED_pad_1 (.I(GND_net), .O(LED[1]));   // c:/users/mohammad/documents/fpga/dft/top.v(8[29:32])
    OB LED_pad_0 (.I(GND_net), .O(LED[0]));   // c:/users/mohammad/documents/fpga/dft/top.v(8[29:32])
    GSR GSR_INST (.GSR(VCC_net));
    VLO i6 (.Z(GND_net));
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

