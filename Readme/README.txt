==========================
Nano Processor Operation Guide
==========================

1. Overview
-----------
This file is meant to walk you through the basics of using this nanoporcessor on the Basys3 FPGA board. It includes how the reset and writing procedures function, I/O mappings, and expected behaviors during execution.

2. Reset and Clock Controls
---------------------------
- **Reset Button**: BTN0 (Center button on Basys3)
  - Pressing this will reset the program counter and all registers to all 0s.

- **Clock Input**: 100 MHz onboard clock
  - The processor operates at approximately 10MHz.

3. LED and Display Mapping
--------------------------
- **7-Segment Display**:
  - Displays the value in **Register R7**
  - Uses `LUT_16_7` decoder to convert binary to 7-segment output.
  - Only the rightmost digit (AN0) is active.

- **LEDs**:
  - Can display flags for Zero/Overflow, or register contents.
    - LD14: Zero flag
    - LD15: Overflow flag
    - LD0-3: Register 7 Value

4. Instruction Behavior
------------------------
- Instructions are hardcoded into `Program_ROM` and executed sequentially.
* Instuction Format - [Op code][regA][regB]{Immediate value]
- Supported operations:
  - `MOVI Ra, Imm` → Load immediate value into register (10RRR000dddd)
  - `ADD Ra, Rb` → Add two registers and stores result(In Reg A) (00RaRaRaRbRbRb0000)
  - `NEG Ra` → Negate a value using two’s complement(01RRR0000000)
  - `JZR Ra, Addr` → Jump to instruction `Addr` if `Ra` = 0 (11RRR0000ddd)
- Program Counter is incremented by 1 unless a jump is taken.

5. Expected Behavior
---------------------
- After reset, the processor starts executing instructions from address 0.
- Each instruction is executed on the rising edge of the slowed-down clock.
- The 7-segment display updates what R7 has.
- All writing to registers happen at rising edge.
- Program idles instructions loops using jumps.

6. Notes
--------
- Ensure switches and other inputs are not interfering during operation.


