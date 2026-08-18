module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] ALU_Sel,
    output reg  [3:0] Result,
    output reg        Carry,
    output            Zero
);

    reg [4:0] temp;

    always @(*) begin

        Result = 4'b0000;
        Carry  = 1'b0;
        temp   = 5'b00000;

        case (ALU_Sel)

            // Addition
            3'b000: begin
                temp   = A + B;
                Result = temp[3:0];
                Carry  = temp[4];
            end

            // Subtraction
            3'b001: begin
                Result = A - B;
                Carry  = (A < B);
            end

            // AND
            3'b010: begin
                Result = A & B;
            end

            // OR
            3'b011: begin
                Result = A | B;
            end

            // XOR
            3'b100: begin
                Result = A ^ B;
            end

            // NOT A
            3'b101: begin
                Result = ~A;
            end

            // Shift left
            3'b110: begin
                Result = A << 1;
                Carry  = A[3];
            end

            // Shift right
            3'b111: begin
                Result = A >> 1;
                Carry  = A[0];
            end

            default: begin
                Result = 4'b0000;
                Carry  = 1'b0;
            end

        endcase
    end

    assign Zero = (Result == 4'b0000);

endmodule