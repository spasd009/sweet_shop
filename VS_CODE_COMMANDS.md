# VS Code Commands - Quick Reference

## 🚀 Quick Start Commands

### Open Project in VS Code
```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
code .
```

## 📋 Terminal Commands (VS Code Integrated Terminal)

### Option 1: Run Both Servers (Recommended)

**Terminal 1 - Backend:**
```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
$env:DB_USERNAME="root"
$env:DB_PASSWORD="root"
mvn spring-boot:run
```

**Terminal 2 - Frontend:**
```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2\frontend
npm run dev
```

### Option 2: Using Scripts

**Backend:**
```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
.\start-v2.ps1
```

**Frontend:**
```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2\frontend
npm run dev
```

## 🎯 VS Code Command Palette (Ctrl+Shift+P)

### Run Tasks
1. Press `Ctrl+Shift+P`
2. Type: `Tasks: Run Task`
3. Select:
   - `Start Backend (Terminal)` - Starts backend
   - `Start Frontend (Terminal)` - Starts frontend
   - `Maven: Spring Boot Run` - Run Spring Boot
   - `Frontend: Start Dev Server` - Start React

### Debug/Run Configurations
1. Press `F5` or `Ctrl+Shift+D`
2. Select from dropdown:
   - `Full Stack - Backend + Frontend` ⭐ (Best option!)
   - `Spring Boot - Backend (Port 8082)`
   - `Frontend - React Dev Server`
3. Press `F5` to start

## 🔧 Build Commands

### Maven Commands
```powershell
# Clean and build
mvn clean install

# Run Spring Boot
mvn spring-boot:run

# Run with MySQL profile
mvn spring-boot:run -Dspring-boot.run.profiles=mysql

# Package JAR
mvn clean package
```

### Frontend Commands
```powershell
cd frontend

# Install dependencies (first time)
npm install

# Start dev server
npm run dev

# Build for production
npm run build
```

## 🗄️ Database Commands

### Create Test User
```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
.\create-test-user.ps1
```

### Test Backend API
```powershell
# Health check
Invoke-WebRequest -Uri "http://localhost:8082/api/auth/ping" -UseBasicParsing

# Register user
$body = @{
    username = "admin"
    password = "admin123"
    role = "ADMIN"
} | ConvertTo-Json

Invoke-WebRequest -Uri "http://localhost:8082/api/auth/register" -Method POST -Body $body -ContentType "application/json"
```

## 📝 VS Code Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Run/Debug | `F5` |
| Stop Debugging | `Shift+F5` |
| Restart Debugging | `Ctrl+Shift+F5` |
| Open Terminal | `Ctrl+`` |
| New Terminal | `Ctrl+Shift+`` |
| Command Palette | `Ctrl+Shift+P` |
| Run Task | `Ctrl+Shift+P` → `Tasks: Run Task` |
| Toggle Terminal | `Ctrl+`` |

## 🎬 Step-by-Step: Run in VS Code

### Method 1: Using Launch Configuration (Easiest)

1. **Open VS Code:**
   ```powershell
   cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
   code .
   ```

2. **Go to Run and Debug:**
   - Press `F5` OR
   - Click the "Run and Debug" icon in sidebar OR
   - Press `Ctrl+Shift+D`

3. **Select Configuration:**
   - Choose `Full Stack - Backend + Frontend` from dropdown

4. **Start:**
   - Press `F5` or click the green play button

5. **Access Application:**
   - Frontend: http://localhost:3000
   - Backend: http://localhost:8082/api

### Method 2: Using Integrated Terminal

1. **Open Terminal:**
   - Press `Ctrl+`` (backtick)

2. **Start Backend:**
   ```powershell
   cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
   $env:DB_USERNAME="root"
   $env:DB_PASSWORD="root"
   mvn spring-boot:run
   ```

3. **Open New Terminal:**
   - Press `Ctrl+Shift+`` (new terminal)

4. **Start Frontend:**
   ```powershell
   cd frontend
   npm run dev
   ```

### Method 3: Using Tasks

1. **Open Command Palette:**
   - Press `Ctrl+Shift+P`

2. **Run Task:**
   - Type: `Tasks: Run Task`
   - Select: `Start Backend (Terminal)`

3. **Run Another Task:**
   - Press `Ctrl+Shift+P` again
   - Type: `Tasks: Run Task`
   - Select: `Start Frontend (Terminal)`

## 🐛 Debugging Commands

### Debug Backend (Java)
1. Set breakpoints in Java files (click left of line number)
2. Press `F5`
3. Select: `Spring Boot - Backend (Debug Mode)`
4. Execution pauses at breakpoints

### Debug Frontend (React)
1. Set breakpoints in JS/JSX files
2. Press `F5`
3. Select: `Frontend - Debug Mode`
4. Open Chrome DevTools (F12)

## ✅ Quick Test Commands

### Check if Backend is Running
```powershell
Test-NetConnection -ComputerName localhost -Port 8082
```

### Check if Frontend is Running
```powershell
Test-NetConnection -ComputerName localhost -Port 3000
```

### Test Backend API
```powershell
Invoke-WebRequest -Uri "http://localhost:8082/api/auth/ping" -UseBasicParsing
```

## 🛑 Stop Commands

### Stop Debugging
- Press `Shift+F5`

### Stop Terminal Process
- In terminal, press `Ctrl+C`

### Stop All Tasks
- Command Palette → `Tasks: Terminate Task` → Select task

## 📚 Additional Commands

### Install VS Code Extensions
```powershell
code --install-extension vscjava.vscode-java-pack
code --install-extension vscjava.vscode-spring-boot-dashboard
code --install-extension esbenp.prettier-vscode
```

### Open Specific Files
```powershell
# Open in VS Code
code src/main/java/com/sweetshop/sweet_shop/SweetShopApplication.java
code frontend/src/App.jsx
```

---

**💡 Tip:** Use `F5` with "Full Stack - Backend + Frontend" for the easiest way to run everything!

