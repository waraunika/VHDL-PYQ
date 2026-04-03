-- bpa_4bit.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bpa_4bit is
  port (
    A, B : in std_logic_vector(3 downto 0);
    C_IN : in std_logic;
    SUM : out std_logic_vector(3 downto 0);
    C_OUT : out std_logic
  );
end entity bpa_4bit;

architecture structural of bpa_4bit is
  -- component declaration
  component full_adder is
    port(
      A, B, C_IN : in std_logic;
      SUM : out std_logic;
      C_OUT : out std_logic
    );
  end component;

  -- internal carry signals
  signal carry : std_logic_vector(4 downto 0);

begin
  -- architecture body
  carry(0) <= C_IN;

  -- instantiate 4 full adders
  fa0: full_adder port map(
    A => A(0), B => B(0), C_IN => carry(0),
    SUM => SUM(0), C_OUT => carry(1)
  );

  fa1: full_adder port map(
    A => A(1), B => B(1), C_IN => carry(1),
    SUM => SUM(1), C_OUT => carry(2)
  );

  fa2: full_adder port map(
    A => A(2), B => B(2), C_IN => carry(2),
    SUM => SUM(2), C_OUT => carry(3)
  );

  fa3: full_adder port map(
    A => A(3), B => B(3), C_IN => carry(3),
    SUM => SUM(3), C_OUT => carry(4)
  );

  C_OUT <= carry(4);

end structural;
