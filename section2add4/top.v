`default_nettype none
module add4(
    input      clk,
    output     LED1,
    output     LED2,
    output     LED3,
    output     LED4,  
    output     LED5,
    input      PMOD1, // input p1
    input      PMOD2, // input p2
    input      PMOD3, // input p3
    input      PMOD4,  // input p4
    input      PMOD7, // will use for section 2
    input      PMOD8, // 
    input      PMOD9, // 
    input      PMOD10  //
    );


// Alias inputs
wire  [3:0] a;
wire  [3:0] b;
wire  [4:0] c; // you will likely use

// Alias outputs
reg   [4:0] o;

// assign inputs to signals with meaningful names
   assign a[0]=PMOD1;
   assign a[1]=PMOD2;
   assign a[2]=PMOD3;
   assign a[3]=PMOD4;

   assign b[0]=PMOD7;
   assign b[1]=PMOD8;
   assign b[2]=PMOD9;
   assign b[3]=PMOD10;
   
   
   always @(*)  // combinational assignment -- always computing
   begin // dummy logic here -- REPLACE WITH YOUR LOGIC
      o[0]<=(a[0]& !b[0]) | (!a[0]& b[0]);
      c[1]<=a[0] & b[0];
      o[1]<=(a[1]& !b[1] & !c[1])|(!a[1] &b[1]& !c[1])|(!a[1] & !b[1] & c[1])|(a[1] & b[1] & c[1]);
      c[2]<=(a[1] & b[1]) |(a[1] & c[1]) | (b[1] & c[1]);
      o[2]<=(a[2]& !b[2] & !c[2])|(!a[2] &b[2]& !c[2])|(!a[2] & !b[2] & c[2])|(a[2] & b[2] & c[2]);
      c[3]<=(a[2] & b[2]) |(a[2] & c[2]) | (b[2] & c[2]);
      o[3]<=(a[3]& !b[3] & !c[3])|(!a[3] &b[3]& !c[3])|(!a[3] & !b[3] & c[3])|(a[3] & b[3] & c[3]);
      o[4]<=(a[3] & b[3]) |(a[3] & c[3]) | (b[3] & c[3]);
     end

   // Wire up the lights
     assign LED1 = o[0];
     assign LED2 = o[1];
     assign LED3 = o[2];
     assign LED4 = o[3]; 
     assign LED5 = o[4]; 
endmo\dule
