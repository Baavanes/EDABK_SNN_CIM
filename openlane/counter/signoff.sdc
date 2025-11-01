#####################################
# signoff.sdc for counter design
#####################################

# T?o clock 100 MHz (chu k? 10 ns)
create_clock -period 10.0 -name clk [get_ports clk]

# Thi?t l?p delay ngõ vào (so v?i clock)
set_input_delay 1.0 -clock clk [get_ports {rst}]

# Thi?t l?p delay ngõ ra
set_output_delay 1.0 -clock clk [all_outputs]

# ?? b?t ??nh clock
set_clock_uncertainty 0.2 [get_clocks clk]

# Thi?t l?p t?i cho các output (n?u c?n)
set_load 0.1 [all_outputs]

