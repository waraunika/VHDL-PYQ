-- ripple_counter_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ripple_counter_tb is
end entity ripple_counter_tb;

architecture sim of ripple_counter_tb is
  -- test bench signals
  component ripple_counter is
    port(
      CLK, RST : in std_logic;
      q0, q1 : out std_logic
    );
  end component;

  signal CLK : std_logic := '0';
  signal RST : std_logic := '1';
  signal q0  : std_logic;
  signal q1  : std_logic;

begin
  CLK <= not CLK after 5 ns;

  uut: ripple_counter port map (
    CLK => CLK, RST => RST, q0 => q0, q1 => q1
  );

  process
  begin
    wait for 20 ns;
    rst <= '0';
    wait for 160 ns;
    assert false report "done" severity note;
    wait;
  end process;
end architecture sim;
