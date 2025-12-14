# Fix: "mvn is not recognized" Error

## Problem
```
mvn : The term 'mvn' is not recognized
```

This means Maven is not installed or not in your PATH.

## ✅ Solution: Use Maven Wrapper

The project includes a **Maven Wrapper** (`mvnw.cmd`) that doesn't require Maven to be installed!

### Quick Fix

**Instead of:**
```powershell
mvn spring-boot:run
```

**Use:**
```powershell
.\mvnw.cmd spring-boot:run
```

### Full Command with Environment Variables

```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
$env:DB_USERNAME="root"
$env:DB_PASSWORD="root"
.\mvnw.cmd spring-boot:run
```

### Or Use the Script

```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
.\start-backend-v2.ps1
```

## Other Maven Wrapper Commands

Replace `mvn` with `.\mvnw.cmd`:

| Original Command | Maven Wrapper Command |
|------------------|----------------------|
| `mvn clean install` | `.\mvnw.cmd clean install` |
| `mvn spring-boot:run` | `.\mvnw.cmd spring-boot:run` |
| `mvn clean package` | `.\mvnw.cmd clean package` |
| `mvn test` | `.\mvnw.cmd test` |

## Alternative: Install Maven (Optional)

If you want to use `mvn` command directly:

### Option 1: Download Maven
1. Download from: https://maven.apache.org/download.cgi
2. Extract to a folder (e.g., `C:\Program Files\Apache\maven`)
3. Add to PATH:
   - Add `C:\Program Files\Apache\maven\bin` to System PATH
   - Restart terminal

### Option 2: Use Chocolatey (if installed)
```powershell
choco install maven
```

### Option 3: Use Scoop (if installed)
```powershell
scoop install maven
```

## Verify Maven Wrapper Works

```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
.\mvnw.cmd --version
```

Should show Maven version information.

## VS Code Configuration Update

If you're using VS Code, update `.vscode/tasks.json` to use `mvnw.cmd`:

Change:
```json
"command": "mvn spring-boot:run"
```

To:
```json
"command": ".\\mvnw.cmd spring-boot:run"
```

## Summary

✅ **Use Maven Wrapper** - No installation needed!
- Use `.\mvnw.cmd` instead of `mvn`
- Works immediately
- No PATH configuration needed

❌ **Don't install Maven** (unless you want to)
- Maven Wrapper is sufficient
- Already included in the project

---

**Quick Start:**
```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
$env:DB_USERNAME="root"
$env:DB_PASSWORD="root"
.\mvnw.cmd spring-boot:run
```

