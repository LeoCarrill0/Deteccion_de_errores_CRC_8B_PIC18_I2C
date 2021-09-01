#define _LCD_FIRST_ROW          0x80     //Move cursor to the 1st row
#define _LCD_SECOND_ROW         0xC0     //Move cursor to the 2nd row
#define _LCD_THIRD_ROW          0x94     //Move cursor to the 3rd row
#define _LCD_FOURTH_ROW         0xD4     //Move cursor to the 4th row
#define _LCD_CLEAR              0x01     //Clear display
#define _LCD_RETURN_HOME        0x02     //Return cursor to home position, returns a shifted display to
                                         //its original position. Display data RAM is unaffected.
#define _LCD_CURSOR_OFF         0x0C     //Turn off cursor
#define _LCD_UNDERLINE_ON       0x0E     //Underline cursor on
#define _LCD_BLINK_CURSOR_ON    0x0F     //Blink cursor on
#define _LCD_MOVE_CURSOR_LEFT   0x10     //Move cursor left without changing display data RAM
#define _LCD_MOVE_CURSOR_RIGHT  0x14     //Move cursor right without changing display data RAM
#define _LCD_TURN_ON            0x0C     //Turn Lcd display on
#define _LCD_TURN_OFF           0x08     //Turn Lcd display off
#define _LCD_SHIFT_LEFT         0x18     //Shift display left without changing display data RAM
#define _LCD_SHIFT_RIGHT        0x1E     //Shift display right without changing display data RAM

// LCD Definitions
#define LCD_ADDR 0x4E

// Lcd constants
char txt1[] = "BIENVENIDO";
char txt2[] = "Verificcion de CRC";
char txt3[] = "PIC18F4550";
char txt4[] = "Wecos xD";

unsigned int CRC=0;
//const char ACK=0x06, NAK=0x15, ENQ=0x05, EOT=0x04, STX=0x02, ETX=0x03,DLE=0x10,NULL=0x00;
//Función para insertar in bit en el cálculo del CRC.

void I2C_LCD_Cmd(char out_char) {

    char hi_n, lo_n;
    char rs = 0x00;

    hi_n = out_char & 0xF0;
    lo_n = (out_char << 4) & 0xF0;

    I2C1_Start();
    I2C1_Is_Idle();
    I2C1_Wr(LCD_ADDR);
    I2C1_Is_Idle();
    I2C1_Wr(hi_n | rs | 0x04 | 0x08);
    I2C1_Is_Idle();
    Delay_us(50);
    I2C1_Wr(hi_n | rs | 0x00 | 0x08);
    I2C1_Is_Idle();
    Delay_us(100);
    I2C1_Wr(lo_n | rs | 0x04 | 0x08);
    I2C1_Is_Idle();
    Delay_us(50);
    I2C1_Wr(lo_n | rs | 0x00 | 0x08);
    I2C1_Is_Idle();
    I2C1_stop();

    if(out_char == 0x01)Delay_ms(2);
}

void I2C_LCD_Chr(char row, char column, char out_char) {

    char hi_n, lo_n;
    char rs = 0x01;

    switch(row){

        case 1:
        I2C_LCD_Cmd(0x80 + (column - 1));
        break;
        case 2:
        I2C_LCD_Cmd(0xC0 + (column - 1));
        break;
        case 3:
        I2C_LCD_Cmd(0x94 + (column - 1));
        break;
        case 4:
        I2C_LCD_Cmd(0xD4 + (column - 1));
        break;
    };

    hi_n = out_char & 0xF0;
    lo_n = (out_char << 4) & 0xF0;

    I2C1_Start();
    I2C1_Is_Idle();
    I2C1_Wr(LCD_ADDR);
    I2C1_Is_Idle();
    I2C1_Wr(hi_n | rs | 0x04 | 0x08);
    I2C1_Is_Idle();
    Delay_us(50);
    I2C1_Wr(hi_n | rs | 0x00 | 0x08);
    I2C1_Is_Idle();
    Delay_us(100);
    I2C1_Wr(lo_n | rs | 0x04 | 0x08);
    I2C1_Is_Idle();
    Delay_us(50);
    I2C1_Wr(lo_n | rs | 0x00 | 0x08);
    I2C1_Is_Idle();
    I2C1_stop();
}

void I2C_LCD_Chr_Cp(char out_char) {

    char hi_n, lo_n;
    char rs = 0x01;

    hi_n = out_char & 0xF0;
    lo_n = (out_char << 4) & 0xF0;

    I2C1_Start();
    I2C1_Is_Idle();
    I2C1_Wr(LCD_ADDR);
    I2C1_Is_Idle();
    I2C1_Wr(hi_n | rs | 0x04 | 0x08);
    I2C1_Is_Idle();
    Delay_us(50);
    I2C1_Wr(hi_n | rs | 0x00 | 0x08);
    I2C1_Is_Idle();
    Delay_us(100);
    I2C1_Wr(lo_n | rs | 0x04 | 0x08);
    I2C1_Is_Idle();
    Delay_us(50);
    I2C1_Wr(lo_n | rs | 0x00 | 0x08);
    I2C1_Is_Idle();
    I2C1_stop();
}


