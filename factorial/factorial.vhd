-- factorial.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity factorial is
  port (
    X_IN : in unsigned(2 downto 0);
    Y_OUT : out unsigned(12 downto 0)
    -- for 3 bit input, max is 7. max factorial = 5040, held by 13 bits
  );
end entity factorial;

architecture behavioral of factorial is
  -- internal signals
begin
  -- architecture body
  process(X_IN)
    variable y : unsigned(12 downto 0);

  begin
    if is_x(std_logic_vector(X_IN)) then
      Y_OUT <= (others => 'U');

    elsif X_IN = 1 or X_IN = 0 then
      Y_OUT <= to_unsigned(1, 13);

    else
      y := to_unsigned(1, 13);
      for i in 2 to to_integer(X_IN) loop
        y := resize(y * to_unsigned(i, 13), 13);
      end loop;

      Y_OUT <= y;
    end if;
  end process;


end architecture behavioral;
