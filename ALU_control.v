`timescale 1ns / 1ns

module ALU_control(
	 input [5:0] instruction,
	 input [1:0] ALUOp,
	 output reg [2:0] func
    );

    always @(*) begin
        if (ALUOp == 2'b00) begin  
            if (instruction == 6'h20) 
            func = 3'd0; // add
            else if (instruction == 6'h22)
            func = 3'd1; // sub
            else if (instruction == 6'h24)
            func = 3'd2; // and
            else if (instruction == 6'h25)
            func = 3'd3; // or
            else if (instruction == 6'h27)
            func = 3'd4; // nor
            else if (instruction == 6'h26)
            func = 3'd5; // xor
            else if (instruction == 6'h2a)
            func = 3'd6; // slt
            else
            func = 3'd7; // CHANGED TO LUI
        end else if (ALUOp == 2'b01) begin
            func = 3'd1;  // sub
        end else if (ALUOp == 2'b10) begin
            func = 3'd0; // add
        end else begin          // ALUOP == 2'b11
             if (instruction == 6'h08)
             func = 3'd0; // addi
             else if (instruction == 6'h0c)
             func = 3'd2; // andi
             else if (instruction == 6'h0f)
             func = 3'd7; // lui
             
        end
    end // always
    


endmodule
