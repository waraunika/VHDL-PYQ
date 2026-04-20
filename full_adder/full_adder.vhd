-- full_adder.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder is
  port (
    A, B, C_IN: in std_logic;
    SUM, C_OUT: out std_logic
  );
end entity full_adder;

architecture structural of full_adder is
  component half_adder is
    port(
      A, B : in std_logic;
      S, C_O : out std_logic
    );
  end component;

  -- internal carry signals
  signal ha1_sum, ha1_carry : std_logic;
  signal ha2_sum, ha2_carry : std_logic;
begin
  -- instantiate 2 half adders
  ha1: half_adder port map(
    A => A, B => B,
    S => ha1_sum, C_O => ha1_carry
  );

  -- why i'm doing this:
  -- previously i tried to simply assign sum of ha2 as the actual sum, worked
  -- but i tried to map carry of full adder to OR operation of carry of both half adders
  -- this resulted in syntax error, and i found out it wasn't allowed.
  -- so to circumvent, first "store" the output of each half adder in the form of signal
  -- then apply gates to the signals, to get the actual output

  -- tldr: inside port mapping, ONLY mapping is allowed
  -- any other logic, you need additional signal to accomplish

  ha2: half_adder port map(
    A => ha1_sum, B => C_IN,
    S => ha2_sum, C_O => ha2_carry
  );

  -- assigning outputs
  SUM <= ha2_sum;
  C_OUT <= ha1_carry or ha2_carry;

end architecture structural;
