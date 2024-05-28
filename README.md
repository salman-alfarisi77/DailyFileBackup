# Backup Script

This repository contains a shell script `backup.sh` designed to automatically back any files and folder that have been updated within the past 24 hours. This script addresses the needs by automating the daily backup process, reducing human error, enhancing security, and saving valuable time.

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
```

## Setting Up a Cron Job

To automate the script to run daily, add a cron job:

1. Open the crontab file:

```
crontab -e
```

2. Add the following line to schedule the script to run every day at 2 AM (adjust the time as needed):
```
0 2 * * * /path/to/backup.sh /path/to/target_directory /path/to/destination_directory >> /path/to/backup.log 2>&1
```

Replace /path/to/backup.sh, /path/to/target_directory, /path/to/destination_directory, and /path/to/backup.log with the actual paths on your system.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing

1. Fork the repository
2. Create your feature branch (git checkout -b feature/fooBar)
3. Commit your changes (git commit -am 'Add some fooBar')
4. Push to the branch (git push origin feature/fooBar)
5. Create a new Pull Request



