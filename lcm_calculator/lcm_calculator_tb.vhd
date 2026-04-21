-- lcm_calculator_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lcm_calculator_tb is
end entity lcm_calculator_tb;

architecture sim of lcm_calculator_tb is
  -- test bench signals
  signal X_IN, Y_IN : unsigned(7 downto 0);
  signal D_OUT : unsigned(15 downto 0);

begin
  uut: entity work.lcm_calculator(behavioral)
    port map(
      X_IN => X_IN, Y_IN => Y_IN, D_OUT => D_OUT
    );

    stimulus: process
    begin
      X_IN <= to_unsigned(12, 8);
      Y_IN <= to_unsigned(8, 8);
      wait for 10 ns;

      X_IN <= to_unsigned(18, 8);
      Y_IN <= to_unsigned(24, 8);
      wait for 10 ns;

      X_IN <= to_unsigned(7, 8);
      Y_IN <= to_unsigned(13, 8);
      wait for 10 ns;

      X_IN <= to_unsigned(60, 8);
      Y_IN <= to_unsigned(30, 8);
      wait for 10 ns;

      wait;
    end process;
end architecture sim;
