-- ripple_counter.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ripple_counter is
  port (
    CLK, RST : in std_logic;
    q0 : out std_logic;
    q1 : out std_logic
  );
end entity ripple_counter;

architecture behavioral of ripple_counter is
  -- internal signals
  signal q0_reg : std_logic := '0';
  signal q1_reg : std_logic := '0';

begin
  -- tff0: toggles on every rising edge of clk 
  process(CLK, RST)
  begin
    if rst = '1' then
      q0_reg <= '0';
    elsif rising_edge(clk) then
      q0_reg <= not q0_reg;
    end if;
  end process;

  -- tff1: toggles on falling edge of q0 (ie rising edge of not q0)
  process (q0_reg, RST)
  begin
    if rst = '1' then
      q1_reg <= '0';
    elsif falling_edge(q0_reg) then
      q1_reg <= not q1_reg;
    end if;
  end process;

  q0 <= q0_reg;
  q1 <= q1_reg;

end architecture behavioral;
