# WPA2 Cracking Project

This project demonstrates the process of cracking a WPA2-protected Wi-Fi network using common tools like aircrack-ng, airodump-ng, and airmon-ng. The methods used here are intended for educational purposes only, such as learning about wireless network security and penetration testing.
Disclaimer

Warning: Cracking Wi-Fi networks without explicit permission from the owner is illegal and unethical. This project should only be used on networks you own or have permission to test. The author takes no responsibility for any misuse of this information.
Requirements

    A wireless network interface that supports monitor mode
    Kali Linux or similar penetration testing distribution
    Tools: aircrack-ng, airodump-ng, airmon-ng
    A dictionary file, such as rockyou.txt, for the password brute-force attack

Project Overview
Steps Involved

    Put the Wireless Interface into Monitor Mode
        This step puts your wireless card into monitor mode, allowing it to listen to packets in the air and capture a WPA2 4-way handshake.
        Command: airmon-ng start wlan0

    Start airodump-ng to Capture the Handshake
        Use airodump-ng to capture the WPA2 4-way handshake from the target Access Point (AP).
        Command: airodump-ng wlan0mon

    Collect the Authentication Handshake
        This step captures the 4-way handshake necessary for cracking the WPA2 password.
        Command: airodump-ng -c 3 --bssid E8:9F:80:03:C5:E2 -w shake wlan0mon

    Crack the WPA2 Password using aircrack-ng
        Use aircrack-ng with a dictionary file to crack the WPA2 pre-shared key (PSK).
        Command: aircrack-ng -w rockyou.txt -b E8:9F:80:03:C5:E2 shake*.cap

    If No Handshake, Retry
        If no handshake is captured, you may need to repeat the handshake capture step.

    Use the Cracked Key to Access the Network
        Once the key is cracked, use it to connect to the target network.

#File Structure

    wpa2_crack.sh: A script to automate the WPA2 cracking process.
    handshake.cap: The file containing the captured WPA2 handshake.
    README.md: This documentation file.
Usage
Clone the repository:
  git clone https://github.com/your-username/WPA2-Cracking-Project.git
Navigate to the project directory:
  cd WPA2-Cracking-Project
Ensure your wireless interface supports monitor mode.
Run the commands in sequence as described in the steps above or use the provided wpa2_crack.sh script for automation.
License

This project is licensed under the MIT License. See the LICENSE file for more details.
Contributing

Contributions, issues, and feature requests are welcome! Feel free to check out the issues page.
Acknowledgments

    Aircrack-ng
    Kali Linux
