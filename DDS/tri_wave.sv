///////////////////////////////////////////////////////////////////////
//	Author:		Santiago Estrada
//	
//	Version:	Final (3.0)
//
//  Purpose:	File generates a triangle wave
//				
//	Description:
//				Input is a clock, output is a byte of data that steps
//				from 0 to 255 in order to generate a triangle wave.
//				A flag is used in order to signal when the top/bottom		
//				is met and needs to switch.
////////////////////////////////////////////////////////////////////////
module tri_wave(
	input  logic clk_in,
	output logic [7:0] VGA_R);

logic [7:0] counter = '0;
bit flag = 1'b0;

always_ff@(posedge clk_in)
begin
	if(flag == 0)
	begin
		if(counter == 8'hff)
		begin
			flag <= 1'b1;
			counter <= counter - 1'b1;
		end
		else
			counter <= counter + 1'b1;
	end
	else
	begin
		if(counter == 8'h00)
		begin
			flag = 1'b0;
			counter <= counter + 1'b1;
		end
		else
			counter <= counter - 1'b1;
	end
end

assign VGA_R = counter;

endmodule
