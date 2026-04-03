-- jk_ff.vhdl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity jk_ff is
  port (
    J, K : in std_logic; -- inputs (J and K)
    CLK : in std_logic; -- clock input
    Q, Q_not : out std_logic -- complement output
  );
end jk_ff;

architecture behavioral of jk_ff is
  -- internal signals
  signal q_internal : std_logic := '0'; -- internal signal to store state
begin
  -- architecture body
  -- process "wakes up" when CLK changes (edge detection)
  process(CLK)
  begin
  -- check for rising edge of clock
    if rising_edge(CLK) then
      -- jk flip-flop behavior
      if (J = '0' and K = '0') then
        q_internal <= q_internal;
      elsif (J = '0' and K = '1') then
        q_internal <= '0';
      elsif (J = '1' and K = '0') then
        q_internal <= '1';
      else -- j = 1 and k = 1
        q_internal <= not q_internal;
      end if;
    end if;
  end process;

  -- assign internal signal to outputs
  Q <= q_internal;
  Q_not <= not q_internal;

end behavioral;
