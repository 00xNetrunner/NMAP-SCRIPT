# nmap.sh

## ⚠️ Disclaimer ⚠️

![Educational Use](https://img.shields.io/badge/Educational-Use-blue.svg)
![Ethical Hacking](https://img.shields.io/badge/Ethical-Hacking-brightgreen.svg)

> ℹ️ **The information and tools provided in this content are strictly for educational purposes only.** As an advocate for ethical hacking, I, Netrunner, strongly urge you to use the knowledge and resources shared here responsibly and within the bounds of legal frameworks. Ethical hacking is about improving security and protecting systems, not exploiting them.

> ⚖️ **It is your responsibility to ensure that any actions you take with this knowledge comply with all applicable laws and regulations.** Unauthorized hacking into systems or networks can lead to severe legal consequences. Always seek proper authorization before attempting any penetration testing.

> 🤝 **Let's contribute to a safer cyber world together.**

# Nmap Automated Scan Script :computer:

![bash](https://img.shields.io/badge/language-Bash-blue.svg)
![nmap](https://img.shields.io/badge/tool-Nmap-blue.svg)
![security](https://img.shields.io/badge/security-EthicalHacking-brightgreen.svg)

## What is it? :mag_right:

This script automates the process of performing comprehensive network scans using `nmap`. It is designed to facilitate both TCP and UDP network scans on a list of IP addresses, generating detailed logs and reports of the network's status.

## What does it do? :gear:

The script accepts multiple IP addresses as arguments and performs the following actions for each IP:

- Executes a verbose TCP scan (`-sT`) over all TCP ports (1-65535), with additional `nmap` flags to detect service versions, operating system guesses, and runs standard scripts for banner grabbing, vulnerability detection, and exploitation where possible.
- Conducts a UDP scan (`-sU`) over a specified range of UDP ports (1-500), with verbose output, scan delay, and similar service and vulnerability scripts.
- Outputs scan results to individual timestamped files in both plain text `.txt` and XML `.xml` formats for further analysis.
- Logs the start and end of each scan, including any errors, to a consolidated log file with a unique timestamp.

## How to use it? :wrench:

To use this script, you need `nmap` installed on your system. If you don't have it, you can install it on most Linux distributions using your package manager. For example, on Ubuntu:

```bash
sudo apt-get install nmap
```

Once nmap is installed, you can run the script by passing the IP addresses as command-line arguments:
```bash
./nmapScan.sh <IP-address-1> [IP-address-2] ...
```

Ensure that the script has executable permissions:
```bash
chmod +x nmapScan.sh
```
