-- gcd_calculator.vhd

-- produces 1 clock cycle delay
-- i tried to make it combinational, but i just couldn't. the simulation is whack, despite providing right output 
-- just won't display the last test condition for some reason

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd_calculator is
  port (
    CLK, RST   : in  std_logic;
    X_IN, Y_IN  : in  unsigned(7 downto 0);
    D_OUT : out unsigned(7 downto 0)
  );
end entity gcd_calculator;

architecture behavioral of gcd_calculator is
begin
  process (CLK)
    variable x, y : unsigned(7 downto 0);
  begin
    if rising_edge(CLK) then -- take input at each rising pulse of clock
      if RST = '1' then -- if reset is on, then we simply reset input to 0
        D_OUT <= (others => '0');
      else -- otherwise, take in the value as provided
        x := X_IN;
        y := Y_IN;

        if x = to_unsigned(0, 8) then -- when condition of gcd(0, 30), the gcd is 30
          D_OUT <= y;
        elsif y = to_unsigned(0, 8) then -- when condition of gcd(12, 0), the gcd is 12
          D_OUT <= x;
        else -- otherwise normal euclidian algorithm
          while x /= y loop -- when x != y, loop to reduce both x and y till they are equal
            if x < y then
              y := y - x;
            else
              x := x - y;
            end if;
          end loop;

          D_OUT <= x;
        end if;
      end if;
    end if;
  end process;
end architecture behavioral;
