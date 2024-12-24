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

# Install Homebrew if not available
if ! command -v brew &> /dev/null
then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ $? -ne 0 ]; then
        echo "Failed to install Homebrew. Please install it manually."
        echo "Download Homebrew from: https://brew.sh/"
        exit 1
    fi
fi

# Install cdrtools if not available
if ! command -v genisoimage &> /dev/null
then
    echo "genisoimage is not installed. Installing cdrtools via Homebrew..."
    brew install cdrtools
    if [ $? -ne 0 ]; then
        echo "Failed to install cdrtools. Please install it manually."
        echo "Download cdrtools from: https://sourceforge.net/projects/cdrtools/"
        exit 1
    fi
fi

# Run the build_iso.py script
python3 build_iso.py