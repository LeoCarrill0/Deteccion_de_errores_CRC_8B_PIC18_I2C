
_I2C_LCD_Cmd:

;CRC_LEO.c,31 :: 		void I2C_LCD_Cmd(char out_char) {
;CRC_LEO.c,34 :: 		char rs = 0x00;
	CLRF        I2C_LCD_Cmd_rs_L0+0 
;CRC_LEO.c,36 :: 		hi_n = out_char & 0xF0;
	MOVLW       240
	ANDWF       FARG_I2C_LCD_Cmd_out_char+0, 0 
	MOVWF       I2C_LCD_Cmd_hi_n_L0+0 
;CRC_LEO.c,37 :: 		lo_n = (out_char << 4) & 0xF0;
	MOVF        FARG_I2C_LCD_Cmd_out_char+0, 0 
	MOVWF       I2C_LCD_Cmd_lo_n_L0+0 
	RLCF        I2C_LCD_Cmd_lo_n_L0+0, 1 
	BCF         I2C_LCD_Cmd_lo_n_L0+0, 0 
	RLCF        I2C_LCD_Cmd_lo_n_L0+0, 1 
	BCF         I2C_LCD_Cmd_lo_n_L0+0, 0 
	RLCF        I2C_LCD_Cmd_lo_n_L0+0, 1 
	BCF         I2C_LCD_Cmd_lo_n_L0+0, 0 
	RLCF        I2C_LCD_Cmd_lo_n_L0+0, 1 
	BCF         I2C_LCD_Cmd_lo_n_L0+0, 0 
	MOVLW       240
	ANDWF       I2C_LCD_Cmd_lo_n_L0+0, 1 
;CRC_LEO.c,39 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;CRC_LEO.c,40 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,41 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW       78
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,42 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,43 :: 		I2C1_Wr(hi_n | rs | 0x04 | 0x08);
	MOVF        I2C_LCD_Cmd_rs_L0+0, 0 
	IORWF       I2C_LCD_Cmd_hi_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,44 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,45 :: 		Delay_us(50);
	MOVLW       16
	MOVWF       R13, 0
L_I2C_LCD_Cmd0:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Cmd0
	NOP
;CRC_LEO.c,46 :: 		I2C1_Wr(hi_n | rs | 0x00 | 0x08);
	MOVF        I2C_LCD_Cmd_rs_L0+0, 0 
	IORWF       I2C_LCD_Cmd_hi_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,47 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,48 :: 		Delay_us(100);
	MOVLW       33
	MOVWF       R13, 0
L_I2C_LCD_Cmd1:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Cmd1
;CRC_LEO.c,49 :: 		I2C1_Wr(lo_n | rs | 0x04 | 0x08);
	MOVF        I2C_LCD_Cmd_rs_L0+0, 0 
	IORWF       I2C_LCD_Cmd_lo_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,50 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,51 :: 		Delay_us(50);
	MOVLW       16
	MOVWF       R13, 0
L_I2C_LCD_Cmd2:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Cmd2
	NOP
;CRC_LEO.c,52 :: 		I2C1_Wr(lo_n | rs | 0x00 | 0x08);
	MOVF        I2C_LCD_Cmd_rs_L0+0, 0 
	IORWF       I2C_LCD_Cmd_lo_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,53 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,54 :: 		I2C1_stop();
	CALL        _I2C1_Stop+0, 0
;CRC_LEO.c,56 :: 		if(out_char == 0x01)Delay_ms(2);
	MOVF        FARG_I2C_LCD_Cmd_out_char+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_LCD_Cmd3
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_I2C_LCD_Cmd4:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Cmd4
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Cmd4
	NOP
	NOP
L_I2C_LCD_Cmd3:
;CRC_LEO.c,57 :: 		}
L_end_I2C_LCD_Cmd:
	RETURN      0
; end of _I2C_LCD_Cmd

_I2C_LCD_Chr:

