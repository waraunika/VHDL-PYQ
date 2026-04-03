-- jk_ff_tb.vhdl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity jk_ff_tb is
end entity jk_ff_tb;

architecture test of jk_ff_tb is
  -- signal to connect to JK flip flop
  signal J, K, CLK, Q, Q_not : std_logic;

begin
  -- instantiate/connect JK flip flop
  -- using <structural> style i.e. connecting components

  uut: entity work.jk_ff(behavioral)
    port map(
      J => J,
      K => K,
      CLK => CLK,
      Q => Q,
      Q_not => Q_not
    );

  -- clock generation process
  clock_process: process
  begin
    CLK <= '0';
    wait for 10 ns;
    CLK <= '1';
    wait for 10 ns;
  end process;

  -- stimulus process (testing combinations)
  stimulus: process
  begin
    J <= '0'; K <= '0';
    wait for 20 ns;

    J <= '0'; K <= '1';
    wait for 20 ns;

    J <= '1'; K <= '0';
    wait for 20 ns;

    J <= '1'; K <= '1';
    wait for 20 ns;

    J <= '1'; K <= '1';
    wait for 20 ns;

    J <= '0'; K <= '0';
    wait for 20 ns;

  wait;
end process;

end architecture test;
