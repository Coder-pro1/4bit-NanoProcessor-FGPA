## Clock (clk_in)
set_property PACKAGE_PIN W5            [get_ports clk_in]
    set_property IOSTANDARD LVCMOS33   [get_ports clk_in]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk_in]

## Reset Button (reset)
set_property PACKAGE_PIN U18           [get_ports reset]
    set_property IOSTANDARD LVCMOS33   [get_ports reset]

## reg7_LED (4 bits from R7 register)
set_property PACKAGE_PIN U16           [get_ports {reg7_LED[0]}]
    set_property IOSTANDARD LVCMOS33   [get_ports {reg7_LED[0]}]
set_property PACKAGE_PIN E19           [get_ports {reg7_LED[1]}]
    set_property IOSTANDARD LVCMOS33   [get_ports {reg7_LED[1]}]
set_property PACKAGE_PIN U19           [get_ports {reg7_LED[2]}]
    set_property IOSTANDARD LVCMOS33   [get_ports {reg7_LED[2]}]
set_property PACKAGE_PIN V19           [get_ports {reg7_LED[3]}]
    set_property IOSTANDARD LVCMOS33   [get_ports {reg7_LED[3]}]

## Status Flags
set_property PACKAGE_PIN L1            [get_ports overflow_flag]
    set_property IOSTANDARD LVCMOS33   [get_ports overflow_flag]
set_property PACKAGE_PIN P1            [get_ports zero_flag]
    set_property IOSTANDARD LVCMOS33   [get_ports zero_flag]

## Seven Segment Display Segments (seven_segment[6:0])
set_property PACKAGE_PIN W7            [get_ports {seven_segment[0]}]
    set_property IOSTANDARD LVCMOS33   [get_ports {seven_segment[0]}]
set_property PACKAGE_PIN W6            [get_ports {seven_segment[1]}]
    set_property IOSTANDARD LVCMOS33   [get_ports {seven_segment[1]}]
set_property PACKAGE_PIN U8            [get_ports {seven_segment[2]}]
    set_property IOSTANDARD LVCMOS33   [get_ports {seven_segment[2]}]
set_property PACKAGE_PIN V8            [get_ports {seven_segment[3]}]
    set_property IOSTANDARD LVCMOS33   [get_ports {seven_segment[3]}]
set_property PACKAGE_PIN U5            [get_ports {seven_segment[4]}]
    set_property IOSTANDARD LVCMOS33   [get_ports {seven_segment[4]}]
set_property PACKAGE_PIN V5            [get_ports {seven_segment[5]}]
    set_property IOSTANDARD LVCMOS33   [get_ports {seven_segment[5]}]
set_property PACKAGE_PIN U7            [get_ports {seven_segment[6]}]
    set_property IOSTANDARD LVCMOS33   [get_ports {seven_segment[6]}]

set_property PACKAGE_PIN U2 [get_ports {Anode[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {Anode[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {Anode[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {Anode[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Anode[3]}]