;CRC_LEO.c,59 :: 		void I2C_LCD_Chr(char row, char column, char out_char) {
;CRC_LEO.c,62 :: 		char rs = 0x01;
	MOVLW       1
	MOVWF       I2C_LCD_Chr_rs_L0+0 
;CRC_LEO.c,64 :: 		switch(row){
	GOTO        L_I2C_LCD_Chr5
;CRC_LEO.c,66 :: 		case 1:
L_I2C_LCD_Chr7:
;CRC_LEO.c,67 :: 		I2C_LCD_Cmd(0x80 + (column - 1));
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       128
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;CRC_LEO.c,68 :: 		break;
	GOTO        L_I2C_LCD_Chr6
;CRC_LEO.c,69 :: 		case 2:
L_I2C_LCD_Chr8:
;CRC_LEO.c,70 :: 		I2C_LCD_Cmd(0xC0 + (column - 1));
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       192
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;CRC_LEO.c,71 :: 		break;
	GOTO        L_I2C_LCD_Chr6
;CRC_LEO.c,72 :: 		case 3:
L_I2C_LCD_Chr9:
;CRC_LEO.c,73 :: 		I2C_LCD_Cmd(0x94 + (column - 1));
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       148
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;CRC_LEO.c,74 :: 		break;
	GOTO        L_I2C_LCD_Chr6
;CRC_LEO.c,75 :: 		case 4:
L_I2C_LCD_Chr10:
;CRC_LEO.c,76 :: 		I2C_LCD_Cmd(0xD4 + (column - 1));
	DECF        FARG_I2C_LCD_Chr_column+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       212
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;CRC_LEO.c,77 :: 		break;
	GOTO        L_I2C_LCD_Chr6
;CRC_LEO.c,78 :: 		};
L_I2C_LCD_Chr5:
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Chr7
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Chr8
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Chr9
	MOVF        FARG_I2C_LCD_Chr_row+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Chr10
L_I2C_LCD_Chr6:
;CRC_LEO.c,80 :: 		hi_n = out_char & 0xF0;
	MOVLW       240
	ANDWF       FARG_I2C_LCD_Chr_out_char+0, 0 
	MOVWF       I2C_LCD_Chr_hi_n_L0+0 
;CRC_LEO.c,81 :: 		lo_n = (out_char << 4) & 0xF0;
	MOVF        FARG_I2C_LCD_Chr_out_char+0, 0 
	MOVWF       I2C_LCD_Chr_lo_n_L0+0 
	RLCF        I2C_LCD_Chr_lo_n_L0+0, 1 
	BCF         I2C_LCD_Chr_lo_n_L0+0, 0 
	RLCF        I2C_LCD_Chr_lo_n_L0+0, 1 
	BCF         I2C_LCD_Chr_lo_n_L0+0, 0 
	RLCF        I2C_LCD_Chr_lo_n_L0+0, 1 
	BCF         I2C_LCD_Chr_lo_n_L0+0, 0 
	RLCF        I2C_LCD_Chr_lo_n_L0+0, 1 
	BCF         I2C_LCD_Chr_lo_n_L0+0, 0 
	MOVLW       240
	ANDWF       I2C_LCD_Chr_lo_n_L0+0, 1 
;CRC_LEO.c,83 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;CRC_LEO.c,84 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,85 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW       78
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,86 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,87 :: 		I2C1_Wr(hi_n | rs | 0x04 | 0x08);
	MOVF        I2C_LCD_Chr_rs_L0+0, 0 
	IORWF       I2C_LCD_Chr_hi_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,88 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,89 :: 		Delay_us(50);
	MOVLW       16
	MOVWF       R13, 0
L_I2C_LCD_Chr11:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr11
	NOP
;CRC_LEO.c,90 :: 		I2C1_Wr(hi_n | rs | 0x00 | 0x08);
	MOVF        I2C_LCD_Chr_rs_L0+0, 0 
	IORWF       I2C_LCD_Chr_hi_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,91 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,92 :: 		Delay_us(100);
	MOVLW       33
	MOVWF       R13, 0
L_I2C_LCD_Chr12:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr12
;CRC_LEO.c,93 :: 		I2C1_Wr(lo_n | rs | 0x04 | 0x08);
	MOVF        I2C_LCD_Chr_rs_L0+0, 0 
	IORWF       I2C_LCD_Chr_lo_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,94 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,95 :: 		Delay_us(50);
	MOVLW       16
	MOVWF       R13, 0
L_I2C_LCD_Chr13:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr13
	NOP
;CRC_LEO.c,96 :: 		I2C1_Wr(lo_n | rs | 0x00 | 0x08);
	MOVF        I2C_LCD_Chr_rs_L0+0, 0 
	IORWF       I2C_LCD_Chr_lo_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,97 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,98 :: 		I2C1_stop();
	CALL        _I2C1_Stop+0, 0
;CRC_LEO.c,99 :: 		}
L_end_I2C_LCD_Chr:
	RETURN      0
; end of _I2C_LCD_Chr

_I2C_LCD_Chr_Cp:

