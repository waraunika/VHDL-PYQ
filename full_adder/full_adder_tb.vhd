-- full_adder_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_tb is
end entity full_adder_tb;

architecture sim of full_adder_tb is
  signal A, B, SUM : std_logic;
  signal C_IN, C_OUT : std_logic;
begin
  uut: entity work.full_adder(structural)
    port map(
      A => A, B => B, C_IN => C_IN,
      SUM => SUM, C_OUT => C_OUT
    );

  stimulus: process
  begin
    -- test with C_IN = 0
    C_IN <= '0';
    A <= '0'; B <= '0'; wait for 100 ns;
    A <= '0'; B <= '1'; wait for 100 ns;
    A <= '1'; B <= '0'; wait for 100 ns;
    A <= '1'; B <= '1'; wait for 100 ns;

    -- test with C_IN = 1
    C_IN <= '1';
    A <= '0'; B <= '0'; wait for 100 ns;
    A <= '0'; B <= '1'; wait for 100 ns;
    A <= '1'; B <= '0'; wait for 100 ns;
    A <= '1'; B <= '1'; wait for 100 ns;
  end process;
end architecture sim;
