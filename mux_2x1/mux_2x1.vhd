-- mux_4x1.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_2x1 is
  port (
    A : in std_logic_vector(1 downto 0);
    S : in std_logic;
    Y : out std_logic
  );
end entity mux_2x1;

architecture behavioral of mux_2x1 is
  -- internal signals
begin
  -- architecture body
  with S select
    Y <= A(0) when '0',
         A(1) when '1',
         '0' when others;


end architecture behavioral;
