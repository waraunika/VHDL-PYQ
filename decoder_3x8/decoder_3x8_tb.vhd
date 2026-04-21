-- decoder_3x8_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_3x8_tb is
end entity decoder_3x8_tb;

architecture sim of decoder_3x8_tb is
  signal A : std_logic_vector(2 downto 0);
  signal Y : std_logic_vector(7 downto 0);

begin
  uut: entity work.decoder_3x8(behavioral)
    port map(
      A => A, Y => Y
    );

    stimulus: process
    begin
      A <= "000"; wait for 10 ns;
      A <= "001"; wait for 10 ns;
      A <= "010"; wait for 10 ns;
      A <= "011"; wait for 10 ns;
      A <= "100"; wait for 10 ns;
      A <= "101"; wait for 10 ns;
      A <= "110"; wait for 10 ns;
      A <= "111"; wait for 10 ns;
      wait for 10 ns;

      wait;
    end process;

end architecture sim;
