module subtract(input clk, input [7:0]p1, input [7:0]p2, output reg [7:0]pout);

reg [7:0] out_int;

always@(posedge clk)
begin
	if(p1<p2)
	  begin 
	   //out_int = p2[7:0] - p1[7:0];
      pout = (p2[7:0] - p1[7:0])/2 ;
	  end
	
	else
	  begin
		//out_int =  p1[7:0] -  p2[7:0]; 
		pout = (p1[7:0] -  p2[7:0])/2 ;
     end
	
end 

endmodule


//module HighPassFilter4Bit (
//  input clk,
//  input reset,
//  input signed [3:0] data_in,
//  output reg signed [3:0] data_out
//);
//
//  // Coefficients for the high-pass filter
//  parameter signed [3:0] COEFF_A = 4'b1000;
//  parameter signed [3:0] COEFF_B = -4'b0111;
//
//  // Internal registers
//  reg signed [3:0] delay_1;
//  reg signed [3:0] delay_2;
//  reg signed [3:0] delay_3;
//
//  always @(posedge clk or posedge reset) begin
//    if (reset) begin
//      // Reset the filter
//      delay_1 <= 4'b0;
//      delay_2 <= 4'b0;
//      delay_3 <= 4'b0;
//    end else begin
//      // Perform the high-pass filtering
//      delay_1 <= data_in;
//      delay_2 <= delay_1 - delay_3;
//      delay_3 <= (delay_2 * COEFF_A) + (delay_3 * COEFF_B);
//      data_out <= delay_2;
//    end
//  end
//
//endmodule
//
//module HighPassFilter (
//  input clk,
//  input reset,
//  input signed [7:0] data_in,
//  output reg signed [7:0] data_out
//);
//
//  // Coefficients for the high-pass filter
//  parameter signed [7:0] COEFF_A = 4'b1000;
//  parameter signed [7:0] COEFF_B = -4'b0111;
//
//  // Internal registers
//  reg signed [7:0] delay_1;
//  reg signed [7:0] delay_2;
//  reg signed [7:0] delay_3;
//
//  always @(posedge clk or posedge reset) begin
//    if (reset) begin
//      // Reset the filter
//      delay_1 <= 8'b0;
//      delay_2 <= 8'b0;
//      delay_3 <= 8'b0;
//    end else begin
//      // Perform the high-pass filtering
//      delay_1 <= data_in;
//      delay_2 <= delay_1 - delay_3;
//      delay_3 <= (delay_2 * COEFF_A) + (delay_3 * COEFF_B);
//      data_out <= delay_2;
//    end
//  end
//
//endmodule
////always@(posedge clk)
////begin
////	if(p1<p2) begin 
////	
////	pout = {1'b0 , p2[7:1]} - {1'b0 , p1[7:1]}; end
////	else
////		pout = {1'b0 , p1[7:1]} - {1'b0 , p2[7:1]}; 
////
////	
////end 