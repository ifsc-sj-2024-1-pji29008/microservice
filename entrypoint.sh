#!/bin/sh

# Check if directory /sys/bus/w1/devices exists
if [ -d /sys/bus/w1/devices ]; then
  # Start the application directly
  python /app/run.py
else
  echo -e "\nWARNING: /sys/bus/w1/devices does not exist. Running in simulation mode.\n"

  # Simulating W1 buses in background
  rm -rf /tmp/sys
  /app/w1_simulator -b 24 -s *:1,4:0,8:0,17:0,21:0 -p /tmp &

  # Start the application
  export W1_BUS_DIR=/tmp/sys/bus/w1/devices
  python /app/run.py
fi
