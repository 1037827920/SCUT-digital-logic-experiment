`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: moore_sequence_detector_3processes_tb
//////////////////////////////////////////////////////////////////////////////////

module moore_sequence_detector_3processes_tb(
    );

    reg clk;
    reg reset;
    reg [1:0] ain;
    wire yout;
    
    moore_sequence_detector_3processes DUT (.clk(clk), .reset(reset), .ain(ain), .yout(yout));

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
		ain = 2'b00;
		#20; // wait for 2 clock cycles
        	reset = 1'b0;
		#10 ain = 2'b00;
		#10 ain = 2'b11;
		#10 ain = 2'b10;    
		#10 ain = 2'b00;    // toggle output to 1
		#20 ain = 2'b10;    
		#10 ain = 2'b00;    // toggle output to 0
		// Write the rest of the input signal test cases. 
		#10 ain = 2'b11;
        #10 ain = 2'b00;
        #10 ain = 2'b01;
        #10 ain = 2'b00;
        #10 ain = 2'b10;
        #10 ain = 2'b11;
        #10 ain = 2'b00;
        #10 reset = 1'b1; ain = 2'b00;
        #10 ain = 2'b00;  reset= 1'b0;
        #10 ain = 2'b10;
        #30 ain = 2'b00;

       end 

endmodule
