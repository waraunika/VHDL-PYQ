-- gcd_calculator_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd_calculator_tb is
end entity gcd_calculator_tb;

architecture sim of gcd_calculator_tb is
  signal X_IN, Y_IN, D_OUT : unsigned(7 downto 0);
begin
  uut: entity work.gcd_calculator(behavioral)
    port map(
      X_IN => X_IN, Y_IN => Y_IN,
      D_OUT => D_OUT
    );

  stimulus: process
  begin
    X_IN <= to_unsigned(12, 8); Y_IN <= to_unsigned(8, 8);
    wait for 10 ns;

    X_IN <= to_unsigned(18, 8); Y_IN <= to_unsigned(24, 8);
    wait for 10 ns;

    X_IN <= to_unsigned(24, 8); Y_IN <= to_unsigned(42, 8);
    wait for 10 ns;

    -- hold the output visible before ending simulation.
    wait for 10 ns;
    wait;
  end process;

end architecture sim;
