`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: mealy_sequence_detector_3processes_tb
//////////////////////////////////////////////////////////////////////////////////

module mealy_sequence_detector_3processes_tb(
    );

    reg clk;
    reg reset;
    reg ain;
    wire [3:0] count;
    wire yout;
    
    mealy_sequence_detector_3processes DUT (.clk(clk), .reset(reset), .ain(ain), .count(count), .yout(yout));

    initial
    begin
        clk = 0;
        forever
        begin
          #5 clk = 1;
          #5 clk = 0;
        end
    end
    
    initial
       begin
        reset = 1'b1;
		ain = 1'b0;
		#20; // wait for 2 clock cycles
        reset = 1'b0;
		#10 ain = 1'b0;
		#30 ain = 1'b1;
		#20 ain = 1'b0;
		// Write the rest of the input signal test cases.
		#20 ain=1'b1;
        #30 ain=1'b0;
        #30 ain=1'b1;
        #10 ain=1'b0;
        #30 ain=1'b1;

       end 

endmodule
