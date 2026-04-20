-- gcd_calculator.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gcd_calculator is
  port (
    X_IN, Y_IN : in unsigned(7 downto 0);
    D_OUT : out unsigned(7 downto 0)
  );
end entity gcd_calculator;

architecture behavioral of gcd_calculator is
begin
  -- architecture body
  process (X_IN, Y_IN)
    variable x, y : unsigned(7 downto 0);
  begin
    x := X_IN;
    y := Y_IN;

    -- i couldn't get it to run normally
    -- so i had to put this guard against unintialized inputs
    -- apparently when not initialized, they cause infinite loop
    -- will change comments when i find why

    if is_x(std_logic_vector(x)) or is_x(std_logic_vector(y)) then
      D_OUT <= (others => 'U');
    elsif x = to_unsigned(0, 8) then
      D_OUT <= y;
    elsif y = to_unsigned(0, 8) then
      D_OUT <= x;
    else
      while x /= y loop
        if x < y then
          y := y - x;
        else
          x := x - y;
        end if;
      end loop;

      D_OUT <= x;
    end if;
  end process;
end architecture behavioral;
