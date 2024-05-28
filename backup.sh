#!/bin/bash

# Ensure the script exits on error
set -e

# Function to log messages with timestamps
log_message() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') - $1"
}

# Check if the number of arguments is correct
if [[ $# != 2 ]]; then
  log_message "Usage: backup.sh target_directory_name destination_directory_name"
  exit 1
fi

# Check if the provided arguments are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]; then
  log_message "Invalid directory path provided"
  exit 1
fi

# Define variables
targetDirectory=$1
destinationDirectory=$2
log_message "Starting backup: targetDirectory=$targetDirectory, destinationDirectory=$destinationDirectory"

currentTS=$(date +'%Y%m%d-%H%M%S')
hostname=$(hostname)
backupFileName="${hostname}-backup-${currentTS}.tar.gz"
origAbsPath=$(pwd)

# Change to destination directory to get its absolute path
cd "$destinationDirectory"
destAbsPath=$(pwd)

# Change back to the original directory
cd "$origAbsPath"
cd "$targetDirectory"

# Calculate the timestamp for 24 hours ago
yesterdayTS=$(($(date +%s) - 24 * 60 * 60))

declare -a toBackup

# Find files modified within the last 24 hours
for file in *; do
  if [[ -f $file ]]; then
    fileModTime=$(date -r "$file" +%s)
    if (( fileModTime > yesterdayTS )); then
      toBackup+=("$file")
    fi
  fi
done

# Check if there are files to backup
if [ ${#toBackup[@]} -eq 0 ]; then
  log_message "No files to backup."
  exit 0
fi

# Create the backup tarball
tar -czvf "$backupFileName" "${toBackup[@]}"
log_message "Created backup file $backupFileName"

# Move the backup file to the destination directory
mv "$backupFileName" "$destAbsPath"
log_message "Moved backup file to $destAbsPath"

log_message "Backup completed successfully."