;CRC_LEO.c,101 :: 		void I2C_LCD_Chr_Cp(char out_char) {
;CRC_LEO.c,104 :: 		char rs = 0x01;
	MOVLW       1
	MOVWF       I2C_LCD_Chr_Cp_rs_L0+0 
;CRC_LEO.c,106 :: 		hi_n = out_char & 0xF0;
	MOVLW       240
	ANDWF       FARG_I2C_LCD_Chr_Cp_out_char+0, 0 
	MOVWF       I2C_LCD_Chr_Cp_hi_n_L0+0 
;CRC_LEO.c,107 :: 		lo_n = (out_char << 4) & 0xF0;
	MOVF        FARG_I2C_LCD_Chr_Cp_out_char+0, 0 
	MOVWF       I2C_LCD_Chr_Cp_lo_n_L0+0 
	RLCF        I2C_LCD_Chr_Cp_lo_n_L0+0, 1 
	BCF         I2C_LCD_Chr_Cp_lo_n_L0+0, 0 
	RLCF        I2C_LCD_Chr_Cp_lo_n_L0+0, 1 
	BCF         I2C_LCD_Chr_Cp_lo_n_L0+0, 0 
	RLCF        I2C_LCD_Chr_Cp_lo_n_L0+0, 1 
	BCF         I2C_LCD_Chr_Cp_lo_n_L0+0, 0 
	RLCF        I2C_LCD_Chr_Cp_lo_n_L0+0, 1 
	BCF         I2C_LCD_Chr_Cp_lo_n_L0+0, 0 
	MOVLW       240
	ANDWF       I2C_LCD_Chr_Cp_lo_n_L0+0, 1 
;CRC_LEO.c,109 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;CRC_LEO.c,110 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,111 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW       78
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,112 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,113 :: 		I2C1_Wr(hi_n | rs | 0x04 | 0x08);
	MOVF        I2C_LCD_Chr_Cp_rs_L0+0, 0 
	IORWF       I2C_LCD_Chr_Cp_hi_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,114 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,115 :: 		Delay_us(50);
	MOVLW       16
	MOVWF       R13, 0
L_I2C_LCD_Chr_Cp14:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr_Cp14
	NOP
;CRC_LEO.c,116 :: 		I2C1_Wr(hi_n | rs | 0x00 | 0x08);
	MOVF        I2C_LCD_Chr_Cp_rs_L0+0, 0 
	IORWF       I2C_LCD_Chr_Cp_hi_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,117 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,118 :: 		Delay_us(100);
	MOVLW       33
	MOVWF       R13, 0
L_I2C_LCD_Chr_Cp15:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr_Cp15
;CRC_LEO.c,119 :: 		I2C1_Wr(lo_n | rs | 0x04 | 0x08);
	MOVF        I2C_LCD_Chr_Cp_rs_L0+0, 0 
	IORWF       I2C_LCD_Chr_Cp_lo_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,120 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,121 :: 		Delay_us(50);
	MOVLW       16
	MOVWF       R13, 0
L_I2C_LCD_Chr_Cp16:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Chr_Cp16
	NOP
;CRC_LEO.c,122 :: 		I2C1_Wr(lo_n | rs | 0x00 | 0x08);
	MOVF        I2C_LCD_Chr_Cp_rs_L0+0, 0 
	IORWF       I2C_LCD_Chr_Cp_lo_n_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,123 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,124 :: 		I2C1_stop();
	CALL        _I2C1_Stop+0, 0
;CRC_LEO.c,125 :: 		}
L_end_I2C_LCD_Chr_Cp:
	RETURN      0
; end of _I2C_LCD_Chr_Cp

_I2C_LCD_Init:

