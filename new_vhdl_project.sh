#!/bin/bash

# script to create VHDL project with testbench template

read -p "Enter the full name of VHDL entity: " entity_name

if [ -z "$entity_name" ]; then
  echo "Error: Entity name cannot be empty"
  exit 1
fi

entity_name=$(echo "$entity_name" | sed 's/[^a-zA-Z0-9]/_/g')

mkdir -p "$entity_name"

cd "$entity_name" || exit 1

cat >"${entity_name}.vhd" <<EOF
-- ${entity_name}.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ${entity_name} is
  port (
    
  );
end entity ${entity_name};

architecture behavioral of ${entity_name} is
  -- internal signals
begin
  -- architecture body


end architecture behavioral;
EOF

# Create testbench file
cat >"${entity_name}_tb.vhd" <<EOF
-- ${entity_name}_tb.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ${entity_name}_tb is
end entity ${entity_name}_tb;

architecture sim of ${entity_name}_tb is
  -- component declaration
  component ${entity_name} is
    port (

    );
  end component;

  -- test bench signals

end architecture sim;
EOF

echo "✓ Created VHDL project: $entity_name"
echo "🗀 Directory: $(pwd)"
echo "🗎 Files: ${entity_name}.vhd and ${entity_name}_tb.vhd"

# Open the main file with editor
editor=${EDITOR:-nvim}
if command -v "$editor" &>/dev/null; then
  echo "Opening ${entity_name}.vhd with $editor..."
  $editor "${entity_name}.vhd"
else
  echo "Editor '$editor' not found. Set EDITOR environment variable or install $editor."
  echo "You can manually edit ${entity_name}.vhd"
fi

cd "$entity_name"
