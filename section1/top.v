`default_nettype none
module demo(
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
   wire   p1;
   wire   p2;
   wire   p3;
   wire   p4;

// Alias outputs
   reg   o1;
   reg   o2;
   reg   o3;
   reg   o4;
   wire   o5;

   assign p1=PMOD1;
   assign p2=PMOD2;
   assign p3=PMOD3;
   assign p4=PMOD4;
   
   assign o5=p4; // output directly controls 
   
   always @(*) // combinational assignment -- always computing
     begin
        // <= is used for logic assignment
	o1<=p1 & p2;   // and together two inputs
	o2<=p1 | p2;   // or together two inputs
        o3<=!(p1 & !p2); // use a not !
        o4<=(p1 & p2) | !p3; // compound logic expression
     end

   // Wire up the lights
     assign LED1 = o1;
     assign LED2 = o2;
     assign LED3 = o3;
     assign LED4 = o4; 
     assign LED5 = o5; 
endmodule