;CRC_LEO.c,128 :: 		void I2C_LCD_Init() {
;CRC_LEO.c,130 :: 		char rs = 0x00;
	CLRF        I2C_LCD_Init_rs_L0+0 
;CRC_LEO.c,132 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;CRC_LEO.c,133 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,134 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW       78
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,135 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,137 :: 		Delay_ms(30);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_I2C_LCD_Init17:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Init17
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Init17
;CRC_LEO.c,139 :: 		I2C1_Wr(0x30 | rs | 0x04 | 0x08);
	MOVLW       48
	IORWF       I2C_LCD_Init_rs_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,140 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,141 :: 		Delay_us(50);
	MOVLW       16
	MOVWF       R13, 0
L_I2C_LCD_Init18:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Init18
	NOP
;CRC_LEO.c,142 :: 		I2C1_Wr(0x30 | rs | 0x00 | 0x08);
	MOVLW       48
	IORWF       I2C_LCD_Init_rs_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,143 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,145 :: 		Delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_I2C_LCD_Init19:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Init19
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Init19
	NOP
	NOP
;CRC_LEO.c,147 :: 		I2C1_Wr(0x30 | rs | 0x04 | 0x08);
	MOVLW       48
	IORWF       I2C_LCD_Init_rs_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,148 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,149 :: 		Delay_us(50);
	MOVLW       16
	MOVWF       R13, 0
L_I2C_LCD_Init20:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Init20
	NOP
;CRC_LEO.c,150 :: 		I2C1_Wr(0x30 | rs | 0x00 | 0x08);
	MOVLW       48
	IORWF       I2C_LCD_Init_rs_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,151 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,153 :: 		Delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_I2C_LCD_Init21:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Init21
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Init21
	NOP
	NOP
;CRC_LEO.c,155 :: 		I2C1_Wr(0x30 | rs | 0x04 | 0x08);
	MOVLW       48
	IORWF       I2C_LCD_Init_rs_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,156 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,157 :: 		Delay_us(50);
	MOVLW       16
	MOVWF       R13, 0
L_I2C_LCD_Init22:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Init22
	NOP
;CRC_LEO.c,158 :: 		I2C1_Wr(0x30 | rs | 0x00 | 0x08);
	MOVLW       48
	IORWF       I2C_LCD_Init_rs_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,159 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,161 :: 		Delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_I2C_LCD_Init23:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Init23
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Init23
	NOP
	NOP
;CRC_LEO.c,163 :: 		I2C1_Wr(0x20 | rs | 0x04 | 0x08);
	MOVLW       32
	IORWF       I2C_LCD_Init_rs_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 2 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,164 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,165 :: 		Delay_us(50);
	MOVLW       16
	MOVWF       R13, 0
L_I2C_LCD_Init24:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Init24
	NOP
;CRC_LEO.c,166 :: 		I2C1_Wr(0x20 | rs | 0x00 | 0x08);
	MOVLW       32
	IORWF       I2C_LCD_Init_rs_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	BSF         FARG_I2C1_Wr_data_+0, 3 
	CALL        _I2C1_Wr+0, 0
;CRC_LEO.c,167 :: 		I2C1_Is_Idle();
	CALL        _I2C1_Is_Idle+0, 0
;CRC_LEO.c,168 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;CRC_LEO.c,170 :: 		Delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_I2C_LCD_Init25:
	DECFSZ      R13, 1, 1
	BRA         L_I2C_LCD_Init25
	DECFSZ      R12, 1, 1
	BRA         L_I2C_LCD_Init25
	NOP
	NOP
;CRC_LEO.c,172 :: 		I2C_LCD_Cmd(0x28);
	MOVLW       40
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;CRC_LEO.c,173 :: 		I2C_LCD_Cmd(0x06);
	MOVLW       6
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;CRC_LEO.c,174 :: 		}
L_end_I2C_LCD_Init:
	RETURN      0
; end of _I2C_LCD_Init

_I2C_LCD_Out:

;CRC_LEO.c,176 :: 		void I2C_LCD_Out(char row, char col, char *text) {
;CRC_LEO.c,177 :: 		while(*text)
L_I2C_LCD_Out26:
	MOVFF       FARG_I2C_LCD_Out_text+0, FSR0L+0
	MOVFF       FARG_I2C_LCD_Out_text+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Out27
;CRC_LEO.c,178 :: 		I2C_LCD_Chr(row, col++, *text++);
	MOVF        FARG_I2C_LCD_Out_row+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_row+0 
	MOVF        FARG_I2C_LCD_Out_col+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_column+0 
	MOVFF       FARG_I2C_LCD_Out_text+0, FSR0L+0
	MOVFF       FARG_I2C_LCD_Out_text+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_out_char+0 
	CALL        _I2C_LCD_Chr+0, 0
	INCF        FARG_I2C_LCD_Out_col+0, 1 
	INFSNZ      FARG_I2C_LCD_Out_text+0, 1 
	INCF        FARG_I2C_LCD_Out_text+1, 1 
	GOTO        L_I2C_LCD_Out26
L_I2C_LCD_Out27:
;CRC_LEO.c,179 :: 		}
L_end_I2C_LCD_Out:
	RETURN      0
; end of _I2C_LCD_Out

_I2C_LCD_Out_Cp:

