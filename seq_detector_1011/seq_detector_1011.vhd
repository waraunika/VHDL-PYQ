-- seq_detector_1011.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seq_detector_1011 is
  port (
    CLK: in std_logic;
    RESET_PIN : in std_logic;
    DATA_IN : in std_logic;
    DETECT: out std_logic
  );
end entity seq_detector_1011;

architecture behavioral of seq_detector_1011 is
  -- internal signals

  signal state : integer range 0 to 4 := 0;

  -- definition of states:
  -- 0 = S0, 1 = S1 ...
begin
  -- architecture body

  process(CLK, RESET_PIN)
  begin
    if RESET_PIN = '1' then
      state <= 0;
      DETECT <= '0';

    elsif rising_edge(CLK) then
      -- default output
      DETECT <= '0';

      -- state machine
      case state is
        when 0 =>
          if DATA_IN = '1' then
            state <= 1;
          else
            state <= 0;
          end if;

        when 1 =>
          if DATA_IN = '0' then
            state <= 2;
          else
            state <= 1;
          end if;

        when 2 =>
          if DATA_IN = '1' then
            state <= 3;
          else
            state <= 0;
          end if;

        when 3 =>
          if DATA_IN = '1' then
            state <= 4;
            DETECT <= '1';
          else
            state <= 2;
          end if;

        when 4 =>
          if DATA_IN = '1' then
            state <= 1;
          else
            state <= 2;
          end if;

        when others =>
          state <= 0;
      end case;
    end if;
  end process;

end architecture behavioral;
