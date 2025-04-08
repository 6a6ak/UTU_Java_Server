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

function create_or_reset_mysql_user() {
    read -p "Enter MySQL admin username (e.g., root): " admin_user
    read -s -p "Enter password for '$admin_user': " admin_pass
    echo
    read -p "Enter the new MySQL username to create or reset: " mysql_user
    read -s -p "Enter the password for user '$mysql_user': " mysql_pass
    echo

    sql_query="
    CREATE USER IF NOT EXISTS '$mysql_user'@'localhost' IDENTIFIED BY '$mysql_pass';
    ALTER USER '$mysql_user'@'localhost' IDENTIFIED WITH mysql_native_password BY '$mysql_pass';
    GRANT ALL PRIVILEGES ON *.* TO '$mysql_user'@'localhost' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
    "

    echo "Applying changes in MySQL..."
    mysql -u "$admin_user" -p"$admin_pass" -e "$sql_query"
    if [ $? -eq 0 ]; then
        echo "✅ MySQL user '$mysql_user' created or updated successfully."
    else
        echo "❌ Failed to create or update user. Please check credentials."
    fi
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
    echo "7. Create or Reset a MySQL User"
    echo "8. Exit"
    echo "----------------------------"
}

while true; do
    menu
    read -p "Choose an option [1-8]: " opt
    case $opt in
        1) install_java ;;
        2) install_mysql ;;
        3) secure_mysql ;;
        4) change_mysql_root_password ;;
        5) mysql_status ;;
        6) restart_mysql ;;
        7) create_or_reset_mysql_user ;; # Swapped with option 8
        8) echo "Bye!"; exit 0 ;;         # Swapped with option 7
        *) echo "Invalid option!" ;;
    esac
    read -p "Press [Enter] to return to menu..."
done