-- seq_detector_1101.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seq_detector_1101 is
  port (
    CLK : in std_logic;
    RST : in std_logic;
    d : in std_logic;
    y : out std_logic
  );
end entity seq_detector_1101;

architecture behavioral of seq_detector_1101 is
  -- internal signals
  signal state : integer range 0 to 4 := 0;
begin
  -- architecture body

  process(CLK, RST)
  begin
    if RST = '1' then
      state <= 0;
      y <= '0';
    elsif rising_edge(CLK) then
      -- default output
      y <= '0';

      -- state machine
      case state is
        when 0 =>
          if d = '1' then 
            state <= 1;
          else
            state <= 0;
          end if;

        when 1 =>
          if d = '1' then
            state <= 2;
          else
            state <= 0;
          end if;

        when 2 =>
          if d = '0' then
            state <= 3;
          else
            state <= 0;
          end if;

        when 3 =>
          if d = '1' then
            state <= 4;
            y <= '1';
          else
            state <= 0;
          end if;

        when 4 =>
          if d = '0' then
            state <= 0;
          else
            state <= 2;
          end if;

        when others =>
          state <= 0;
      end case;
    end if;
  end process;

end architecture behavioral;
