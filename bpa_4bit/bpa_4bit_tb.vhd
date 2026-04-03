-- bpa_4bit_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bpa_4bit_tb is
end entity bpa_4bit_tb;

architecture test of bpa_4bit_tb is
  signal A, B, SUM : std_logic_vector(3 downto 0);
  signal C_IN, C_OUT : std_logic;
begin
  uut: entity work.bpa_4bit(structural)
    port map(
      A => A, B => B, C_IN => C_IN,
      SUM => SUM, C_OUT => C_OUT
    );


  stimulus: process
  begin
    -- test with C_IN = 0
    C_IN <= '0';

    A <= "0001"; B <= "0010"; wait for 10 ns; -- 1 + 2 = 3
    A <= "0101"; B <= "1010"; wait for 10 ns; -- 5 + 10 = 15
    A <= "1111"; B <= "0001"; wait for 10 ns; -- 15 + 1 = 0 with carry

    C_IN <= '1';
    A <= "0001"; B <= "0101"; wait for 10 ns; -- 1 + 3 + 1 = 5
    A <= "0011"; B <= "1100"; wait for 10 ns; -- 3 + 12 + 1 = 1 with carry
    
  end process;

end architecture test;
