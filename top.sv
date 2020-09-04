`default_nettype none

module top (
        // inputs
        input   wire        clk12M,        // 12M clock from FTDI/X1 crystal
        input   wire        rstn,       // from SW1 pushbutton
        input   wire  selectClock,      // from SW2 DIP switches
		input   wire  rxd, //rxd connected to FTDI_txd
        // outputs
        output  wire  [7:0] LED,         // to LEDs (D2-D9)
		output   wire  txd //txd connected to FTDI_rxd
        );
		
//------------------------------
// INTERNAL SIGNAL DECLARATIONS: 
//------------------------------
wire          osc_clk;        // Internal OSCILLATOR clock
wire          clk;         // 12MHz logic clock
wire          rst;            //
reg     [7:0] LED_i;          // selector output


//-------------------------------------//
//-- assign (non-process) operations --//
//-------------------------------------//
assign rst = ~rstn;
assign clk = selectClock ? osc_clk : clk12M;    // select clock source int/ext

defparam OSCI1.DIV = "128";
OSCG OSCI1 (.OSC(osc_clk));

/*
reg baudclock = 0;
BaudClockGenerator BaudClockGenerator1(.clk(clk), .rst(rst), .baudclock(baudclock));
always @ (baudclock) begin
    LED_i <= baudclock ? 8'b10101010 : 8'b10000001;
end
*/

reg [7:0] data;
wire [7:0] rxdata;
reg enable = 0;
wire tx_busy;
wire rdy;
reg rdy_clr = 0;


parameter c_CLKS_PER_BIT    = 104; //round(12000000/115200)
//parameter c_CLKS_PER_BIT    = 312; //round(12000000/38400)
//parameter c_CLKS_PER_BIT    = 1250; //round(12000000/9600)
wire w_TX_Serial;

UART_TX #(.CLKS_PER_BIT(c_CLKS_PER_BIT)) UART_TX_Inst
    (.i_Clock(clk),
     .i_TX_DV(enable),
     .i_TX_Byte(data),
     .o_TX_Active(tx_busy),
     .o_TX_Serial(txd),
     .o_TX_Done()
     );



reg	    [9:0]	baud_cnt = 0;	    // enough bits for c_CLKS_PER_BIT=312
reg baud_clk = 0;
always @(posedge clk) begin
	if (baud_cnt == c_CLKS_PER_BIT) begin
        baud_cnt <= 0;
		baud_clk <= 1;
    end else begin
		baud_cnt <= baud_cnt + 1;
		baud_clk <= 0;
	end
end



always @ (tx_busy) begin
    LED_i <= tx_busy ? 8'b10101010 : 8'b10000001;
end


reg [5:0] n_command;
reg [7:0] command[0:63];
reg cmd_enable = 0;
cmd_send(baud_clk, enable, data, command, n_command, cmd_enable);

///////////////////////////////////////////////////////////////////////////
//the equivlent to \r\n in verilog is \015\n. \ddd is octal Octal Escapes. for example for char=13 it is \015
reg [7:0] cmd_empty[0:63] = "\015\n"; //HC-05 commands need to end eith \r\n
reg [7:0] cmd_cahngename[0:63] = "AT+NAME=Oscilloscope++\015\n"; //HC-05 commands need to end eith \r\n
reg [7:0] cmd_setslave[0:63] = "AT+ROLE=0\015\n";
reg [7:0] cmd_setbaud[0:63] = "AT+UART=115200,1,0\015\n";
reg [7:0] cmd_test[0:63] = "Data comes from FPGA ...\015\n";
///////////////////////////////////////////////////////////////////////////

reg HC05_initialized = 0;
reg	[4:0]	command_index = 0;
reg	[14:0]	send_cnt = 0;
always @(posedge baud_clk) begin
	if (send_cnt == 15'd32000) begin
		
		if (command_index < 3) begin
			command_index <= command_index + 1;
			cmd_enable <= 0;
		end else if (command_index == 3) begin
			n_command <= 2;
			command <= cmd_empty;
			command_index <= command_index + 1;
			cmd_enable <= 1;
		end else if (command_index == 4) begin
			n_command <= 24;
			command <= cmd_cahngename;
			command_index <= command_index + 1;
			cmd_enable <= 1;
		end else if (command_index == 5) begin
			n_command <= 11;
			command <= cmd_setslave;
			command_index <= command_index + 1;
			cmd_enable <= 1;
		end else if (command_index == 6) begin
			n_command <= 20;
			command <= cmd_setbaud;
			command_index <= command_index + 1;
			cmd_enable <= 1;
		end else begin
			n_command <= 26;
			command <= cmd_test;
			command_index <= command_index + 1;
			cmd_enable <= 1;
		end
		/*end else if (command_index == 7) begin
			HC05_initialized <= 1;
			command_index <= command_index + 1;
			cmd_enable <= 0;
		end else begin
			cmd_enable <= 0;
		end*/
		
		send_cnt <= 0;
	end else begin
		send_cnt <= send_cnt + 1;
		cmd_enable <= 0;
	end
end





//-------------------------------------//
//-------- output assignments  --------//
//-------------------------------------//
assign LED = ~LED_i;

endmodule