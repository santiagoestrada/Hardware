///////////////////////////////////////////////////////////////////////
//	Author:		Santiago Estrada
//	
//	Version:	Final (3.0)
//
//  Purpose:	Use the on board switches to toggle between 800Hz - 2KHz 
//				
//	Description:
//				Allows user to toggle through various frequencies and 
//				observe changes on the oscillscope.
//
////////////////////////////////////////////////////////////////////////
module freq_sw(
	input  logic main_clk,
	input  logic [1:0] sw_val,
	output logic freq_out);

logic [15:0] freq_div;
logic [15:0] counter; 

/* Toggle between four frequencies */
always_comb
begin
	case(sw_val)
		2'b00: freq_div = 50000; // 10  KHz
		2'b01: freq_div = 10000; // 5   Khz
		2'b10: freq_div = 20000; // 2.5 Khz
		2'b11: freq_div = 62500; // 800 Hz
		default:
			freq_div = 25000;
	endcase
end

/* Count up to the value choosen value */
always_ff@(posedge main_clk)
begin
	if(counter <= freq_div)
    begin
        counter  <= counter + 1'b1;
        freq_out <= freq_out;
    end
    else
	 begin
        counter  <= '0;
        freq_out <= ~freq_out;
	end
end

endmodule

	