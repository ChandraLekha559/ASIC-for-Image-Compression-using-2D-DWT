// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Generated on "04/26/2023 14:17:05"
                                                                                
// Verilog Test Bench template for design : chech_fsm
// 
// Simulation tool : ModelSim-Altera (Verilog)
// 
`define NUM_BLOCKS 1024
`timescale 1 ps/ 1 ps
module fsm_test();
// constants                                           
// general purpose registers
reg eachvec;
// test vector input registers
reg clk;
reg [31:0] inp1a_export;
reg [31:0] inp1b_export;
reg [31:0] inp2a_export;
reg [31:0] inp2b_export;
reg [31:0] inp3a_export;
reg [31:0] inp3b_export;
reg [31:0] inp4a_export;
reg [31:0] inp4b_export;
reg [31:0] inp5a_export;
reg [31:0] inp5b_export;
reg [31:0] inp6a_export;
reg [31:0] inp6b_export;
reg [31:0] inp7a_export;
reg [31:0] inp7b_export;
reg [31:0] inp8a_export;
reg [31:0] inp8b_export;
reg reset_n;
reg [31:0] start_go;
//reg uart_txd;
// reg [31:0] treg_write_clkcntrl;
// wires                                               
wire [31:0]  outp1a_export;
wire [31:0]  outp1b_export;
wire [31:0]  outp2a_export;
wire [31:0]  outp2b_export;
wire [31:0]  outp3a_export;
wire [31:0]  outp3b_export;
wire [31:0]  outp4a_export;
wire [31:0]  outp4b_export;
wire [31:0]  outp5a_export;
wire [31:0]  outp5b_export;
wire [31:0]  outp6a_export;
wire [31:0]  outp6b_export;
wire [31:0]  outp7a_export;
wire [31:0]  outp7b_export;
wire [31:0]  outp8a_export;
wire [31:0]  outp8b_export;
wire [31:0]  stop;
//wire uart_rxd;
wire [31:0]  write_clkcntrl;
wire [31:0]  count_for_c_export;
wire [63:0] outp1,outp2,outp3,outp4,outp5,outp6,outp7,outp8;
integer i ; 
integer fp1 ;  
reg [63:0] mem [8191:0] ;  


// assign statements (if any)                          
// assign write_clkcntrl = treg_write_clkcntrl;
chech_fsm i1 (
// port map - connection between master ports and signals/registers   
	.clk(clk),
	.inp1a_export(inp1a_export),
	.inp1b_export(inp1b_export),
	.inp2a_export(inp2a_export),
	.inp2b_export(inp2b_export),
	.inp3a_export(inp3a_export),
	.inp3b_export(inp3b_export),
	.inp4a_export(inp4a_export),
	.inp4b_export(inp4b_export),
	.inp5a_export(inp5a_export),
	.inp5b_export(inp5b_export),
	.inp6a_export(inp6a_export),
	.inp6b_export(inp6b_export),
	.inp7a_export(inp7a_export),
	.inp7b_export(inp7b_export),
	.inp8a_export(inp8a_export),
	.inp8b_export(inp8b_export),
	.outp1a_export(outp1a_export),
	.outp1b_export(outp1b_export),
	.outp2a_export(outp2a_export),
	.outp2b_export(outp2b_export),
	.outp3a_export(outp3a_export),
	.outp3b_export(outp3b_export),
	.outp4a_export(outp4a_export),
	.outp4b_export(outp4b_export),
	.outp5a_export(outp5a_export),
	.outp5b_export(outp5b_export),
	.outp6a_export(outp6a_export),
	.outp6b_export(outp6b_export),
	.outp7a_export(outp7a_export),
	.outp7b_export(outp7b_export),
	.outp8a_export(outp8a_export),
	.outp8b_export(outp8b_export),
	.reset_n(reset_n),
	.start_go(start_go),
	.stop(stop),
//	.uart_rxd(uart_rxd),
//	.uart_txd(uart_txd),
	.write_clkcntrl(write_clkcntrl),
	.count_for_c_export(count_for_c_export)
);
initial 
	begin 
	   clk = 1'b0;
		reset_n = 0;
		#5 reset_n=1;
		#6 start_go = 32'd1;
		$readmemh("lena_final.hex", mem);
		i = 0 ;
		#46 fp1 = $fopen ("dwtq123.hex","w");
		#1000000 
		$fclose(fp1) ; 
		$stop ;
	end
	
always #5 clk = ~clk;

always@(posedge clk)
	begin
		if (i<1024)
			begin
				{inp1a_export , inp1b_export} = mem[8*i];
				{inp2a_export , inp2b_export} = mem[8*i+1];
				{inp3a_export , inp3b_export} = mem[8*i+2];
				{inp4a_export , inp4b_export} = mem[8*i+3];
				{inp5a_export , inp5b_export} = mem[8*i+4];
				{inp6a_export , inp6b_export} = mem[8*i+5];
				{inp7a_export , inp7b_export} = mem[8*i+6];
				{inp8a_export , inp8b_export} = mem[8*i+7];
				start_go<=32'd2;
			end
		 i = i+1;
	end
	
always@(posedge clk)
	begin
		if(i==`NUM_BLOCKS+8)
			begin
					$fclose(fp1);
					#100;
					$stop;
			end
	end
assign outp1 = {outp1a_export,outp1b_export};
assign outp2 = {outp2a_export,outp2b_export};
assign outp3 = {outp3a_export,outp3b_export};
assign outp4 = {outp4a_export,outp4b_export};
assign outp5 = {outp5a_export,outp5b_export};
assign outp6 = {outp6a_export,outp6b_export};
assign outp7 = {outp7a_export,outp7b_export};
assign outp8 = {outp8a_export,outp8b_export};
always@(posedge clk)
	begin
		if (write_clkcntrl==32'd1 ||  write_clkcntrl==32'd2)
			begin
			 $fdisplayh(fp1,outp1);
			 $fdisplayh(fp1,outp2);
			 $fdisplayh(fp1,outp3);
			 $fdisplayh(fp1,outp4);
			 $fdisplayh(fp1,outp5);
			 $fdisplayh(fp1,outp6);
			 $fdisplayh(fp1,outp7);
			 $fdisplayh(fp1,outp8);
			end
	end
	
endmodule
		
	