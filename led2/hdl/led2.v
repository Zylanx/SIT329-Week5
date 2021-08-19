module led1 (
	input wire i_clk,
	output wire o_led
);

	// create a 32-bit counter
	reg [31:0] r_cnt = 32'd0; 

	// counter block
	always @(posedge i_clk) begin
		r_cnt <= r_cnt + 1;
	end

	// assign LED to 25th bit of the counter to blink the LED at a few Hz
	assign o_led = r_cnt[25];

endmodule]