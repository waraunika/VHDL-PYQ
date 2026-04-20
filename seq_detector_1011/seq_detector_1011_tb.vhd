-- seq_detector_1011_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seq_detector_1011_tb is
end entity seq_detector_1011_tb;

architecture sim of seq_detector_1011_tb is
  -- component declaration
  signal CLK, RESET_PIN, DATA_IN, DETECT : std_logic;

  -- test sequence: 101100101011011
  type test_array is array (0 to 14) of std_logic;
  constant test_seq : test_array := ('1', '0', '1', '1', '0', '0', '1', '0', '1', '0', '1', '1', '0', '1', '1');

begin
  uut: entity work.seq_detector_1011(behavioral)
    port map(
      CLK => CLK, RESET_PIN => RESET_PIN,
      DATA_IN => DATA_IN, DETECT => DETECT
    );

  -- clock generation (100 ns period)
  clock_process: process
  begin
    CLK <= '1'; wait for 50 ns;
    CLK <= '0'; wait for 50 ns;
  end process;

  -- stimulus
  stimulus: process
  begin
    -- reset first
    RESET_PIN <= '1';
    wait for 100 ns;
    RESET_PIN <= '0';

    -- testing the sequence
    for i in 0 to 15 loop
      DATA_IN <= test_seq(i);
      wait for 100 ns;
    end loop;
  end process;

end architecture sim;
