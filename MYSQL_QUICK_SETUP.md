# MySQL Quick Setup Guide

## Current Status
The application is configured to use MySQL with the following default credentials:
- **Username:** `root`
- **Password:** `root`
- **Database:** `sweetshop` (will be created automatically)
- **Port:** `3306`

## If MySQL is NOT Installed

### Option 1: Install MySQL (Recommended)

1. **Download MySQL Installer:**
   - Visit: https://dev.mysql.com/downloads/installer/
   - Download "MySQL Installer for Windows"

2. **Install MySQL:**
   - Run the installer
   - Choose "Developer Default" or "Server only"
   - During setup, set root password to: `root` (or remember your password)
   - Complete the installation

3. **Start MySQL Service:**
   - Press `Win + R`, type `services.msc`, press Enter
   - Find "MySQL80" or "MySQL" service
   - Right-click → Start (if not running)
   - Set Startup Type to "Automatic" (optional)

4. **Verify Installation:**
   ```powershell
   # Test connection (if MySQL is in PATH)
   mysql -u root -p
   # Enter password: root
   ```

### Option 2: Use Docker (If Docker Desktop is Installed)

```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-main
docker-compose up -d mysql
```

Note: If using Docker, update `application-mysql.properties` to use port `3307` instead of `3306`.

## If MySQL IS Installed but Password is Different

### Update Configuration

**Option A: Update application-mysql.properties**
Edit `src/main/resources/application-mysql.properties`:
```properties
spring.datasource.username=root
spring.datasource.password=YOUR_ACTUAL_PASSWORD
```

**Option B: Use Environment Variables**
```powershell
$env:DB_USERNAME="root"
$env:DB_PASSWORD="your_actual_password"
```

## Verify MySQL Connection

Test if MySQL is running and accessible:
```powershell
Test-NetConnection -ComputerName localhost -Port 3306
```

## Start the Application

Once MySQL is running:

1. **Start Backend:**
   ```powershell
   cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-main
   $env:DB_USERNAME="root"
   $env:DB_PASSWORD="root"  # Change if different
   mvn spring-boot:run
   ```

2. **Start Frontend (in a new terminal):**
   ```powershell
   cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-main\frontend
   npm run dev
   ```

3. **Access the Application:**
   - Frontend: http://localhost:5173
   - Backend API: http://localhost:8081/api

## Troubleshooting

### Error: "Access denied for user 'root'@'localhost'"
- Check your MySQL root password
- Update `application-mysql.properties` or environment variables
- Try common passwords: `root`, empty, `password`, `123456`

### Error: "Can't connect to MySQL server"
- Make sure MySQL service is running (check Services)
- Verify MySQL is listening on port 3306
- Check Windows Firewall settings

### Error: "Unknown database 'sweetshop'"
- The application should create it automatically
- If not, create manually:
  ```sql
  CREATE DATABASE sweetshop;
  ```

## Quick Test

To quickly test MySQL connection:
```powershell
# If MySQL command line is available
mysql -u root -proot -e "CREATE DATABASE IF NOT EXISTS sweetshop;"
```

## Current Configuration

The application is already configured with:
- Profile: `mysql` (set in `application.properties`)
- Auto-create database: Enabled
- Hibernate DDL: `update` (tables created automatically)

You just need MySQL running with root access!


