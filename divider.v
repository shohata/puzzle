module divider(mclk, rst_n, clk);
	input mclk;
	input rst_n;
	output clk;
	reg [3:0] cnt;

	always @(posedge mclk) begin
		if(!rst_n) begin
			cnt <= 4'b0;
		end else begin
			cnt <= cnt + 4'b1;
		end
	end

	assign clk = ~cnt[2];
endmodule
