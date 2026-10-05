module sram_param #(
    parameter DATA_WIDTH = 8,   // Size of each data word
    parameter ADDR_WIDTH = 10   // 2^10 = 1024 deep memory locations
)(
    input  wire                  clk,        // Clock signal
    input  wire                  we,         // Write Enable (1 = Write, 0 = Read)
    input  wire [ADDR_WIDTH-1:0] addr,       // Address bus
    input  wire [DATA_WIDTH-1:0] data_in,    // Data input bus
    output reg  [DATA_WIDTH-1:0] data_out    // Data output register
);

    // Declare the memory array (Depth = 2^ADDR_WIDTH)
    reg [DATA_WIDTH-1:0] memory [0:(1<<ADDR_WIDTH)-1];

    // Synchronous Read and Write Block
    always @(posedge clk) begin
        if (we) begin
            memory[addr] <= data_in;  // Write operation
        end
        // Read operation happens every clock cycle 
        data_out <= memory[addr];     
    end

endmodule
