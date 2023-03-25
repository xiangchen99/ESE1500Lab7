`default_nettype none
module count8(
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
    input      PMOD7, // input p5
    input      PMOD8, // input p6
    input      PMOD9, // input p7
    input      PMOD10  // input p8
    );


// Alias inputs
wire  [7:0] i;

// you may want to declare intermedaite variables

// Alias outputs
reg   [4:0] o;

// assign inputs to signals with meaningful names
   assign i[0]=PMOD1;
   assign i[1]=PMOD2;
   assign i[2]=PMOD3;
   assign i[3]=PMOD4;

   assign i[4]=PMOD7;
   assign i[5]=PMOD8;
   assign i[6]=PMOD9;
   assign i[7]=PMOD10;
   
   
   always @(*)  // combinational assignment -- always computing
   begin // dummy logic here -- REPLACE WITH YOUR LOGIC
      o[0]<=i[0]&i[0];
      o[1]<=i[1]&i[1];
      o[2]<=i[2]&i[2];
      o[3]<=i[3]&i[3];
      o[4]<=!i[0];
     end

   // Wire up the lights
     assign LED1 = o[0];
     assign LED2 = o[1];
     assign LED3 = o[2];
     assign LED4 = o[3]; 
     assign LED5 = o[4]; 
endmodule
