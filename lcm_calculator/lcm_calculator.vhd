-- lcm_calculator.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lcm_calculator is
  port (
    X_IN, Y_IN : in unsigned(7 downto 0);
    D_OUT : out unsigned(15 downto 0) -- need double the bits of input
  );
end entity lcm_calculator;

architecture behavioral of lcm_calculator is
  -- internal function
  -- go to gcd directory for actual logic, here is just short implementation of it
  function gcd(a, b : unsigned(7 downto 0)) return unsigned is
    variable x, y : unsigned(7 downto 0);
  begin
    x := a;
    y := b;

    if x = to_unsigned(0, 8) then
      return y;
    elsif y = to_unsigned(0, 8) then
      return x;
    else
      while x /= y loop
        if x < y then
          y := y - x;
        else
          x := x - y;
        end if;
      end loop;
      return x;
    end if;
  end function;
begin
  -- architecture body
  process (X_IN, Y_IN)
    variable gcd_val : unsigned(7 downto 0);
    variable product : unsigned(15 downto 0);
  begin
    -- check for 0 values in x and y, if 0, lcm = 0
    if X_IN = to_unsigned(0, 8) or Y_IN = to_unsigned(0, 8) then
      D_OUT <= (others => '0');

    -- if x or y are invalid, then we simply put undefined as output
    elsif is_x(std_logic_vector(X_IN)) or is_x(std_logic_vector(Y_IN)) then
      D_OUT <= (others => 'U');

    -- lcm = product / gcd
    else
      gcd_val := gcd(X_IN, Y_IN);
      product := X_IN * Y_IN;
      D_OUT <= product / gcd_val;
    end if;
  end process;

end architecture behavioral;
