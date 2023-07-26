module avg(input clk, input [7:0]p1, input [7:0]p2, output reg [7:0]pout);
//Declaration of intermediate wires
wire [7:0] outp;

assign outp = {1'b0 , p1[7:1]} + {1'b0 , p2[7:1]};

always@(posedge clk)
begin
	pout = outp;
end 



endmodule







//wire [7:0] out_int, outp;
//
//assign out_int = { p1[7:0]} + { p2[7:0]};
//assign outp  =  out_int/2 ; 
//
//always@(posedge clk)
//begin
//	pout = outp;
//end 