;CRC_LEO.c,181 :: 		void I2C_LCD_Out_Cp(char *text) {
;CRC_LEO.c,182 :: 		while(*text)
L_I2C_LCD_Out_Cp28:
	MOVFF       FARG_I2C_LCD_Out_Cp_text+0, FSR0L+0
	MOVFF       FARG_I2C_LCD_Out_Cp_text+1, FSR0H+0
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_I2C_LCD_Out_Cp29
;CRC_LEO.c,183 :: 		I2C_LCD_Chr_Cp(*text++);
	MOVFF       FARG_I2C_LCD_Out_Cp_text+0, FSR0L+0
	MOVFF       FARG_I2C_LCD_Out_Cp_text+1, FSR0H+0
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C_LCD_Chr_Cp_out_char+0 
	CALL        _I2C_LCD_Chr_Cp+0, 0
	INFSNZ      FARG_I2C_LCD_Out_Cp_text+0, 1 
	INCF        FARG_I2C_LCD_Out_Cp_text+1, 1 
	GOTO        L_I2C_LCD_Out_Cp28
L_I2C_LCD_Out_Cp29:
;CRC_LEO.c,184 :: 		}
L_end_I2C_LCD_Out_Cp:
	RETURN      0
; end of _I2C_LCD_Out_Cp

_CRC_R:

;CRC_LEO.c,187 :: 		unsigned int CRC_R(int trama, int cont)
;CRC_LEO.c,189 :: 		int n=0;
	CLRF        CRC_R_n_L0+0 
	CLRF        CRC_R_n_L0+1 
	MOVLW       11
	MOVWF       CRC_R_val_L0+0 
	MOVLW       0
	MOVWF       CRC_R_val_L0+1 
;CRC_LEO.c,194 :: 		while(n !=1){
L_CRC_R30:
	MOVLW       0
	XORWF       CRC_R_n_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CRC_R49
	MOVLW       1
	XORWF       CRC_R_n_L0+0, 0 
L__CRC_R49:
	BTFSC       STATUS+0, 2 
	GOTO        L_CRC_R31
;CRC_LEO.c,195 :: 		exval=pow(2,val)+1;
	MOVLW       0
	MOVWF       FARG_pow_x+0 
	MOVLW       0
	MOVWF       FARG_pow_x+1 
	MOVLW       0
	MOVWF       FARG_pow_x+2 
	MOVLW       128
	MOVWF       FARG_pow_x+3 
	MOVF        CRC_R_val_L0+0, 0 
	MOVWF       R0 
	MOVF        CRC_R_val_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_pow_y+0 
	MOVF        R1, 0 
	MOVWF       FARG_pow_y+1 
	MOVF        R2, 0 
	MOVWF       FARG_pow_y+2 
	MOVF        R3, 0 
	MOVWF       FARG_pow_y+3 
	CALL        _pow+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
;CRC_LEO.c,196 :: 		and1=trama&exval;
	MOVF        R0, 0 
	ANDWF       FARG_CRC_R_trama+0, 0 
	MOVWF       R2 
	MOVF        FARG_CRC_R_trama+1, 0 
	ANDWF       R1, 0 
	MOVWF       R3 
;CRC_LEO.c,197 :: 		if(and1 !=0){
	MOVLW       0
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CRC_R50
	MOVLW       0
	XORWF       R2, 0 
L__CRC_R50:
	BTFSC       STATUS+0, 2 
	GOTO        L_CRC_R32
;CRC_LEO.c,199 :: 		n=1;
	MOVLW       1
	MOVWF       CRC_R_n_L0+0 
	MOVLW       0
	MOVWF       CRC_R_n_L0+1 
;CRC_LEO.c,200 :: 		return nBit;
	MOVF        CRC_R_val_L0+0, 0 
	MOVWF       R0 
	MOVF        CRC_R_val_L0+1, 0 
	MOVWF       R1 
	GOTO        L_end_CRC_R
;CRC_LEO.c,201 :: 		}
L_CRC_R32:
;CRC_LEO.c,202 :: 		val--;
	MOVLW       1
	SUBWF       CRC_R_val_L0+0, 1 
	MOVLW       0
	SUBWFB      CRC_R_val_L0+1, 1 
;CRC_LEO.c,203 :: 		}
	GOTO        L_CRC_R30
L_CRC_R31:
;CRC_LEO.c,204 :: 		}
L_end_CRC_R:
	RETURN      0
; end of _CRC_R

_CRC_O:

