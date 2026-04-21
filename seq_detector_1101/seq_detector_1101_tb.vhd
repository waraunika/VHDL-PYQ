-- seq_detector_1101_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seq_detector_1101_tb is
end entity seq_detector_1101_tb;

architecture sim of seq_detector_1101_tb is
  signal CLK, RST, d, y : std_logic;

  type test_array is array (0 to 14) of std_logic;
  constant test_seq : test_array := ('1', '1', '0', '1', '1', '0', '1', '0', '1', '0', '1', '1', '0', '1', '1');

  -- test bench signals
begin
  uut: entity work.seq_detector_1101(behavioral)
  port map(
    CLK => CLK, RST => RST,
    d => d, y => y
  );

  clock_process: process
  begin
    CLK <= '1'; wait for 10 ns;
    CLK <= '0'; wait for 10 ns;
  end process;

  stimulus: process
  begin
    RST <= '1';
    wait for 20 ns;
    RST <= '0';

    for i in 0 to 15 loop
      d <= test_seq(i);
      wait for 20 ns;
    end loop;
  end process;

end architecture sim;
