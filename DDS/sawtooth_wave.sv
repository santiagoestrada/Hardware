////////////////////////////////////////////////////////////////////////////
// Author:		Santiago Estrada
// 
// Version:		1.0
//
// Description of Code:
//				Simple module that outputs a sawtooth wave through the VGA
//				G  connection. Counter will reset once target is reached.
//				Input:		clk_in is a 1KHz divided clk, can also be 50MHz
//				Output: 	8 Bit (one step at a time to 255)
////////////////////////////////////////////////////////////////////////////
module sawtooth_wave(
	input  logic clk_in,
	output logic [7:0] VGA_G
);

logic [7:0] counter = '0; // 2^8 == 256 --> 0-255

always_ff@(posedge clk_in)
begin
	counter <= counter + 1'b1;
end

assign VGA_G = counter;

endmodule
