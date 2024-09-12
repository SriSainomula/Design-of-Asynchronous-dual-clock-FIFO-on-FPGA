`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2024 15:31:18
// Design Name: 
// Module Name: FIFO_memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//----------------DISCRIPTION-----------------
// This code is for FIFO memory module. It is 
// a synchronous FIFO memory module with a
// configurable data size and address size.
// It is a dual-port memory module.
//-------------------------------------------

// -------------PARAMETERS------------
// DATA_SIZE: Size of the data bus
// ADDR_SIZE: Size of the address bus
// -----------------------------------

module FIFO_memory #(parameter DATA_SIZE = 8,
    parameter ADDR_SIZE = 4)(
    output [DATA_SIZE-1:0] rdata,        // Output data - data to be read
    input [DATA_SIZE-1:0] wdata,         // Input data - data to be written
    input [ADDR_SIZE-1:0] waddr, raddr,  // Write and read address
    input wclk_en, wfull, wclk          // Write clock enable, write full, write clock
    );

    localparam DEPTH = 1<<ADDR_SIZE;     // Depth of the FIFO memory
    reg [DATA_SIZE-1:0] mem [0:DEPTH-1];// Memory array

    assign rdata = mem[raddr];          // Read data

    always @(posedge wclk)
        if (wclk_en && !wfull) mem[waddr] <= wdata; // Write data

endmodule

// ---------------------------EXPLANATION---------------------------------
// The module has a memory array (mem) with a depth of 2^ADDR_SIZE.
// The read and write addresses are used to access the memory array.
// The write clock enable (wclk_en) and write full (wfull) signals are used
// to control the writing process. The write data is stored in the memory
// array on the rising edge of the write clock (wclk).
// -----------------------------------------------------------------------
