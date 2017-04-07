// OP
parameter [3:0] MV    = 4'h0,
				RU    = 4'h1,
				RD    = 4'h2,
				RL    = 4'h3,
				RR    = 4'h4,
				JNZ   = 4'h5,
				JMP   = 4'h6,
				INC   = 4'h7,
				DEC   = 4'h8,
				CHECK = 4'h9,
				COMP  = 4'ha,
				GPD   = 4'hb,
				GTD   = 4'hc,
				GSP   = 4'hd,
				STORE = 4'he,
				LOAD  = 4'hf;

// REG
parameter [3:0] REG_NULL = 4'h0,
				REG_BRD  = 4'h1,
				REG_ORD  = 4'h2,
				REG_CNT  = 4'h3,
				REG_MVD  = 4'h4,
				REG_ADDR_ORD = 4'h5,
				REG_ADDR_CNT = 4'h6;

// CHK
parameter [3:0] CHK_CLR   = 4'h0,
				CHK_MXCNT = 4'h1,
				CHK_H     = 4'h2,
				CHK_W     = 4'h3,
				CHK_SP    = 4'h4,
				CHK_UP    = 4'h5,
				CHK_DOWN  = 4'h6,
				CHK_LEFT  = 4'h7,
				CHK_RIGHT = 4'h8,
				CHK_ZERO  = 4'h9,
				CHK_TWO   = 4'ha;

// DEF
parameter [63:0] DEF_CLR   = 64'hA_0000_987_0_654_0_321,
				 DEF_MXCNT = 64'd15,
				 DEF_H     = 64'h3,
				 DEF_W     = 64'h3,
				 DEF_SP    = 64'h9,
				 DEF_UP    = 64'h0,
				 DEF_DOWN  = 64'h1,
				 DEF_LEFT  = 64'h2,
				 DEF_RIGHT = 64'h3,
				 DEF_ZERO  = 64'h0,
				 DEF_TWO   = 64'h2;

// JMP (85)
parameter [7:0] TO_START      = 0,   // 0~15 (16)
				TO_UP         = 20,  // 20~30 (11)
				TO_DOWN       = 40,  // 40~49 (10)
				TO_LEFT       = 60,  // 60~69 (10)
				TO_RIGHT      = 80,  // 80~89 (10)
				TO_PREV_      = 99,  // 99 (1)
				TO_PREV       = 100, // 100~111 (12)
				TO_PREV_UP    = 120, // 120~122 (3)
				TO_PREV_DOWN  = 130, // 130~132 (3)
				TO_PREV_LEFT  = 140, // 140~142 (3)
				TO_PREV_RIGHT = 150, // 150~152 (3)
				TO_END        = 160, // 160~162 (3)
				TO_WAIT       = 170; // 170 (1)

// DIR
parameter [1:0] UP    = 2'h0,
				DOWN  = 2'h1,
				LEFT  = 2'h2,
				RIGHT = 2'h3;

// SP
parameter [0:0] SX = 0,
				SY = 1;
