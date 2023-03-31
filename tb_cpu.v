`timescale 1ns / 1ns


module tb_cpu;

	// Inputs
	reg rst;
	reg clk;
	reg initialize;
	reg [31:0] instruction_initialize_data;
	reg [31:0] instruction_initialize_address;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.rst(rst), 
		.clk(clk), 
		.initialize(initialize), 
		.instruction_initialize_data(instruction_initialize_data), 
		.instruction_initialize_address(instruction_initialize_address)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		initialize = 1;
		instruction_initialize_data = 0;
		instruction_initialize_address = 0;

		#100;
      
		instruction_initialize_address = 0;
		instruction_initialize_data = 32'b000000_00000_00010_00001_00000_10_0000;      // ADD R1, R0, R2
		#20;
		instruction_initialize_address = 4;
		instruction_initialize_data = 32'b000000_00100_00100_01000_00000_10_0010;      // SUB R8, R4, R4
		#20;
		instruction_initialize_address = 8;
		instruction_initialize_data = 32'b000000_00101_00110_00111_00000_10_0101;      // OR R7, R5, R6
		#20;
		instruction_initialize_address = 12;
		instruction_initialize_data = 32'b101011_00000_01001_00000_00000_00_1100;      // SW R9, 12(R0)
		#20;
		instruction_initialize_address = 16;
		instruction_initialize_data = 32'b100011_00000_01100_00000_00000_00_1100;      // LW R12, 12(R0)
		#20;
        instruction_initialize_address = 20;
		instruction_initialize_data = 32'b000100_00000_00001_11111_11111_11_1111;      // BEQ R0, R1, -1
		#20;
		
//		 david's prelab code
		instruction_initialize_address = 24;
		instruction_initialize_data = 32'b000000_00000_00001_00011_00000_10_0100;      // AND R3, R0, R1
		#20;
		instruction_initialize_address = 28;
		instruction_initialize_data = 32'b000000_00001_00000_01010_00000_10_0111;      // NOR R10, R0, R1
		#20;
		instruction_initialize_address = 32;
		instruction_initialize_data = 32'b000000_00010_00000_01011_00000_10_0110;      // XOR R11, R2, R0
		#20;
		instruction_initialize_address = 36;
		// lab7 code
		instruction_initialize_data = 32'b000000_00010_00001_01101_00000_10_1010;      // SLT R13, R2, R1
		#20;
		instruction_initialize_address = 40;
		instruction_initialize_data = 32'b001000_00001_01110_0000_0000_0000_0001;      // ADDI R14, R1, 1
		#20;
		instruction_initialize_address = 44;
		instruction_initialize_data = 32'b001100_00001_01110_0000_0000_0000_0001;      // ANDI R14, R1, 1
		#20;
		instruction_initialize_address = 48;
		instruction_initialize_data = 32'b001000_00001_01110_0000_0000_0000_0001;      // ADDI R14, R1, 1
		#20;
		instruction_initialize_address = 52;
		instruction_initialize_data = 32'b001111_00001_01110_0000_0000_0000_0001;      // LUI R1, 1
		#20;
		instruction_initialize_address = 56;
		instruction_initialize_data = 32'b00_0101_00001_01110_0000_0000_0000_0010;      // BNE R14, R1, 2
		#20;
		instruction_initialize_address = 68;
		instruction_initialize_data = 32'b001000_00001_01110_0000_0000_0000_0010;      // ADDI R14, R1, 2
        #20;
        instruction_initialize_address = 72;
		instruction_initialize_data = 32'b00_0010_00000_00000_0000_0000_0000_0011;      // j 3
        #20;
        instruction_initialize_address = 76;
		instruction_initialize_data = 32'b001000_00001_01110_0000_0000_0000_0100;      // ADDI R14, R1, 4
        #20
        instruction_initialize_address = 88;
		instruction_initialize_data = 32'b001000_00001_01110_0000_0000_0000_0011;      // ADDI R14, R1, 3
        #20;
		instruction_initialize_address = 92;
		instruction_initialize_data = 32'b000000_00010_01110_01101_00000_10_1010;      // SLT R13, R2, R14
		#20;
		instruction_initialize_address = 96;
		instruction_initialize_data = 32'b000100_00000_00001_11111_11111_11_1111;      // BEQ R0, R0, 2
		#20;
		instruction_initialize_address = 108;
		instruction_initialize_data = 32'b001000_00001_01110_0000_0000_0000_0101;      // ADDI R14, R1, 5
        #20;
        instruction_initialize_address = 112;
		instruction_initialize_data = 32'b00_0101_01110_01110_0000_0000_0000_0010;      // BNE R14, R14, 2
		#20;
		instruction_initialize_address = 116;
		instruction_initialize_data = 32'b001000_00001_01110_0000_0000_0000_0110;      // ADDI R14, R1, 6
        #20;
		
		initialize = 0;
		rst = 0;
		
	end
      
always
#5 clk = ~clk;
endmodule

