# Ubuntu Java & MySQL Setup Script

This is an interactive **Bash script** for Ubuntu that simplifies the installation and configuration of **Java (OpenJDK 11)** and **MySQL Server**. It provides a clean menu interface to choose from multiple operations, such as secure MySQL setup and service control.

---

## 📋 Features

- ☕ Install Java (OpenJDK 11)
- 🐬 Install MySQL Server
- 🔐 Run `mysql_secure_installation`
- 🔑 Change MySQL root password
- 📊 Check MySQL service status
- 🔁 Restart MySQL service
- ❌ Exit the script

---

## 🚀 How to Use

### 1. Clone or Download the Script

```bash
git clone https://github.com/yourusername/java-mysql-installer.git
cd java-mysql-installer
```

> Or simply copy the `installer.sh` file to your Ubuntu system.

---

### 2. Make the Script Executable

```bash
chmod +x installer.sh
```

---

### 3. Run the Script

```bash
./installer.sh
```

You will be presented with a menu like this:

```
----------------------------
 Ubuntu Java & MySQL Setup
----------------------------
1. Install Java (OpenJDK 11)
2. Install MySQL Server
3. Run MySQL Secure Installation
4. Change MySQL Root Password
5. Check MySQL Status
6. Restart MySQL
7. Exit
----------------------------
```

Simply type the number of the action you want to perform.

---

## 📎 Requirements

- Ubuntu 18.04 or later
- sudo privileges
- Internet connection (for downloading packages)

---

## 📁 Files

- `installer.sh` — Main Bash script
- `README.md` — This file

---

## 📌 Notes

- The script does **not** store any password. It runs in interactive mode for security.
- You can modify or extend the script for things like:
  - Creating a database or user
  - Installing a specific version of MySQL
  - Adding firewall rules (e.g., `ufw allow mysql`)

---

## 🛠️ License

MIT License — feel free to use and modify this script for personal or commercial use.

---

## 🙋‍♂️ Author

Made with ❤️ by 6a6ak
