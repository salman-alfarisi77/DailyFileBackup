# Backup Script

This repository contains a production-grade shell script `backup.sh` designed to automatically back up encrypted password files that have been updated within the past 24 hours. This script addresses the needs of ABC International Inc. by automating the daily backup process, reducing human error, enhancing security, and saving valuable time.

## Features

- Validates input directories
- Logs actions with timestamps
- Backs up files modified in the last 24 hours
- Creates compressed tarball of updated files with a detailed, informative name
- Moves the backup tarball to a specified destination directory
- Designed for use in automated environments such as cron jobs

## Prerequisites

- Ensure you have the necessary permissions to read the target directory and write to the destination directory.
- Make sure `tar` and `date` utilities are available on your system.

## Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/your-username/backup-script.git
    cd backup-script
    ```

2. Make the script executable:

    ```sh
    chmod +x backup.sh
    ```

## Usage

Run the script with the target and destination directories as arguments:

```sh
./backup.sh /path/to/target_directory /path/to/destination_directory
