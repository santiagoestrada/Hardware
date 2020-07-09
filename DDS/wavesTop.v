///////////////////////////////////////////////////////////////////////
//	Author:		Santiago Estrada
//	
//	Version:	Final (3.0)
//
//  Purpose:	Direct Digital Synthesis
//				
//	Description:
//				Top level module that connects each sub module
//				to output connects through the VGA peripheral.
//				Switches on the development board are used to 				
//				test various frequencies (2KHz - 800KHz).
//				
//				Output waves include: Sawtooth, Sine, Square, Triangle
//		
////////////////////////////////////////////////////////////////////////
module wavesTop(
	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	//////////// VGA //////////
	output		     [7:0]		VGA_B,
	output		          		VGA_BLANK_N,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS,
	//GPIO
	output							GPIN,
	//////////// SW /////////////
	input 		    [17:0]		SW
);

//clock divider wire signal from clk_div to wave module
wire clk_wire;
wire [1:0] sw_fq;

// VGA assignments needed
assign VGA_HS 		 = SW[15];
assign VGA_VS 		 = SW[14];
assign VGA_SYNC_N  	 = SW[16];
assign VGA_BLANK_N   = SW[17];
assign VGA_CLK 	 	 = clk_wire;

// frequency toggle switching
assign sw_fq[1:0] = SW[1:0];

// 8 bit  connect for lookup table output to sine wave input
wire [7:0] sine_wire;

// main clock divider
// clk_1khz clk_div(.clk_in(CLOCK_50), .clk_out(clk_wire), .GPIN(GPIN));

// clock dividers - switches
freq_sw 	     switch2freq(.main_clk(CLOCK_50), .sw_val(sw_fq), .freq_out(clk_wire));

// sinewave modules, Lookup Table
sine_table    LUT_Sine(.clk_in(clk_wire), .out_sine(sine_wire));
sine_wave 	  sin_wave(.clk_in(clk_wire), .sine_table(sine_wire), .VGA_B(VGA_B));

//wave generation modules
tri_wave 	  tr_waves(.clk_in(clk_wire), .VGA_R(VGA_R)); // Red *Required*
square_wave   sq_wavey(.clk_in(clk_wire), .VGA_B(VGA_B)); // Blue *Required*
sawtooth_wave sw_savey(.clk_in(clk_wire), .VGA_G(VGA_G)); // Green *Required*

endmodule
// End of file
