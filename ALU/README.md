4-Bit ALU Using Verilog HDL
📌 Project Overview
An Arithmetic Logic Unit (ALU) is a digital circuit that performs arithmetic and logical operations on binary data.

This project implements a 4-bit ALU using Verilog HDL. The ALU accepts two 4-bit inputs and performs different arithmetic and logical operations based on a 3-bit operation-select input.

The design is verified using a Verilog testbench and simulated using Icarus Verilog and GTKWave.

🎯 Objectives
The objectives of this project are:

To design a 4-bit Arithmetic Logic Unit using Verilog HDL.
To perform arithmetic operations on binary numbers.
To perform logical operations on binary numbers.
To understand the use of control/select signals.
To create a Verilog testbench for verification.
To simulate the ALU and observe its waveform.
To document the project and upload it to GitHub.
⚙️ ALU Inputs and Outputs
Signal	Direction	Width	Description
A	Input	4-bit	First operand
B	Input	4-bit	Second operand
ALU_Sel	Input	3-bit	Operation select
Result	Output	4-bit	ALU operation result
Carry	Output	1-bit	Carry/borrow indication
Zero	Output	1-bit	HIGH when result is zero

🔢 Supported Operations
The 3-bit ALU_Sel determines the operation.

ALU_Sel	Operation	Description
000	ADD	A + B
001	SUB	A - B
010	AND	A & B
011	OR	A | B
100	XOR	A ^ B
101	NOT	~A
110	SHL	Shift A left by 1
111	SHR	Shift A right by 1

🧩 Block Diagram
                    ┌─────────────────────────┐
                    │                         │
        A[3:0] ────►│                         │
                    │                         │
        B[3:0] ────►│        4-BIT ALU        │────► Result[3:0]
                    │                         │
 ALU_Sel[2:0] ────►│                         │────► Carry
                    │                         │
                    │                         │────► Zero
                    └─────────────────────────┘

⚙️ Working Principle
The ALU receives two 4-bit operands:

A = First operand
B = Second operand

The ALU_Sel input determines which operation is performed.

For example, if:

A = 0101
B = 0011
ALU_Sel = 000

000 represents addition:

  0101
+ 0011
------
  1000

Therefore:

Result = 1000
Carry  = 0

For an AND operation:

A = 1100
B = 1010

  1100
& 1010
------
  1000

Therefore:

Result = 1000