;CRC_LEO.c,205 :: 		unsigned int CRC_O(unsigned int ad1, unsigned int p,unsigned int q )
;CRC_LEO.c,211 :: 		ad=ad1<<4;
	MOVF        FARG_CRC_O_ad1+0, 0 
	MOVWF       CRC_O_ad_L0+0 
	MOVF        FARG_CRC_O_ad1+1, 0 
	MOVWF       CRC_O_ad_L0+1 
	RLCF        CRC_O_ad_L0+0, 1 
	BCF         CRC_O_ad_L0+0, 0 
	RLCF        CRC_O_ad_L0+1, 1 
	RLCF        CRC_O_ad_L0+0, 1 
	BCF         CRC_O_ad_L0+0, 0 
	RLCF        CRC_O_ad_L0+1, 1 
	RLCF        CRC_O_ad_L0+0, 1 
	BCF         CRC_O_ad_L0+0, 0 
	RLCF        CRC_O_ad_L0+1, 1 
	RLCF        CRC_O_ad_L0+0, 1 
	BCF         CRC_O_ad_L0+0, 0 
	RLCF        CRC_O_ad_L0+1, 1 
;CRC_LEO.c,212 :: 		p1=p<<7;
	MOVLW       7
	MOVWF       R0 
	MOVF        FARG_CRC_O_p+0, 0 
	MOVWF       CRC_O_p1_L0+0 
	MOVF        FARG_CRC_O_p+1, 0 
	MOVWF       CRC_O_p1_L0+1 
	MOVF        R0, 0 
L__CRC_O52:
	BZ          L__CRC_O53
	RLCF        CRC_O_p1_L0+0, 1 
	BCF         CRC_O_p1_L0+0, 0 
	RLCF        CRC_O_p1_L0+1, 1 
	ADDLW       255
	GOTO        L__CRC_O52
