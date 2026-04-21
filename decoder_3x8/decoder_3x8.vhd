-- decoder_3x8.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_3x8 is
  port (
    A : in std_logic_vector(2 downto 0);
    Y : out std_logic_vector(7 downto 0)
  );
end entity decoder_3x8;

architecture behavioral of decoder_3x8 is
  -- internal signals
begin
  -- architecture body
  with A select
    Y <= "00000001" when "000",
         "00000010" when "001",
         "00000100" when "010",
         "00001000" when "011",
         "00010000" when "100",
         "00100000" when "101",
         "01000000" when "110",
         "10000000" when "111",
         "00000000" when others;

end architecture behavioral;
