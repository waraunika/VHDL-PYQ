-- demux_1x8_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity demux_1x8_tb is
end entity demux_1x8_tb;

architecture sim of demux_1x8_tb is
  -- test bench signals
  signal d : std_logic;
  signal S : std_logic_vector(2 downto 0);
  signal Y : std_logic_vector(7 downto 0);

begin
  uut: entity work.demux_1x8(behavioral)
    port map(
      d => d, S => S, Y => Y
    );

    stimulus: process
    begin
      d <= '0'; S <= "000"; wait for 10 ns;
      d <= '0'; S <= "001"; wait for 10 ns;
      d <= '0'; S <= "010"; wait for 10 ns;
      d <= '0'; S <= "011"; wait for 10 ns;
      d <= '0'; S <= "100"; wait for 10 ns;
      d <= '0'; S <= "101"; wait for 10 ns;
      d <= '0'; S <= "110"; wait for 10 ns;
      d <= '0'; S <= "111"; wait for 10 ns;
      d <= '1'; S <= "000"; wait for 10 ns;
      d <= '1'; S <= "001"; wait for 10 ns;
      d <= '1'; S <= "010"; wait for 10 ns;
      d <= '1'; S <= "011"; wait for 10 ns;
      d <= '1'; S <= "100"; wait for 10 ns;
      d <= '1'; S <= "101"; wait for 10 ns;
      d <= '1'; S <= "110"; wait for 10 ns;
      d <= '1'; S <= "111"; wait for 10 ns; 

      wait;
    end process;

end architecture sim;
