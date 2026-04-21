-- demux_1x8.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity demux_1x8 is
  port (
    d : in std_logic;
    S : in std_logic_vector(2 downto 0);
    Y : out std_logic_vector(7 downto 0)
  );
end entity demux_1x8;

architecture behavioral of demux_1x8 is
  -- internal signals
begin
  -- architecture body
  process(d, S)
  begin
    Y <= (others => '0'); -- default output to 0
    Y(to_integer(unsigned(S))) <= d;
  end process;
end architecture behavioral;
