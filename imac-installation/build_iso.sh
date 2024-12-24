#!/bin/bash
# Change to the directory where the script is located
cd "$(dirname "$0")/src"

# Ensure Python is installed
if ! command -v python3 &> /dev/null
then
    echo "Python3 is not installed. Please install Python3 and try again."
    echo "Download Python from: https://www.python.org/downloads/"
    exit 1
fi

# Install genisoimage if not available
if ! command -v genisoimage &> /dev/null
then
    echo "genisoimage is not installed. Installing via package manager..."
    if [ -f /etc/debian_version ]; then
        sudo apt-get install genisoimage -y
        if [ $? -ne 0 ]; then
            echo "Failed to install genisoimage. Please install it manually."
            echo "Download genisoimage from: https://sourceforge.net/projects/cdrtools/"
            exit 1
        fi
    elif [ -f /etc/redhat-release ]; then
        sudo yum install genisoimage -y
        if [ $? -ne 0 ]; then
            echo "Failed to install genisoimage. Please install it manually."
            echo "Download genisoimage from: https://sourceforge.net/projects/cdrtools/"
            exit 1
        fi
    else
        echo "Unsupported Linux distribution. Please install genisoimage manually."
        echo "Download genisoimage from: https://sourceforge.net/projects/cdrtools/"
        exit 1
    fi
fi

# Run the build_iso.py script
python3 build_iso.py