// This is a Verilog description for an 4 x 16 register file
`timescale 1ns / 1ns

module register file
  (input clk,// clock for the register file
   input write, // write signal for the reigster file 
   input [31:0] wrAddr,//write data address location
   input [31:0] wrData,//wr data 32 bit
   input [31:0] rdAddrA,// read address 32 bit
   output [31:0] rdDataA);// read 32 bit data

	reg [31:0] regs[31:0];
	
	if((rdAddrA >= 32h'fffffa40) or (rdAddrA <= 32h'fffffa5f)) begin
		if(((rdAddrA == 0xfffffa40) || (rdAddrA == 0xfffffa41))|| ((rdAddrA >= 0xfffffa52) && (rdAddrA <= 0xfffffa5f))) begin
			assign rdDataA = regfile[rdAddrA - 32h'fffffa40];
		end
	end else begin
		$display("invalid address"); //FIXME a placeholder for now - should we return a zero
	end
	
	always @(posedge clk) begin
		if (write) regfile[wrAddr + 32h'fffffa40] <= wrData;
	end
	
endmodule

//=========================================