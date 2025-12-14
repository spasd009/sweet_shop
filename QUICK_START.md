# Quick Start Guide

## ⚠️ Important: Correct Directory

Make sure you're in the **sweet-shop-v2** directory!

```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
```

## 🚀 Run the Application

### Step 1: Navigate to Project Directory

```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
```

### Step 2: Start Backend

```powershell
.\mvnw.cmd spring-boot:run
```

**OR use the script:**
```powershell
.\run-with-h2.ps1
```

### Step 3: Start Frontend (in a new terminal)

```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2\frontend
npm run dev
```

## 📍 Directory Structure

```
sweet-shop-main/
├── sweet-shop-main/     ← Original project
└── sweet-shop-v2/        ← NEW PROJECT (use this one!)
    ├── mvnw.cmd          ← Maven wrapper (here!)
    ├── run-with-h2.ps1   ← Script (here!)
    ├── frontend/
    └── src/
```

## ✅ Verify You're in the Right Directory

Run this to check:
```powershell
Get-Location
```

Should show:
```
C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
```

## 🔍 Check if Files Exist

```powershell
# Check if mvnw.cmd exists
Test-Path .\mvnw.cmd

# Should return: True
```

## 🎯 Complete Command Sequence

```powershell
# 1. Navigate to project
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2

# 2. Verify you're in the right place
Get-Location

# 3. Start backend
.\mvnw.cmd spring-boot:run
```

## 🐛 Common Error

**Error:** `.\mvnw.cmd : The term '.\mvnw.cmd' is not recognized`

**Solution:** You're in the wrong directory!
- Make sure you're in `sweet-shop-v2` folder
- Not in `sweet-shop-main` folder

## 📝 Quick Reference

| Command | Directory |
|---------|-----------|
| `cd sweet-shop-v2` | From `sweet-shop-main` |
| `.\mvnw.cmd spring-boot:run` | From `sweet-shop-v2` |
| `cd frontend && npm run dev` | From `sweet-shop-v2` |

---

**Remember:** Always start from the `sweet-shop-v2` directory! 🎯

