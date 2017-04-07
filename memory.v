module memory(in, out, addr, rst_n, clk, we);
	input clk, rst_n, we;
	input [63:0] in;
	input [63:0] addr;
	output wire [63:0] out;

	reg [63:0] mem [15:0];

	always @(posedge clk) begin
		if(!rst_n) begin
			mem[0] <= 0;
			mem[1] <= 0;
			mem[2] <= 0;
			mem[3] <= 0;
			mem[4] <= 0;
			mem[5] <= 0;
			mem[6] <= 0;
			mem[7] <= 0;
			mem[8] <= 0;
			mem[9] <= 0;
			mem[10] <= 0;
			mem[11] <= 0;
			mem[12] <= 0;
			mem[13] <= 0;
			mem[14] <= 0;
			mem[15] <= 0;
		end else begin
			if(we) begin
				mem[addr] <= in;
			end else begin
				mem[addr] <= mem[addr];
			end
		end
	end

	assign out = mem[addr[3:0]];
endmodule
