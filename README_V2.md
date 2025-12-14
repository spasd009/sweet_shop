# 🍬 Sweet Shop Management System - Version 2

This is a **separate instance** of the Sweet Shop application configured with a **different database**.

## 🔑 Key Differences from Original Project

### Database Configuration
- **Database Name:** `sweetshop_v2` (instead of `sweetshop`)
- **Port:** `8082` (instead of `8081`)
- **MySQL Container:** `sweetshop-v2-mysql` (if using Docker)
- **MySQL Port (Docker):** `3308` (instead of `3307`)

### Application Configuration
- **Application Name:** `sweet-shop-v2`
- **Backend Port:** `8082`
- **Frontend Port:** `3000` (same as original)
- **API Base URL:** `http://localhost:8082/api`

## 🚀 Quick Start

### Prerequisites
- Java 17+
- Maven 3.6+
- Node.js 18+
- MySQL 8.0+ (or use Docker)

### Option 1: Run with MySQL (Recommended)

1. **Start MySQL** (if not already running):
   ```powershell
   # Check if MySQL is running
   Test-NetConnection -ComputerName localhost -Port 3306
   ```

2. **Set MySQL credentials** (if different from defaults):
   ```powershell
   $env:DB_USERNAME="root"
   $env:DB_PASSWORD="root"  # Change if your MySQL password is different
   ```

3. **Start Backend:**
   ```powershell
   cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
   mvn spring-boot:run
   ```
   Backend will start on **http://localhost:8082**

4. **Start Frontend** (in a new terminal):
   ```powershell
   cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2\frontend
   npm install  # First time only
   npm run dev
   ```
   Frontend will start on **http://localhost:3000**

### Option 2: Run with Docker

1. **Start MySQL container:**
   ```powershell
   cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
   docker-compose up -d mysql
   ```

2. **Update application-mysql.properties** to use port `3308`:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3308/sweetshop_v2?createDatabaseIfNotExist=true&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
   ```

3. **Start the application** (same as Option 1, steps 3-4)

## 📊 Database Details

### MySQL Configuration
- **Database:** `sweetshop_v2`
- **Username:** `root` (default, configurable)
- **Password:** `root` (default, configurable)
- **Port:** `3306` (or `3308` for Docker)
- **Auto-create:** Enabled (database created automatically)

### Connection String
```
jdbc:mysql://localhost:3306/sweetshop_v2?createDatabaseIfNotExist=true&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
```

## 🔧 Configuration Files

All configuration files have been updated:
- `src/main/resources/application-mysql.properties` - Database: `sweetshop_v2`, Port: `8082`
- `src/main/resources/application.properties` - Port: `8082`
- `src/main/resources/application-h2.properties` - Database: `sweetshop_v2`, Port: `8082`
- `frontend/vite.config.js` - Proxy target: `http://localhost:8082`
- `docker-compose.yml` - Database: `sweetshop_v2`, Container: `sweetshop-v2-mysql`

## 🌐 Application URLs

- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:8082/api
- **Health Check:** http://localhost:8082/api/auth/ping
- **H2 Console (if using H2):** http://localhost:8082/h2-console

## 🔄 Running Both Projects Simultaneously

You can run both the original project and this v2 project at the same time:

| Project | Database | Backend Port | Frontend Port |
|---------|----------|--------------|---------------|
| Original | `sweetshop` | `8081` | `3000` |
| **V2** | **`sweetshop_v2`** | **`8082`** | **`3000`** |

**Note:** If running both frontends, change the frontend port in `vite.config.js` for one of them.

## 📝 Testing

Test the backend:
```powershell
# Health check
Invoke-WebRequest -Uri "http://localhost:8082/api/auth/ping" -UseBasicParsing

# Or use the test script
.\test-backend.ps1
```

## 🗄️ Database Management

### Create Database Manually (Optional)
```sql
CREATE DATABASE IF NOT EXISTS sweetshop_v2;
```

### View Data
```sql
USE sweetshop_v2;
SHOW TABLES;
SELECT * FROM user;
SELECT * FROM sweet;
```

## 🐛 Troubleshooting

### Port 8082 Already in Use
```powershell
# Find process using port 8082
netstat -ano | findstr :8082

# Kill the process (replace PID with actual process ID)
Stop-Process -Id <PID> -Force
```

### MySQL Connection Failed
- Verify MySQL is running: `Test-NetConnection -ComputerName localhost -Port 3306`
- Check credentials in `application-mysql.properties`
- Ensure database `sweetshop_v2` exists or auto-create is enabled

### Frontend Can't Connect to Backend
- Verify backend is running on port `8082`
- Check `frontend/vite.config.js` proxy target is `http://localhost:8082`

## 📚 Additional Resources

- See `MYSQL_QUICK_SETUP.md` for MySQL installation guide
- See `README.md` for full project documentation
- See `TROUBLESHOOTING.md` for common issues

## ✨ Features

Same as the original project:
- ✅ User Registration & Login with JWT
- ✅ Sweet CRUD Operations
- ✅ Advanced Search
- ✅ Inventory Management
- ✅ Role-based Access Control
- ✅ Modern React Frontend

**The only difference is the database name and port!**

---

**Happy Coding! 🍬**

