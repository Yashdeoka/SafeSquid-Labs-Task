# Linux Server All_Security_Check_Script.sh

This script is designed to perform various security checks on a Linux server. It checks file permissions, service statuses, firewall rules, SSH configurations, security updates, and logs for suspicious activities.

## Features

- **File Permissions Check**: Identifies files with `777` permissions, which could pose a security risk.
- **Service Status Check**: Verifies if essential services like `ssh`, `ufw`, and `nginx` are running.
- **Firewall Rules Check**: Reviews the current firewall rules using `ufw`.
- **SSH Configuration Check**: Examines critical SSH configurations (`PermitRootLogin` and `PasswordAuthentication`).
- **Security Updates Check**: Checks for available security updates on the server.
- **Log Check**: Scans the `/var/log/auth.log` file for any failed login attempts or suspicious activities.

## Usage

1. Clone the repository or copy the script to your local machine.
2. Make the script executable:
    bash
    chmod +x security_audit.sh
    
3. Run the script with root privileges to perform all checks:
    bash
    sudo ./all_security_check.sh
    

## Output

The script outputs the results of each check directly to the console, providing an overview of potential security issues.

## Notes

- Ensure you have the necessary permissions to run the script, as some checks require root access.
- The script is designed for simplicity and ease of use, making it suitable for basic security audits.




# System Monitor Dashboard Script

This script provides a simple yet effective way to monitor various system resources, such as CPU usage, memory usage, disk usage, and system load. It can display this information either as a live updating dashboard or via individual command-line switches for targeted monitoring.

## Features

- **CPU Usage**: Displays the current CPU usage percentage.
- **Memory Usage**: Shows the used and total memory, along with the percentage of memory in use.
- **Disk Usage**: Lists disk usage for each mounted filesystem.
- **System Load**: Reports the system load averages for the past 1, 5, and 15 minutes.
- **Live Dashboard**: Continuously updates and displays all the above metrics in a clear dashboard format.

## Usage

1. Clone the repository or copy the script to your local machine.
2. Make the script executable:
    ```bash
    chmod +x monitor_dashboard.sh
    ```
3. Run the script with the desired options:

### Command-Line Options

- **`-c`**: Display CPU usage.
- **`-m`**: Display memory usage.
- **`-d`**: Display disk usage.
- **`-s`**: Display system load.
- **`-l`**: Display a live updating dashboard that refreshes every 5 seconds.

### Examples

    ```bash
    ./live_dashboard.sh 


### Default Behavior

If no command-line options are provided, the script will run the live dashboard mode by default, refreshing every 5 seconds.

## Notes

- Ensure the script is run with appropriate permissions to access system resources.
- This script is designed to work on Unix-based systems (Linux, macOS).




