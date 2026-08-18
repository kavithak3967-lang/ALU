timescale 1ns/1ps

module alu_4bit_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] ALU_Sel;

    wire [3:0] Result;
    wire Carry;
    wire Zero;

    // Instantiate ALU
    alu_4bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .Result(Result),
        .Carry(Carry),
        .Zero(Zero)
    );

    // Generate waveform
    initial begin
        $dumpfile("simulation/waveform.vcd");
        $dumpvars(0, alu_4bit_tb);
    end

    // Test cases
    initial begin

        $monitor(
            "Time=%0t | A=%b | B=%b | Sel=%b | Result=%b | Carry=%b | Zero=%b",
            $time, A, B, ALU_Sel, Result, Carry, Zero
        );

        // ADD: 5 + 3 = 8
        A = 4'b0101;
        B = 4'b0011;
        ALU_Sel = 3'b000;
        #10;

        // SUB: 9 - 4 = 5
        A = 4'b1001;
        B = 4'b0100;
        ALU_Sel = 3'b001;
        #10;

        // AND: 1100 & 1010 = 1000
        A = 4'b1100;
        B = 4'b1010;
        ALU_Sel = 3'b010;
        #10;

        // OR: 1100 | 1010 = 1110
        A = 4'b1100;
        B = 4'b1010;
        ALU_Sel = 3'b011;
        #10;

        // XOR: 1100 ^ 1010 = 0110
        A = 4'b1100;
        B = 4'b1010;
        ALU_Sel = 3'b100;
        #10;

        // NOT: ~0101 = 1010
        A = 4'b0101;
        B = 4'b0000;
        ALU_Sel = 3'b101;
        #10;

        // Shift left: 0011 << 1 = 0110
        A = 4'b0011;
        B = 4'b0000;
        ALU_Sel = 3'b110;
        #10;

        // Shift right: 1100 >> 1 = 0110
        A = 4'b1100;
        B = 4'b0000;
        ALU_Sel = 3'b111;
        #10;

        // ADD with carry: 1111 + 0001 = 0000
        A = 4'b1111;
        B = 4'b0001;
        ALU_Sel = 3'b000;
        #10;

        // Zero result test
        A = 4'b0101;
        B = 4'b0101;
        ALU_Sel = 3'b001;
        #10;

        $finish;
    end

endmodule