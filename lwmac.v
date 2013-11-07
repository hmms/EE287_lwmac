module lwmac(clk,reset,busWrite,busDataToLmac,busDataFromLmac,busAddr,pushSym,Sym,pushOut,dataOut,macSate);
input clk;
input reset;
input busWrite;
input [31:0]busDataToLmac;
output [31:0] busDataFromLmac;
input [31:0] busAddr;
input pushSym;
input [4:0]Sym;
output pushOut;
output [8:0] dataOut;
output [3:0] macState;

endmodule