L__CRC_O53:
;CRC_LEO.c,214 :: 		while(1){
L_CRC_O33:
;CRC_LEO.c,215 :: 		CRC=0;
	CLRF        _CRC+0 
	CLRF        _CRC+1 
;CRC_LEO.c,216 :: 		for(h=0; h<5; h++){
	CLRF        CRC_O_h_L0+0 
	CLRF        CRC_O_h_L0+1 
L_CRC_O35:
	MOVLW       128
	XORWF       CRC_O_h_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CRC_O54
	MOVLW       5
	SUBWF       CRC_O_h_L0+0, 0 
L__CRC_O54:
	BTFSC       STATUS+0, 0 
	GOTO        L_CRC_O36
;CRC_LEO.c,217 :: 		qb=pow(2,q)+1;
	MOVLW       0
	MOVWF       FARG_pow_x+0 
	MOVLW       0
	MOVWF       FARG_pow_x+1 
	MOVLW       0
	MOVWF       FARG_pow_x+2 
	MOVLW       128
	MOVWF       FARG_pow_x+3 
	MOVF        FARG_CRC_O_q+0, 0 
	MOVWF       R0 
	MOVF        FARG_CRC_O_q+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_pow_y+0 
	MOVF        R1, 0 
	MOVWF       FARG_pow_y+1 
	MOVF        R2, 0 
	MOVWF       FARG_pow_y+2 
	MOVF        R3, 0 
	MOVWF       FARG_pow_y+3 
	CALL        _pow+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	CALL        _double2int+0, 0
;CRC_LEO.c,218 :: 		CRC=CRC | (ad&qb)^(p1&qb);
	MOVF        R0, 0 
	ANDWF       CRC_O_ad_L0+0, 0 
	MOVWF       R2 
	MOVF        CRC_O_ad_L0+1, 0 
	ANDWF       R1, 0 
	MOVWF       R3 
	MOVF        CRC_O_p1_L0+0, 0 
	ANDWF       R0, 1 
	MOVF        CRC_O_p1_L0+1, 0 
	ANDWF       R1, 1 
	MOVF        R2, 0 
	XORWF       R0, 1 
	MOVF        R3, 0 
	XORWF       R1, 1 
	MOVF        R0, 0 
	IORWF       _CRC+0, 1 
	MOVF        R1, 0 
	IORWF       _CRC+1, 1 
;CRC_LEO.c,219 :: 		q--;
	MOVLW       1
	SUBWF       FARG_CRC_O_q+0, 1 
	MOVLW       0
	SUBWFB      FARG_CRC_O_q+1, 1 
;CRC_LEO.c,216 :: 		for(h=0; h<5; h++){
	INFSNZ      CRC_O_h_L0+0, 1 
	INCF        CRC_O_h_L0+1, 1 
;CRC_LEO.c,220 :: 		}
	GOTO        L_CRC_O35
L_CRC_O36:
;CRC_LEO.c,221 :: 		qb1=CRC_R(CRC, q);
	MOVF        _CRC+0, 0 
	MOVWF       FARG_CRC_R_trama+0 
	MOVF        _CRC+1, 0 
	MOVWF       FARG_CRC_R_trama+1 
	MOVF        FARG_CRC_O_q+0, 0 
	MOVWF       FARG_CRC_R_cont+0 
	MOVF        FARG_CRC_O_q+1, 0 
	MOVWF       FARG_CRC_R_cont+1 
	CALL        _CRC_R+0, 0
	MOVF        R0, 0 
	MOVWF       CRC_O_qb1_L0+0 
	MOVF        R1, 0 
	MOVWF       CRC_O_qb1_L0+1 
;CRC_LEO.c,222 :: 		if(qb1<5){
	MOVLW       128
	XORWF       R1, 0 
	MOVWF       R2 
	MOVLW       128
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__CRC_O55
	MOVLW       5
	SUBWF       R0, 0 
L__CRC_O55:
	BTFSC       STATUS+0, 0 
	GOTO        L_CRC_O38
;CRC_LEO.c,223 :: 		return qb1;
	MOVF        CRC_O_qb1_L0+0, 0 
	MOVWF       R0 
	MOVF        CRC_O_qb1_L0+1, 0 
	MOVWF       R1 
	GOTO        L_end_CRC_O
;CRC_LEO.c,224 :: 		}
L_CRC_O38:
;CRC_LEO.c,225 :: 		ad=ad | CRC;
	MOVF        _CRC+0, 0 
	IORWF       CRC_O_ad_L0+0, 1 
	MOVF        _CRC+1, 0 
	IORWF       CRC_O_ad_L0+1, 1 
;CRC_LEO.c,226 :: 		q=qb1;
	MOVF        CRC_O_qb1_L0+0, 0 
	MOVWF       FARG_CRC_O_q+0 
	MOVF        CRC_O_qb1_L0+1, 0 
	MOVWF       FARG_CRC_O_q+1 
;CRC_LEO.c,227 :: 		p1=p<<qb1-4;
	MOVLW       4
	SUBWF       CRC_O_qb1_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      CRC_O_qb1_L0+1, 0 
	MOVWF       R1 
	MOVF        FARG_CRC_O_p+0, 0 
	MOVWF       CRC_O_p1_L0+0 
	MOVF        FARG_CRC_O_p+1, 0 
	MOVWF       CRC_O_p1_L0+1 
	MOVF        R0, 0 
L__CRC_O56:
	BZ          L__CRC_O57
	RLCF        CRC_O_p1_L0+0, 1 
	BCF         CRC_O_p1_L0+0, 0 
	RLCF        CRC_O_p1_L0+1, 1 
	ADDLW       255
	GOTO        L__CRC_O56
L__CRC_O57:
;CRC_LEO.c,228 :: 		}
	GOTO        L_CRC_O33
;CRC_LEO.c,230 :: 		}
L_end_CRC_O:
	RETURN      0
; end of _CRC_O

_main:

