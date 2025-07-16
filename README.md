# 🧠 Nano Processor Design – VHDL Implementation

Welcome to the repository for my Nano Processor project, implemented using VHDL and simulated on the Xilinx Vivado platform. This repository contains a complete implementation of a 4-bit Nano Processor, including its architecture, instruction format, VHDL modules, simulations, timing diagrams, and improvements.

## 📌 Table of Contents

* [Overview](#overview)
* [Reset and Clock Controls](#reset-and-clock-controls)
* [Display and Debug Outputs](#display-and-debug-outputs)
* [Instruction Format and Operations](#instruction-format-and-operations)
* [Execution Behavior](#execution-behavior)
* [Vivado Constraint Mappings](#vivado-constraint-mappings)
* [Getting Started](#getting-started)
* [License](#license)
* [Acknowledgments](#acknowledgments)

---

## Overview

This project demonstrates the complete design of a 4-bit Nano Processor from the ground up using VHDL, deployable on a Basys3 FPGA board. It features an enhanced ALU that supports addition, subtraction, bitwise logic, multiplication, and comparison. A modular instruction decoder processes an updated instruction format.

---

## Reset and Clock Controls

* **Reset Button**: BTN0 (mapped to port U18)

  * Resets the program counter and all registers to zero.

* **Clock Input**: 100 MHz onboard oscillator (W5)

  * Internally divided to run the processor at approximately 10 MHz.

---

## Display and Debug Outputs

* **7-Segment Display**:

  * Shows the value in **Register R7** using only digit AN0.
  * Driven through a binary-to-7-segment decoder (LUT\_16\_7).

* **LEDs**:

  * `LD0–LD3`: Lower 4 bits of Register R7 (reg7\_LED\[3:0])
  * `LD14`: Zero flag (zero\_flag)
  * `LD15`: Overflow flag (overflow\_flag)

* **Comparator Outputs**:

  * `M1`: Equal to flag
  * `N1`: Less than flag
  * `R2`: Greater than flag

* **Optional Debug Output**:

  * `debug_out[3:0]` available on pins N2, P2, T1, T2

---

## Instruction Format and Operations

* `MOVI`: `10 RRR 000 dddd` → Load immediate `dddd` into register RRR
* `ADD`:  `00 RaRaRa RbRbRb 0000` → `Ra ← Ra + Rb`
* `SUB`:  `00 RaRaRa RbRbRb 0001` → `Ra ← Ra - Rb`
* `NEG`:  `00 RaRaRa 000 1000` → Two’s complement of Ra
* `AND`:  `00 RaRaRa RbRbRb 0010` → `Ra ← Ra AND Rb`
* `OR`:   `00 RaRaRa RbRbRb 0011` → `Ra ← Ra OR Rb`
* `XOR`:  `00 RaRaRa RbRbRb 0100` → `Ra ← Ra XOR Rb`
* `MUL`:  `00 RaRaRa RbRbRb 0101` → `Ra ← Ra × Rb`
* `CMP`:  `00 RaRaRa RbRbRb 0111` → Sets comparison flags based on `Ra - Rb`
* `JZR`:  `11 RRR 0000 ddd` → Jump to `ddd` if register RRR is zero

---

## Execution Behavior

* Instructions are stored in the `Program_ROM` and executed sequentially.
* Each instruction executes on the **rising edge** of the internal slow clock.
* Register updates and flag changes happen synchronously.
* Comparisons update the comparator flags: **Equal**, **Less Than**, **Greater Than**.
* The processor loops when jump instructions target current/earlier addresses.

---

## Vivado Constraint Mappings

* Clock: W5 → `clk_in`
* Reset: U18 → `reset`
* R7 LEDs: U16, E19, U19, V19 → `reg7_LED[3:0]`
* Flags: L1 (`overflow_flag`), P1 (`zero_flag`)
* Comparator: M1 (`equal_to`), N1 (`less_than`), R2 (`greater_than`)
* 7-Segment Segments: W7, W6, U8, V8, U5, V5, U7 → `seven_segment[0–6]`
* 7-Segment Anodes: U2, U4, V4, W4 → `Anode[0–3]`
* Debug Output (optional): N2, P2, T1, T2 → `debug_out[3:0]`

---

## Getting Started

### Prerequisites

* Xilinx Vivado
* Basic understanding of VHDL and digital design

### How to Run

```bash
# Clone the repository
git clone https://github.com/your-username/nano-processor.git
cd nano-processor
```

* Open Vivado and import the source files.
* Run elaboration, synthesis, implementation, and simulation.
* Use the included testbenches and observe timing diagrams.

---

## 📄 License

This project is licensed under the MIT License – see the LICENSE file for details.

---

## 🙌 Acknowledgments

Special thanks to the University of Moratuwa and the Department of Computer Science and Engineering for academic support.
