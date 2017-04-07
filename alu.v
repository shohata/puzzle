module alu(ina, inb, op, zf, out);
	input [63:0] ina, inb;
	input [3:0] op;
	output reg zf;
	output reg [63:0] out;

`include "def.h"

	always @(*) begin
		case(op)
		// synopsys parallel_case
		// synopsys full_case
		MV : begin
			case(ina[1:0])
			// synopsys parallel_case
			// synopsys full_case
			UP : begin
				out[59:0] = (inb[59:0] & ~(64'hf << {inb[63:60],2'b0}) & ~(64'hf << ({inb[63:60],2'b0}-6'b10000)))
					| ((inb[59:0] & (64'hf << ({inb[63:60],2'b0}-6'b10000))) >> ({inb[63:60],2'b0}-6'b10000) << {inb[63:60],2'b0})
					| (DEF_SP << ({inb[63:60],2'b0}-6'b10000));
				out[61:60] = inb[61:60];
				out[63:62] = inb[63:62] - 1;
				zf = 0;
			end
			DOWN : begin
				out[59:0] = (inb[59:0] & ~(64'hf << {inb[63:60],2'b0}) & ~(64'hf << ({inb[63:60],2'b0}+6'b10000)))
					| ((inb[59:0] & (64'hf << ({inb[63:60],2'b0}+6'b10000))) >> ({inb[63:60],2'b0}+6'b10000) << {inb[63:60],2'b0})
					| (DEF_SP << ({inb[63:60],2'b0}+6'b10000));
				out[61:60] = inb[61:60];
				out[63:62] = inb[63:62] + 1;
				zf = 0;
			end
			LEFT : begin
				out[59:0] = (inb[59:0] & ~(64'hf << {inb[63:60],2'b0}) & ~(64'hf << ({inb[63:60],2'b0}-6'b100)))
					| ((inb[59:0] & (64'hf << ({inb[63:60],2'b0}-6'b100))) >> ({inb[63:60],2'b0}-6'b100) << {inb[63:60],2'b0})
					| (DEF_SP << ({inb[63:60],2'b0}-6'b100));
				out[61:60] = inb[61:60] - 1;
				out[63:62] = inb[63:62];
				zf = 0;
			end
			RIGHT : begin
				out[59:0] = (inb[59:0] & ~(64'hf << {inb[63:60],2'b0}) & ~(64'hf << ({inb[63:60],2'b0}+6'b100)))
					| ((inb[59:0] & (64'hf << ({inb[63:60],2'b0}+6'b100))) >> ({inb[63:60],2'b0}+6'b100) << {inb[63:60],2'b0})
					| (DEF_SP << ({inb[63:60],2'b0}+6'b100));
				out[61:60] = inb[61:60] + 1;
				out[63:62] = inb[63:62];
				zf = 0;
			end
			endcase
		end

		RU : begin
			out[63:0] = (inb[63:0] & ~(64'b11 << {ina[4:0],1'b0})) | (DEF_UP << {ina[4:0],1'b0});
			zf = 0;
		end

		RD : begin
			out[63:0] = (inb[63:0] & ~(64'b11 << {ina[4:0],1'b0})) | (DEF_DOWN << {ina[4:0],1'b0});
			zf = 0;
		end

		RL : begin
			out[63:0] = (inb[63:0] & ~(64'b11 << {ina[4:0],1'b0})) | (DEF_LEFT << {ina[4:0],1'b0});
			zf = 0;
		end

		RR : begin
			out[63:0] = (inb[63:0] & ~(64'b11 << {ina[4:0],1'b0})) | (DEF_RIGHT << {ina[4:0],1'b0});
			zf = 0;
		end

		GPD : begin
			out[63:0] = (inb[63:0] & (64'b11 << ({ina[4:0],1'b0}-6'b10))) >> ({ina[4:0],1'b0}-6'b10);
			zf = 0;
		end

		GTD : begin
			out[63:0] = (inb[63:0] & (64'b11 << {ina[4:0],1'b0})) >> {ina[4:0],1'b0};
			zf = 0;
		end

		GSP : begin
			case (ina[1:0])
			// synopsys parallel_case
			// synopsys full_case
			SX : begin
				out[63:0] = {62'b0, inb[61:60]};
				zf = 0;
			end
			SY : begin
				out[63:0] = {62'b0, inb[63:62]};
				zf = 0;
			end
			endcase
		end

		INC : begin
			out = inb + 1;
			zf = 0;
		end

		DEC : begin
			out = inb - 1;
			zf = 0;
		end

		COMP : begin
			out = 0;
			zf = (ina == inb) ? 1 : 0;
		end

		CHECK : begin
			out = 0;
			case (ina[3:0])
			// synopsys parallel_case
			// synopsys full_case
			CHK_CLR   : zf = (inb == DEF_CLR)   ? 1 : 0;
			CHK_MXCNT : zf = (inb == DEF_MXCNT) ? 1 : 0;
			CHK_H     : zf = (inb == DEF_H)     ? 1 : 0;
			CHK_W     : zf = (inb == DEF_W)     ? 1 : 0;
			CHK_SP    : zf = (inb == DEF_SP)    ? 1 : 0;
			CHK_UP    : zf = (inb == DEF_UP)    ? 1 : 0;
			CHK_DOWN  : zf = (inb == DEF_DOWN)  ? 1 : 0;
			CHK_RIGHT : zf = (inb == DEF_RIGHT) ? 1 : 0;
			CHK_LEFT  : zf = (inb == DEF_LEFT)  ? 1 : 0;
			CHK_ZERO  : zf = (inb == DEF_ZERO)  ? 1 : 0;
			CHK_TWO   : zf = (inb == DEF_TWO)   ? 1 : 0;
			endcase
		end

		JMP : begin
			out = 0;
			zf = 0;
		end

		JNZ : begin
			out = 0;
			zf = 0;
		end

		STORE : begin
			out = ina;
			zf = 0;
		end

		LOAD : begin
			out = 0;
			zf = 0;
		end

		endcase
	end
endmodule
