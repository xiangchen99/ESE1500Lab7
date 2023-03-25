`default_nettype none
module add4(
    input      clk,
    output     LED1,
    output     LED2,
    output     LED3,
    output     LED4,
    output     LED5,
    input      PMOD1, // input p1 -- reset accumulator
    input      PMOD2, // input p2 -- add input to accumulator
    input      PMOD3, // input p3 -- display top nibble (accum[7:4])
    input      PMOD4, // input p4
    input      PMOD7, // in[3:0] for input to add
    input      PMOD8, // 
    input      PMOD9, // 
    input      PMOD10  //
    );


// Manage 12MHz clock
   reg [24:0] counter;
   reg [7:0] accum;
   wire [3:0] in;
   wire p_reset, p_input, p_high;
   reg previous_p_input;

   assign p_reset=PMOD1;
   assign p_input=PMOD2;
   assign p_high=PMOD3;

   assign in[0]=PMOD7;
   assign in[1]=PMOD8;
   assign in[2]=PMOD9;
   assign in[3]=PMOD10;

// The 12MHz clock is too fast
// ...count to 1 million to divide it down to about 0.1 second clock
	always@(posedge clk)
	  begin
	     counter <= counter + 1;
  	     if (counter == 1200000) 
  	       begin
		        counter<=0;
            if(p_reset == 1)
                begin
                  accum<= 0;
                  previous_p_input<= 1;
                end
            if (previous_p_input == 0) 
               begin 
                if(p_input == 1)
                begin
                  accum <= accum + in;
                  previous_p_input<= 1;
                end
              end
            if(previous_p_input == 1)
              begin
                previous_p_input <= 0;
              end
            if(p_high == 1)
                begin
                  LED1 = accum[4];
                  LED2 = accum[5];
                  LED3 = accum[6];
                  LED4 = accum[7];
                end
            if(p_high == 0)
                begin
                  LED1 = accum[0];
                  LED2 = accum[1];
                  LED3 = accum[2];
                  LED4 = accum[3];
                end
         end
	  end	

   // Set the output lights
   // TODO: update with your logic to show the high or low nibble based on the value of p_high 	        
endmodule