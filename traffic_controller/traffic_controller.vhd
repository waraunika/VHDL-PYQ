-- traffic_controller.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity traffic_controller is
  port (
    CLK : in std_logic; -- clock input (we'll take 10 ns as 1 second interval)

    -- North-2-south lights
    NS_GREEN, NS_YELLOW, NS_RED : out std_logic;

    -- East-2-west lights
    EW_GREEN, EW_YELLOW, EW_RED : out std_logic
  );
end entity traffic_controller;

architecture behavioral of traffic_controller is
  -- internal signals
  signal counter : integer range 0 to 60 := 0; -- counter for timing
  signal state : integer range 0 to 5 := 0; -- 0: NS_GREEN, 1: NS_YELLOW, 2: NS_RED, 3: EW_GREEN, 4: EW_YELLOW, 5: EW_RED

begin
  -- architecture body

  -- process wake up when CLK changes (edge detection)
  process(CLK)
  begin
    if rising_edge(CLK) then
      -- increment each second
      counter <= counter + 1;

      -- state machine for traffic light
      case state is
        when 0 => -- NS green, ES red (25 second)
          if counter = 25 then
            counter <= 0;
            state <= 1; -- move to NS yellow
          end if;

        when 1 => -- NS yellow, ES red (5 second)
          if counter = 5 then
            counter <= 0;
            state <= 2; -- move to NS red, ES green
          end if;

        when 2 => -- ES green, NS red (25 second)
          if counter = 25 then
            counter <= 0;
            state <= 3; -- move to EW yellow
          end if;

        when 3 => -- EW yellow, NS red (5 second)
          if counter = 5 then
            counter <= 0;
            state <= 0; -- move to NS green
          end if;

        when others =>
          state <= 0;
      end case;
    end if;
  end process;

  process(state) -- assign output signal based on current staate
  begin
    -- default all lights off
    NS_GREEN <= '0'; NS_YELLOW <= '0'; NS_RED <= '0';
    EW_GREEN <= '0'; EW_YELLOW <= '0'; EW_RED <= '0';

    -- then case by case, assign light
    case state is
      when 0 => -- NS green, EW red
        NS_GREEN <= '1';
        EW_RED <= '1';

      when 1 => -- NS yellow, EW red
        NS_YELLOW <= '1';
        EW_RED <= '1';

      when 2 => -- EW green, NS red
        EW_GREEN <= '1';
        NS_RED <= '1';

      when 3 => -- EW yellow, NS red
        NS_RED <= '1';
        EW_YELLOW <= '1';

      when others => -- edge case, like when ambulance comes and we manage state for that
        NS_RED <= '1';
        EW_RED <= '1';
    end case;
  end process;

end architecture behavioral;
