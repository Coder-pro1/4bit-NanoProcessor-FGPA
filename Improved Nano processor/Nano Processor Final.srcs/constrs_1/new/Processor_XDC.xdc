## Clock (clk_in)
set_property PACKAGE_PIN W5 [get_ports clk_in]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_in]

## Reset Button (reset)
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## Register 7 output to LEDs
set_property PACKAGE_PIN U16 [get_ports {reg7_LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {reg7_LED[0]}]
set_property PACKAGE_PIN E19 [get_ports {reg7_LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {reg7_LED[1]}]
set_property PACKAGE_PIN U19 [get_ports {reg7_LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {reg7_LED[2]}]
set_property PACKAGE_PIN V19 [get_ports {reg7_LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {reg7_LED[3]}]

## Status Flags
set_property PACKAGE_PIN L1 [get_ports overflow_flag]
set_property IOSTANDARD LVCMOS33 [get_ports overflow_flag]
set_property PACKAGE_PIN P1 [get_ports zero_flag]
set_property IOSTANDARD LVCMOS33 [get_ports zero_flag]

## Comparator Flags
set_property PACKAGE_PIN M1 [get_ports equal_to]
set_property IOSTANDARD LVCMOS33 [get_ports equal_to]
set_property PACKAGE_PIN N1 [get_ports less_than]
set_property IOSTANDARD LVCMOS33 [get_ports less_than]
set_property PACKAGE_PIN R2 [get_ports greater_than]
set_property IOSTANDARD LVCMOS33 [get_ports greater_than]

## Seven Segment Display (Segments a-g)
set_property PACKAGE_PIN W7 [get_ports {seven_segment[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment[0]}]
set_property PACKAGE_PIN W6 [get_ports {seven_segment[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment[1]}]
set_property PACKAGE_PIN U8 [get_ports {seven_segment[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment[2]}]
set_property PACKAGE_PIN V8 [get_ports {seven_segment[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment[3]}]
set_property PACKAGE_PIN U5 [get_ports {seven_segment[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment[4]}]
set_property PACKAGE_PIN V5 [get_ports {seven_segment[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment[5]}]
set_property PACKAGE_PIN U7 [get_ports {seven_segment[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment[6]}]

## Seven Segment Anode Control (Common Cathode Selection)
set_property PACKAGE_PIN U2 [get_ports {Anode[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {Anode[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {Anode[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {Anode[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Anode[3]}]

## Debug Output (optional 4-bit signal)
set_property PACKAGE_PIN N2 [get_ports {debug_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {debug_out[0]}]
set_property PACKAGE_PIN P2 [get_ports {debug_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {debug_out[1]}]
set_property PACKAGE_PIN T1 [get_ports {debug_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {debug_out[2]}]
set_property PACKAGE_PIN T2 [get_ports {debug_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {debug_out[3]}]
