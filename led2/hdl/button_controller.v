module button_controller (
	input i_clk,
	input i_button,
	
	output reg [7:0] o_count = 8'd0,
	output reg o_press
);
	
	// rising edge detector
	// This register stores the previous value
	// of the button so we can detect when it goes
	// from low to high
	reg r_prev_state = 1'd0;
	
	// Rising edge detector processing block
	always @(posedge i_clk) begin
		o_press <= 1'b0;
		
		if (r_prev_state == 0 && i_button == 1) begin
			o_count <= o_count + 8'd1;
			o_press <= 1'b1;
		end
		
		r_prev_state <= i_button;
	end
	
endmodule