module sel(in0, in1, sel, out);
	input [63:0] in0, in1;
	input sel;
	output reg [63:0] out;

	always @(*) begin
		if(sel == 0) begin
			out = in0;
		end else begin
			out = in1;
		end
	end
endmodule
