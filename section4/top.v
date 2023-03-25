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


// Manage 12MHz clock
   reg [24:0] counter; 
   reg [1:0] dec_cntr;


// The 12MHz clock is too fast
// ...count to 6 million to divide it down to a half second clock
	always@(posedge clk)
	  begin
	     counter <= counter + 1;
  	     if (counter == 6000000)
  	       begin
		   counter<=0; // reset counter
		   dec_cntr <= dec_cntr + 1; // count number of half seconds
               end
	  end	

   // Make the lights blink -- each light activiated on a different value of 2b half-second counter
   assign LED1 = (dec_cntr == 0) ;
   assign LED2 = (dec_cntr == 1) ;
   assign LED3 = (dec_cntr == 2) ;
   assign LED4 = (dec_cntr == 3) ;
endmodule