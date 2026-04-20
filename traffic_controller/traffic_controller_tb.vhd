-- traffic_controller_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity traffic_controller_tb is
end entity traffic_controller_tb;

architecture sim of traffic_controller_tb is
  signal CLK : std_logic;
  signal NS_GREEN, NS_YELLOW, NS_RED : std_logic;
  signal EW_GREEN, EW_YELLOW, EW_RED : std_logic;

begin
  uut: entity work.traffic_controller(behavioral)
    port map(
      CLK => CLK,
      NS_GREEN => NS_GREEN, NS_YELLOW => NS_YELLOW, NS_RED => NS_RED,
      EW_GREEN => EW_GREEN, EW_YELLOW => EW_YELLOW, EW_RED => EW_RED
    );

  -- clock generation process, 10 ns = 1 second scaling
  clock_process: process
  begin
    CLK <= '0';
    wait for 5 ns;
    CLK <= '1';
    wait for 5 ns;
  end process;

  -- just run for 1500 ns, logic already present in main hdl.
  stimulus: process
  begin
    wait for 1500 ns;

    wait;
  end process;

end architecture sim;
