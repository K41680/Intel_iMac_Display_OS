# Intel iMac Display OS

## Overview
This project aims to repurpose an Intel-based iMac as an external display, allowing the use of its webcam, microphone, USB ports, built-in CD/DVD drive, and IR sensor by connecting a device via WiFi.

## Features
- Support for all Intel-based iMac models
- Minimal GUI for installation
- Network communication setup
- Live boot version

## Installation
1. Download the latest release from the [GitHub repository](https://github.com/K41680/Intel_iMac_Display_OS).
2. Run the appropriate script for your operating system to create an install ISO or a live boot ISO:
   - **Windows**: Double-click `build_iso.cmd`.
   - **macOS**: Open Terminal, navigate to the directory, and run `./build_iso.command`.
   - **Linux**: Open Terminal, navigate to the directory, and run `./build_iso.sh`.

## Usage
0. BE SURE TO ALWAYS READ EVERYTHING SHOWN IN YOUR TERMINAL IF THERE IS ANY ERROR, THIS MIGHT EXPLAIN SOME ISSUES, THE SAME GOES FOR WHEN YOU'D NEED TO INSTALL OTHER TOOLS (eg. chocolaty or python)
1. Boot the iMac from the created ISO.
2. Follow the on-screen instructions to complete the installation.

## Usage Guidelines

- Ensure that the iMacs are connected via FireWire or Thunderbolt for optimal performance.
- Follow the prompts during the installation process to install the necessary drivers.
- After installation, the iMacs will be ready to use as external displays and for accessing their built-in hardware components.

## Legal Notices
- **Intel** is a trademark of Intel Corporation or its subsidiaries in the U.S. and/or other countries.
- **iMac** and **Boot Camp** are trademarks of Apple Inc., registered in the U.S. and other countries.
- This project is not affiliated with or endorsed by Intel Corporation or Apple Inc.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
