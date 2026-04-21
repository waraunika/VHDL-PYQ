-- factorial_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity factorial_tb is
end entity factorial_tb;

architecture sim of factorial_tb is
  -- test bench signals
  signal X_IN : unsigned(2 downto 0);
  signal Y_OUT : unsigned(12 downto 0);
begin
  uut: entity work.factorial(behavioral)
    port map(
      X_IN => X_IN, Y_OUT => Y_OUT
    );

  stimulus: process
  begin
    X_IN <= to_unsigned(2, 3); wait for 10 ns;
    X_IN <= to_unsigned(1, 3); wait for 10 ns;
    X_IN <= to_unsigned(4, 3); wait for 10 ns;
    X_IN <= to_unsigned(5, 3); wait for 10 ns;
    X_IN <= to_unsigned(7, 3); wait for 10 ns;

    wait;
  end process;

end architecture sim;
