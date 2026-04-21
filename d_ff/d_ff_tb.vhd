-- d_ff_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_ff_tb is
end entity d_ff_tb;

architecture sim of d_ff_tb is
    -- test bench signals
  signal D, CLK, Q, Q_not : std_logic;

begin
  uut: entity work.d_ff(behavioral)
    port map(
      D => D,
      CLK => CLK,
      Q => Q,
      Q_not => Q_not
    );

  clock_process: process
  begin
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;
  end process;

  stimulus: process
  begin
    D <= '0'; wait for 20 ns;
    D <= '1'; wait for 20 ns;
    D <= '0'; wait for 20 ns;
    D <= '1'; wait for 20 ns;
    D <= '1'; wait for 20 ns;
    D <= '0'; wait for 20 ns;
    D <= '1'; wait for 20 ns;
    D <= '0'; wait for 20 ns;

    wait;
  end process;

end architecture sim;
