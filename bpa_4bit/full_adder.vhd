-- full_adder.vhd

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  port(
    A, B, C_IN : in std_logic;
    SUM : out std_logic;
    C_OUT: out std_logic
  );
end full_adder;

-- dataflow style architecture
architecture dataflow of full_adder is
begin
  SUM <= A xor B xor C_IN;
  C_OUT <= (A and B) or (B and C_IN) or (A and C_IN);
end dataflow;
