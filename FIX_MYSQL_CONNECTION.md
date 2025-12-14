# Fix: MySQL Connection Error

## Error Message
```
Communications link failure
Connection refused: getsockopt
```

This means **MySQL is not running** on your system.

## ✅ Quick Fix: Use H2 Database (No Setup Needed!)

The easiest solution is to use H2 in-memory database instead of MySQL.

### Option 1: Run with H2 Profile (Recommended)

```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
.\mvnw.cmd spring-boot:run -Dspring-boot.run.profiles=h2
```

### Option 2: Use the Script

```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
.\run-with-h2.ps1
```

### Option 3: Change Default Profile

The `application.properties` has been updated to use H2 by default. Just run:

```powershell
.\mvnw.cmd spring-boot:run
```

## H2 Database Features

✅ **No installation needed** - Works immediately
✅ **No configuration needed** - Zero setup
✅ **In-memory database** - Fast and lightweight
✅ **Perfect for development** - Great for testing

**Note:** H2 is in-memory, so data is lost when the application stops. For production, use MySQL.

## Access H2 Console (Optional)

Once the application is running, you can access the H2 console at:
- **URL:** http://localhost:8082/h2-console
- **JDBC URL:** `jdbc:h2:mem:sweetshop_v2`
- **Username:** `sa`
- **Password:** (leave empty)

## Switch Back to MySQL (When Ready)

### Step 1: Install and Start MySQL

1. **Download MySQL:** https://dev.mysql.com/downloads/installer/
2. **Install MySQL** and set root password
3. **Start MySQL Service:**
   - Press `Win + R`, type `services.msc`
   - Find "MySQL80" or "MySQL"
   - Right-click → Start

### Step 2: Update Configuration

Edit `src/main/resources/application.properties`:
```properties
spring.profiles.active=mysql
```

### Step 3: Set MySQL Credentials

```powershell
$env:DB_USERNAME="root"
$env:DB_PASSWORD="your_mysql_password"
```

### Step 4: Run

```powershell
.\mvnw.cmd spring-boot:run
```

## Current Configuration

The application is now configured to use **H2 by default** in `application.properties`:
```properties
spring.profiles.active=h2
```

To use MySQL, change it to:
```properties
spring.profiles.active=mysql
```

## Summary

| Database | Setup Required | Data Persistence | Best For |
|----------|---------------|------------------|----------|
| **H2** | ❌ None | ❌ Lost on restart | Development, Testing |
| **MySQL** | ✅ Install & Start | ✅ Permanent | Production |

---

**Quick Start (H2 - No MySQL needed):**
```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
.\mvnw.cmd spring-boot:run
```

The application will now start successfully with H2 database! 🎉

