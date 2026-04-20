-- gcd_calculator_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd_calculator_tb is
end entity gcd_calculator_tb;

architecture sim of gcd_calculator_tb is
  signal CLK : std_logic := '1';
  signal RST : std_logic := '1';
  signal X_IN : unsigned(7 downto 0) := (others => '0');
  signal Y_IN : unsigned(7 downto 0) := (others => '0');
  signal D_OUT : unsigned(7 downto 0); 

  constant CLK_PERIOD : time := 10 ns;
begin
  uut: entity work.gcd_calculator(behavioral)
    port map(
      CLK => CLK, RST => RST,
      X_IN => X_IN, Y_IN => Y_IN,
      D_OUT => D_OUT
    );

  -- Clock generation: free running
  CLK <= not CLK after CLK_PERIOD / 2;

  stimulus: process
  begin
    -- holding reset for 1 cycle
    RST <= '1';
    wait for CLK_PERIOD;
    RST <= '0';

    X_IN <= to_unsigned(12, 8); Y_IN <= to_unsigned(8, 8);
    wait for CLK_PERIOD;

    X_IN <= to_unsigned(18, 8); Y_IN <= to_unsigned(24, 8);
    wait for CLK_PERIOD;

    X_IN <= to_unsigned(24, 8); Y_IN <= to_unsigned(42, 8);
    wait for CLK_PERIOD;

    -- hold the output visible before ending simulation.
    wait for CLK_PERIOD;
    wait;
  end process;

end architecture sim;
