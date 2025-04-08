#!/bin/bash

function install_java() {
    echo "Installing OpenJDK 11..."
    sudo apt update
    sudo apt install -y openjdk-11-jdk
    java -version
    echo "✅ Java installation completed."
}

function install_mysql() {
    echo "Installing MySQL Server..."
    sudo apt update
    sudo apt install -y mysql-server
    echo "✅ MySQL installation completed."
}

function secure_mysql() {
    echo "Running mysql_secure_installation..."
    sudo mysql_secure_installation
}

function change_mysql_root_password() {
    read -sp "Enter new MySQL root password: " rootpasswd
    echo
    sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$rootpasswd'; FLUSH PRIVILEGES;"
    echo "✅ MySQL root password updated."
}

function mysql_status() {
    sudo systemctl status mysql
}

function restart_mysql() {
    sudo systemctl restart mysql
    echo "✅ MySQL service restarted."
}

function menu() {
    clear
    echo "----------------------------"
    echo " Ubuntu Java & MySQL Setup"
    echo "----------------------------"
    echo "1. Install Java (OpenJDK 11)"
    echo "2. Install MySQL Server"
    echo "3. Run MySQL Secure Installation"
    echo "4. Change MySQL Root Password"
    echo "5. Check MySQL Status"
    echo "6. Restart MySQL"
    echo "7. Exit"
    echo "----------------------------"
}

while true; do
    menu
    read -p "Choose an option [1-7]: " opt
    case $opt in
        1) install_java ;;
        2) install_mysql ;;
        3) secure_mysql ;;
        4) change_mysql_root_password ;;
        5) mysql_status ;;
        6) restart_mysql ;;
        7) echo "Bye!"; exit 0 ;;
        *) echo "Invalid option!" ;;
    esac
    read -p "Press [Enter] to return to menu..."
done
