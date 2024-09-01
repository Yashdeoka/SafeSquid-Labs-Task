#!/bin/bash

# Function to check file permissions
check_permissions() {
    echo "Checking file permissions..."
    find / -type f -perm 777 -exec ls -l {} \;
    echo "File permissions check complete."
    echo "----------------------------------"
}

# Function to check service status
check_services() {
    echo "Checking service status..."
    services=("ssh" "ufw" "nginx")
    for service in "${services[@]}"; do
        systemctl is-active --quiet $service && echo "$service is running" || echo "$service is not running"
    done
    echo "Service status check complete."
    echo "----------------------------------"
}

# Function to check firewall rules
check_firewall() {
    echo "Checking firewall rules..."
    sudo ufw status verbose
    echo "Firewall check complete."
    echo "----------------------------------"
}

# Function to check SSH configuration
check_ssh_config() {
    echo "Checking SSH configuration..."
    grep -E "^PermitRootLogin|^PasswordAuthentication" /etc/ssh/sshd_config
    echo "SSH configuration check complete."
    echo "----------------------------------"
}

# Function to check for security updates
check_updates() {
    echo "Checking for security updates..."
    sudo apt-get update -qq && sudo apt-get upgrade -s | grep -i security
    echo "Security updates check complete."
    echo "----------------------------------"
}

# Function to check logs for suspicious activity
check_logs() {
    echo "Checking logs for suspicious activity..."
    grep -i "failed" /var/log/auth.log
    echo "Log check complete."
    echo "----------------------------------"
}

# Run all checks
check_permissions
check_services
check_firewall
check_ssh_config
check_updates
check_logs