;CRC_LEO.c,232 :: 		void main() {
;CRC_LEO.c,243 :: 		int d=0;
;CRC_LEO.c,244 :: 		int Pb=5;
;CRC_LEO.c,246 :: 		adc1=0b000000000000;
	CLRF        main_adc1_L0+0 
	CLRF        main_adc1_L0+1 
;CRC_LEO.c,247 :: 		pol1=0b000000000000;
	CLRF        main_pol1_L0+0 
	CLRF        main_pol1_L0+1 
;CRC_LEO.c,248 :: 		TRISA=0xFF;
	MOVLW       255
	MOVWF       TRISA+0 
;CRC_LEO.c,249 :: 		ADCON1 = 0b11000001;
	MOVLW       193
	MOVWF       ADCON1+0 
;CRC_LEO.c,250 :: 		TRISD=0x00;
	CLRF        TRISD+0 
;CRC_LEO.c,251 :: 		I2C1_Init(100000);
	MOVLW       10
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;CRC_LEO.c,253 :: 		I2C_LCD_Init();
	CALL        _I2C_LCD_Init+0, 0
;CRC_LEO.c,254 :: 		I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;CRC_LEO.c,255 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;CRC_LEO.c,256 :: 		I2C_Lcd_Out(1,1,txt1);                 // Write text in first row
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_col+0 
	MOVLW       _txt1+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;CRC_LEO.c,257 :: 		I2C_Lcd_Out(2,1,txt2);                 // Write text in second row
	MOVLW       2
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_col+0 
	MOVLW       _txt2+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;CRC_LEO.c,258 :: 		I2C_Lcd_Out(3,1,txt3);                 // Write text in third row
	MOVLW       3
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_col+0 
	MOVLW       _txt3+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(_txt3+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;CRC_LEO.c,259 :: 		I2C_Lcd_Out(4,1,txt4);                 // Write text in fourth row
	MOVLW       4
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_col+0 
	MOVLW       _txt4+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(_txt4+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;CRC_LEO.c,260 :: 		delay_ms(2000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main39:
	DECFSZ      R13, 1, 1
	BRA         L_main39
	DECFSZ      R12, 1, 1
	BRA         L_main39
	DECFSZ      R11, 1, 1
	BRA         L_main39
	NOP
	NOP
;CRC_LEO.c,261 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Cmd_out_char+0 
	CALL        _I2C_LCD_Cmd+0, 0
;CRC_LEO.c,265 :: 		while(1){
L_main40:
;CRC_LEO.c,267 :: 		adc1=adc1|adc;
	MOVLW       222
	IORWF       main_adc1_L0+0, 0 
	MOVWF       R2 
	MOVF        main_adc1_L0+1, 0 
	IORLW       0
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       main_adc1_L0+0 
	MOVF        R3, 0 
	MOVWF       main_adc1_L0+1 
;CRC_LEO.c,269 :: 		pol1=pol1|pol;
	MOVLW       19
	IORWF       main_pol1_L0+0, 0 
	MOVWF       R0 
	MOVF        main_pol1_L0+1, 0 
	IORLW       0
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       main_pol1_L0+0 
	MOVF        R1, 0 
	MOVWF       main_pol1_L0+1 
;CRC_LEO.c,272 :: 		nb1=CRC_O(adc1,pol1,11);
	MOVF        R2, 0 
	MOVWF       FARG_CRC_O_ad1+0 
	MOVF        R3, 0 
	MOVWF       FARG_CRC_O_ad1+1 
	MOVF        R0, 0 
	MOVWF       FARG_CRC_O_p+0 
	MOVF        R1, 0 
	MOVWF       FARG_CRC_O_p+1 
	MOVLW       11
	MOVWF       FARG_CRC_O_q+0 
	MOVLW       0
	MOVWF       FARG_CRC_O_q+1 
	CALL        _CRC_O+0, 0
	MOVF        R0, 0 
	MOVWF       main_nb1_L0+0 
	MOVF        R1, 0 
	MOVWF       main_nb1_L0+1 
;CRC_LEO.c,274 :: 		IntToStr(CRC, BUFER);
	MOVF        _CRC+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _CRC+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_BUFER_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_BUFER_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;CRC_LEO.c,275 :: 		IntToStr(adc1, BUFER1);
	MOVF        main_adc1_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_adc1_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_BUFER1_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_BUFER1_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;CRC_LEO.c,276 :: 		IntToStr(nb1, BUFER2);
	MOVF        main_nb1_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        main_nb1_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_BUFER2_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_BUFER2_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;CRC_LEO.c,277 :: 		I2C_Lcd_Out(1,1,"Hola ");
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_col+0 
	MOVLW       ?lstr1_CRC_LEO+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(?lstr1_CRC_LEO+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;CRC_LEO.c,278 :: 		I2C_Lcd_Out(2,1,BUFER);
	MOVLW       2
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_col+0 
	MOVLW       main_BUFER_L0+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(main_BUFER_L0+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;CRC_LEO.c,279 :: 		I2C_Lcd_Out(3,1,BUFER1);
	MOVLW       3
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_col+0 
	MOVLW       main_BUFER1_L0+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(main_BUFER1_L0+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;CRC_LEO.c,280 :: 		I2C_Lcd_Out(4,1,BUFER2);
	MOVLW       4
	MOVWF       FARG_I2C_LCD_Out_row+0 
	MOVLW       1
	MOVWF       FARG_I2C_LCD_Out_col+0 
	MOVLW       main_BUFER2_L0+0
	MOVWF       FARG_I2C_LCD_Out_text+0 
	MOVLW       hi_addr(main_BUFER2_L0+0)
	MOVWF       FARG_I2C_LCD_Out_text+1 
	CALL        _I2C_LCD_Out+0, 0
;CRC_LEO.c,281 :: 		PORTD=CRC;
	MOVF        _CRC+0, 0 
	MOVWF       PORTD+0 
;CRC_LEO.c,282 :: 		}
	GOTO        L_main40
;CRC_LEO.c,283 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