void I2C_LCD_Init() {

    char rs = 0x00;

    I2C1_Start();
    I2C1_Is_Idle();
    I2C1_Wr(LCD_ADDR);
    I2C1_Is_Idle();

    Delay_ms(30);

    I2C1_Wr(0x30 | rs | 0x04 | 0x08);
    I2C1_Is_Idle();
    Delay_us(50);
    I2C1_Wr(0x30 | rs | 0x00 | 0x08);
    I2C1_Is_Idle();

    Delay_ms(10);

    I2C1_Wr(0x30 | rs | 0x04 | 0x08);
    I2C1_Is_Idle();
    Delay_us(50);
    I2C1_Wr(0x30 | rs | 0x00 | 0x08);
    I2C1_Is_Idle();

    Delay_ms(10);

    I2C1_Wr(0x30 | rs | 0x04 | 0x08);
    I2C1_Is_Idle();
    Delay_us(50);
    I2C1_Wr(0x30 | rs | 0x00 | 0x08);
    I2C1_Is_Idle();

    Delay_ms(10);

    I2C1_Wr(0x20 | rs | 0x04 | 0x08);
    I2C1_Is_Idle();
    Delay_us(50);
    I2C1_Wr(0x20 | rs | 0x00 | 0x08);
    I2C1_Is_Idle();
    I2C1_Stop();

    Delay_ms(10);

    I2C_LCD_Cmd(0x28);
    I2C_LCD_Cmd(0x06);
}

void I2C_LCD_Out(char row, char col, char *text) {
    while(*text)
         I2C_LCD_Chr(row, col++, *text++);
}

void I2C_LCD_Out_Cp(char *text) {
    while(*text)
         I2C_LCD_Chr_Cp(*text++);
}


unsigned int CRC_R(int trama, int cont)
{
    int n=0;
    int nBit=0;
    int val=11;
    int exval=0;
    int and1=0;
    while(n !=1){
                 exval=pow(2,val)+1;
                 and1=trama&exval;
                 if(and1 !=0){
                   nBit=val;
                   n=1;
                   return nBit;
                 }
                 val--;
    }
}
unsigned int CRC_O(unsigned int ad1, unsigned int p,unsigned int q )
{
 int qb,qb1;
 int p1;
 int h;
 int ad;
 ad=ad1<<4;
 p1=p<<7;

 while(1){
 CRC=0;
 for(h=0; h<5; h++){
        qb=pow(2,q)+1;
        CRC=CRC | (ad&qb)^(p1&qb);
        q--;
 }
    qb1=CRC_R(CRC, q);
    if(qb1<5){
                   return qb1;
   }
 ad=ad | CRC;
 q=qb1;
 p1=p<<qb1-4;
 }
 //b=11;
}

void main() {
    //ANSELA = 0x00;
    unsigned char BUFER[12],BUFER1[12],BUFER2[12];
    unsigned int adc,adc1,pol,pol1;
    char Temp;

    int ex,ex1;
    int nb,nb1;
    int ac;
    int h;
    int b,b1;
    int d=0;
    int Pb=5;
    //int B;
    adc1=0b000000000000;
    pol1=0b000000000000;
    TRISA=0xFF;
    ADCON1 = 0b11000001;
    TRISD=0x00;
    I2C1_Init(100000);

    I2C_LCD_Init();
    I2C_LCD_Cmd(_LCD_CURSOR_OFF);
    I2C_LCD_Cmd(_LCD_CLEAR);
    I2C_Lcd_Out(1,1,txt1);                 // Write text in first row
    I2C_Lcd_Out(2,1,txt2);                 // Write text in second row
    I2C_Lcd_Out(3,1,txt3);                 // Write text in third row
    I2C_Lcd_Out(4,1,txt4);                 // Write text in fourth row
    delay_ms(2000);
    I2C_LCD_Cmd(_LCD_CLEAR);
      //ex=pow(2,3)+1;
      //CRC=CRC | (adc&ex^pol&ex);

    while(1){
      adc=0b11011110;
      adc1=adc1|adc;
      pol=0b10011;
      pol1=pol1|pol;

      b=11;
      nb1=CRC_O(adc1,pol1,11);
      //CRC=CRC|adc;
      IntToStr(CRC, BUFER);
      IntToStr(adc1, BUFER1);
      IntToStr(nb1, BUFER2);
      I2C_Lcd_Out(1,1,"Hola ");
      I2C_Lcd_Out(2,1,BUFER);
      I2C_Lcd_Out(3,1,BUFER1);
      I2C_Lcd_Out(4,1,BUFER2);
      PORTD=CRC;
    }
}