#!/bin/bash

# Check OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux OS detected
    if [ -x "$(command -v apt)" ]; then
        # Ubuntu detected, install required packages using apt
        sudo apt install -y date tar
    else
        echo "Unsupported Linux distribution. Please install required packages manually."
        exit 1
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS detected, install required packages using brew
    if [ -x "$(command -v brew)" ]; then
        brew install dateutils gnu-tar
    else
        echo "Homebrew is not installed. Please install Homebrew and try again."
        exit 1
    fi
else
    echo "Unsupported operating system."
    exit 1
fi

