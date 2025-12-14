# How to Update Screenshots with Different Username

## Overview
The screenshots in the `screenshots/` folder are image files that show "shubham" as the username. To update them, you need to take new screenshots with a different username.

## Quick Steps

### Option 1: Use the Helper Script (Recommended)

1. **Start the backend:**
   ```powershell
   cd sweet-shop-v2
   .\start-v2.ps1
   ```

2. **In a new terminal, create a test user:**
   ```powershell
   cd sweet-shop-v2
   .\create-test-user.ps1
   ```
   This creates a user with username: `admin` and password: `admin123`

3. **Start the frontend:**
   ```powershell
   cd sweet-shop-v2\frontend
   npm run dev
   ```

4. **Take new screenshots:**
   - Open http://localhost:3000
   - Login with: `admin` / `admin123`
   - Navigate to each page (Dashboard, Admin Panel)
   - Take screenshots using:
     - Windows: `Win + Shift + S` (Snipping Tool)
     - Or: `Alt + Print Screen` (captures active window)
   - Save them with the same names in the `screenshots/` folder

### Option 2: Manual Registration

1. **Start both backend and frontend**

2. **Register a new user:**
   - Go to http://localhost:3000
   - Click "Register here"
   - Enter:
     - Username: `admin` (or any name you prefer)
     - Password: `admin123`
     - Role: `ADMIN` (for admin panel screenshots) or `USER` (for dashboard screenshots)

3. **Login and take screenshots**

## Screenshot Files to Update

Based on the screenshots folder, you may need to update:
- `dashboard.png` - Shows "Welcome, [username]"
- `admin.png` - Shows "Welcome, [username] (Admin)"
- `login.png` - Login page (no username shown)
- `Screenshot 2025-12-14 145820.png` - May contain username
- `Screenshot 2025-12-14 145846.png` - May contain username
- `Screenshot 2025-12-14 145913.png` - May contain username

## Recommended Username

Instead of "shubham", you can use:
- `admin` (for admin screenshots)
- `user` (for regular user screenshots)
- `demo` (generic demo user)
- Or any other name you prefer

## Quick API Registration (Alternative)

You can also register a user via API:

```powershell
# Register admin user
$body = @{
    username = "admin"
    password = "admin123"
    role = "ADMIN"
} | ConvertTo-Json

Invoke-WebRequest -Uri "http://localhost:8082/api/auth/register" -Method POST -Body $body -ContentType "application/json"
```

## After Taking Screenshots

1. Replace the old screenshot files in `screenshots/` folder
2. Keep the same file names if they're referenced in documentation
3. Or update documentation to reference new screenshot names

## Notes

- Screenshots are PNG image files and cannot be edited directly
- You must take new screenshots with the desired username
- Make sure the application is running before taking screenshots
- Use a consistent username across all screenshots for better documentation

