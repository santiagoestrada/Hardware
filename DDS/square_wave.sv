///////////////////////////////////////////////////////////////////////
//	Author:		Santiago Estrada
//	
//	Version:	Final (3.0)
//
//  Purpose:	File generates a square wave
//				
//	Description:
//				Input is a clock, output is a byte of data that steps
//				from 0 to 255 in order to generate a square wave.
////////////////////////////////////////////////////////////////////////
module square_wave(
	input  logic clk_in,
	output logic [7:0] VGA_B);
	
logic [7:0] counter = '0;
logic [7:0] DAC = '0;

always_ff@(posedge clk_in)
begin
	if(counter == 255)		/*High Signal */
	begin
		DAC 	<= ~DAC; // send dac = 255
		counter <= '0;	 // reset
	end
	else
	begin
		DAC 	<= DAC;
		counter <= counter + 1'b1;
	end
end

assign VGA_B = DAC;

endmodule
