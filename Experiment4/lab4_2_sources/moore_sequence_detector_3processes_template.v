`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: moore_sequence_detector_3processes
/////////////////////////////////////////////////////////////////

module moore_sequence_detector_3processes(
    input clk,
    input reset,
    input [1:0] ain,
    output reg yout
    );

    reg [1:0] state, nextstate;
    parameter [1:0] S0=0, S1=1, S2=2, S3=3;
    
	//state register logic
    always @(posedge clk or posedge reset)
   	begin
	   if(reset)state<=S0;
	   
       else state<=nextstate;
       
	end
 	
	//next state logic
    always @(state or ain)
    begin
     case(state)
           S0:
           begin
               if(ain==2'b10|ain==2'b11)nextstate=S1;
               else if(ain==2'b00|ain==2'b01)nextstate=S0;
           end
           
           S1:
           begin
               if(ain==2'b10|ain==2'b11)nextstate=S1;
               else if(ain==2'b00)nextstate=S2;
               else if(ain==2'b01)nextstate=S0;
           end
           
           S2:
           begin
               if(ain==2'b11|ain==2'b00)nextstate=S2;
               else if(ain==2'b01|ain==2'b10)nextstate=S3;
           end
           
           S3:
           begin
               if(ain==2'b10|ain==2'b01)nextstate=S3;
               else if(ain==2'b00)nextstate=S0;
               else if(ain==2'b11)nextstate=S2;
           end
           
           default: nextstate=S0;
           endcase

    end

	//output logic
    always @(state)
    begin
        if(state==S0|state==S1) yout=1'b0;
        else if(state==S2|state==S3)yout=1'b1;
    end

endmodule
