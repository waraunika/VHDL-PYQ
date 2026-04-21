-- mux_2x4_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_2x1_tb is
end entity mux_2x1_tb;

architecture sim of mux_2x1_tb is

  -- test bench signals
  signal A : std_logic_vector(1 downto 0);
  signal S : std_logic;
  signal Y : std_logic;

begin
  uut: entity work.mux_2x1(behavioral)
    port map(
      A => A, S => S, Y => Y
    );

    stimulus: process
    begin
      A <= "00"; S <= '0'; wait for 10 ns;
      A <= "00"; S <= '1'; wait for 10 ns;
      A <= "01"; S <= '0'; wait for 10 ns;
      A <= "01"; S <= '1'; wait for 10 ns;
      A <= "10"; S <= '0'; wait for 10 ns;
      A <= "10"; S <= '1'; wait for 10 ns;
      A <= "11"; S <= '0'; wait for 10 ns;
      A <= "11"; S <= '1'; wait for 10 ns;
      
      wait;
    end process;
end architecture sim;
