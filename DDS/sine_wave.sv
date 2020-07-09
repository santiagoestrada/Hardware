///////////////////////////////////////////////////////////////////////
//	Author:		Santiago Estrada
//	
//	Version:	Final (3.0)
//
//  Purpose:	Sine wave module connecting lookuptable data to output
//				
//	Description:
//				Inputs are clock (2KHz - 800KHz) and byte of data
//				relating the the position of the Sine Wave.
//				Output is the physical VGA connection.
//				Data is going through the Digital To Analog converter.
////////////////////////////////////////////////////////////////////////
module sine_wave(
	input  logic clk_in,
	input  logic [7:0]sine_table,
	output logic [7:0]VGA_B);
	
always_ff@(posedge clk_in)
begin
		VGA_B <= sine_table;
end

endmodule	
