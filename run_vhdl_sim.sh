#!/bin/bash

current_dir=$(basename "$PWD")
entity_name="$current_dir"

main_file="${entity_name}.vhd"
tb_file="${entity_name}_tb.vhd"

if [ ! -f "$main_file" ]; then
  echo "Error: $main_file not found in current directory"
  echo "Current directory: $PWD"
  echo "Make sure you're in a VHDL project directory or specify correct entity name"
  exit 1
fi

if [ ! -f "$tb_file" ]; then
  echo "Error: $tb_file not found in current directory"
  exit 1
fi

echo "[1] Analyzing VHDL files..."

if ! ghdl -a "$main_file"; then
  echo "[1] ghdl -a $main_file"
  echo "[1] Failed to analyze $main_file"
  exit 1
fi

if ! ghdl -a "$tb_file"; then
  echo "[1] ghdl -a $tb_file"
  echo "[1] Failed to analyze $tb_file"
  exit 1
fi

echo "[2] Elaborating testbench..."
tb_entity="${entity_name}_tb"
if ! ghdl -e "$tb_entity"; then
  echo "[2] ghdl -e $tb_entity"
  echo "[2] Failed to elaborate $tb_entity"
  exit 1
fi

echo "[3] Running simulation..."
vcd_file="${entity_name}.vcd"
if ! ghdl -r "$tb_entity" --vcd="$vcd_file" --stop-time=150ns; then
  echo "[3] ghdl -r $tb_entity --stop-time=150ns"
  echo "[3] Simulation failed"
  exit 1
fi

echo "✔ Simulation completed successfully!"
echo "VCD file generated: $vcd_file"

read -p "View waveform with GTKWave? (y/n): " view_wave
if [[ $view_wave == "y" || $view_wave == "Y" ]]; then
  if command -v gtkwave &>/dev/null; then
    echo "[4] Launching GTKWave..."
    gtkwave "$vcd_file" &
  else
    echo "GTKWave not found. Install it to view waveforms."
  fi
fi
