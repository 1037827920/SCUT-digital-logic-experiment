`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////
// Module Name: mealy_sequence_detector_3processes
/////////////////////////////////////////////////////////////////

module mealy_sequence_detector_3processes(
    input clk,
    input reset,
    input ain,
    output reg [3:0] count,
    output reg yout
    );
    reg [2:0] state, nextstate;
    parameter [2:0] S0=0, S1=1, S2=2, S3=3, S4=4, S5=5;
	//state register and counter
    always @(posedge clk or posedge reset)
    begin
    if (reset)
           begin
           state <= S0;count<=4'b0000;
           end
        else 
           begin
           state <= nextstate;
               if(ain)
                   count<=count+1;       
           end
	end
	//output logic
    always @(state or ain)
    begin
         yout= 1'b0;
           case(state)
               S0:if(!ain)
               yout=1;
               else
               yout=0;
               S1:
               yout=0;
               S2:
               if(ain)
                   yout=1;
                   else
                      yout=0;
               endcase    
	end
	//next state logic
    always @(state or ain)
    begin
            case(state)
                S0:
                if(ain)
                    nextstate = S1;
                else 
                    nextstate=S0;
                S1:
                if(ain)
                    nextstate = S2;
                else 
                    nextstate=S1;
                S2:
                if(ain)
                    nextstate = S0;
                else 
                    nextstate=S2;
             endcase               
    end
endmodule
