-- half adder.vhd

library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
  port(
    A, B : in std_logic;
    S, C_O: out std_logic
  );
end half_adder;

architecture dataflow of half_adder is
begin
  S <= A xor B;
  C_O <= A and B;
end dataflow;
