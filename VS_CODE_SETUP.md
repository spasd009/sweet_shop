# Running in Visual Studio Code

## Quick Start

### Option 1: Use Launch Configurations (Recommended)

1. **Open the project in VS Code:**
   ```powershell
   cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
   code .
   ```

2. **Go to Run and Debug (F5 or Ctrl+Shift+D)**

3. **Select one of these configurations:**
   - **"Full Stack - Backend + Frontend"** - Runs both servers at once (Recommended!)
   - **"Spring Boot - Backend (Port 8082)"** - Just the backend
   - **"Frontend - React Dev Server"** - Just the frontend

4. **Press F5 or click the green play button**

### Option 2: Use Tasks

1. **Open Command Palette (Ctrl+Shift+P)**

2. **Run Tasks:**
   - Type: `Tasks: Run Task`
   - Select:
     - `Start Backend (Terminal)` - Starts backend in a terminal
     - `Start Frontend (Terminal)` - Starts frontend in a terminal
     - Or run both in separate terminals

### Option 3: Use Integrated Terminal

1. **Open Terminal (Ctrl+`)**

2. **Start Backend:**
   ```powershell
   $env:DB_USERNAME="root"
   $env:DB_PASSWORD="root"
   mvn spring-boot:run
   ```

3. **Open New Terminal (Ctrl+Shift+`) for Frontend:**
   ```powershell
   cd frontend
   npm run dev
   ```

## Launch Configurations Available

### Backend Configurations
- **Spring Boot - Backend (Port 8082)**
  - Runs on port 8082
  - Uses MySQL database: `sweetshop_v2`
  - Environment variables: `DB_USERNAME=root`, `DB_PASSWORD=root`

- **Spring Boot - Backend (Debug Mode)**
  - Same as above but with debugger attached
  - Debug port: 5005

### Frontend Configurations
- **Frontend - React Dev Server**
  - Runs on port 3000
  - Hot reload enabled
  - Proxies API calls to http://localhost:8082

- **Frontend - Debug Mode**
  - Same as above with debugging enabled

### Compound Configuration
- **Full Stack - Backend + Frontend**
  - Runs both backend and frontend simultaneously
  - Best for full-stack development

## Debugging

### Debug Backend (Java/Spring Boot)
1. Set breakpoints in Java files
2. Select "Spring Boot - Backend (Debug Mode)"
3. Press F5
4. Execution will pause at breakpoints

### Debug Frontend (React)
1. Install Chrome Debugger extension (if needed)
2. Set breakpoints in JavaScript/JSX files
3. Select "Frontend - Debug Mode"
4. Press F5
5. Open Chrome DevTools (F12) for debugging

## Recommended VS Code Extensions

The project includes `.vscode/extensions.json` with recommended extensions:
- **Java Extension Pack** - For Java development
- **Spring Boot Dashboard** - Spring Boot tools
- **ESLint** - JavaScript linting
- **Prettier** - Code formatting

Install them by:
1. Open Command Palette (Ctrl+Shift+P)
2. Type: `Extensions: Show Recommended Extensions`
3. Click "Install All"

## Tasks Available

Run tasks via Command Palette (Ctrl+Shift+P) → `Tasks: Run Task`:

- **Maven: Clean Install** - Clean and build the project
- **Maven: Spring Boot Run** - Run Spring Boot application
- **Frontend: Install Dependencies** - Install npm packages
- **Frontend: Start Dev Server** - Start React dev server
- **Start Backend (Terminal)** - Start backend in dedicated terminal
- **Start Frontend (Terminal)** - Start frontend in dedicated terminal

## Project Structure in VS Code

```
sweet-shop-v2/
├── .vscode/              # VS Code configurations
│   ├── launch.json       # Debug/Launch configurations
│   ├── tasks.json        # Build tasks
│   ├── settings.json     # Workspace settings
│   └── extensions.json   # Recommended extensions
├── src/                  # Backend Java source
├── frontend/             # Frontend React source
└── pom.xml               # Maven configuration
```

## Tips

1. **Use the Compound Launch** - "Full Stack - Backend + Frontend" runs everything with one click
2. **Terminal Integration** - Use VS Code's integrated terminal for running commands
3. **Debug Console** - Use the Debug Console to evaluate expressions while debugging
4. **Breakpoints** - Click in the gutter (left of line numbers) to set breakpoints
5. **Watch Variables** - Add variables to the Watch panel while debugging

## Troubleshooting

### Backend won't start
- Check if port 8082 is available
- Verify MySQL is running (or app will use H2 fallback)
- Check the Problems panel for compilation errors

### Frontend won't start
- Run `npm install` in the frontend directory first
- Check if port 3000 is available
- Verify Node.js is installed

### Can't debug
- Make sure Java Extension Pack is installed
- Check that breakpoints are set correctly (red dot in gutter)
- Verify the launch configuration matches your setup

## Quick Reference

| Action | Shortcut |
|--------|----------|
| Run/Debug | F5 |
| Stop | Shift+F5 |
| Restart | Ctrl+Shift+F5 |
| Open Terminal | Ctrl+` |
| New Terminal | Ctrl+Shift+` |
| Command Palette | Ctrl+Shift+P |
| Run Task | Ctrl+Shift+P → "Tasks: Run Task" |

---

**Happy Coding in VS Code! 🚀**

