-- d_ff.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_ff is
  port (
    D : in std_logic;
    CLK : in std_logic;
    Q, Q_not : out std_logic
  );
end entity d_ff;

architecture behavioral of d_ff is
  -- internal signals
  signal q_internal : std_logic := '0';
begin
  -- architecture body
  process(CLK)
  begin
    if rising_edge(CLK) then
      -- d flip flop behavior
      if (D = '0') then
        q_internal <= '0';
      elsif (D = '1') then
        q_internal <= '1';
      end if;
    end if;
  end process;

  -- assign signal to outputs
  Q <= q_internal;
  Q_not <= q_internal;


end architecture behavioral;
