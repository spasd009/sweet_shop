# Quick Login Guide

## Current Status
You're on the **Login page** at http://localhost:3000

## Step 1: Wait for Backend
The backend is still starting. Wait until you see "Started SweetShopApplication" in the backend terminal.

**Check if backend is ready:**
```powershell
Invoke-WebRequest -Uri "http://localhost:8082/api/auth/ping" -UseBasicParsing
```
If it returns "OK", the backend is ready!

## Step 2: Create a User Account

### Option A: Register via Web Interface (Recommended)
1. On the login page, click **"Register here"** link at the bottom
2. Fill in the registration form:
   - **Username:** `admin` (or any name you prefer)
   - **Password:** `admin123` (or your choice)
   - **Role:** Select `ADMIN` (for admin panel access) or `USER` (regular user)
3. Click **"Register"**
4. You'll be automatically logged in

### Option B: Create User via Script
Run this PowerShell script:
```powershell
cd C:\Users\spasd\Downloads\sweet-shop-main\sweet-shop-v2
.\create-test-user.ps1
```

This creates:
- **Username:** `admin`
- **Password:** `admin123`
- **Role:** `ADMIN`

### Option C: Create User via API
```powershell
$body = @{
    username = "admin"
    password = "admin123"
    role = "ADMIN"
} | ConvertTo-Json

Invoke-WebRequest -Uri "http://localhost:8082/api/auth/register" -Method POST -Body $body -ContentType "application/json"
```

## Step 3: Login
Once you have a user account:
1. Enter your **username** in the Username field
2. Enter your **password** in the Password field
3. Click **"Login"** button

## After Login
- **Regular Users:** You'll be taken to the **Dashboard** where you can browse and purchase sweets
- **Admin Users:** You'll see the **Dashboard** with an "Admin Panel" button to manage sweets

## Troubleshooting

### "Login failed" Error
- Make sure the backend is running (check http://localhost:8082/api/auth/ping)
- Verify your username and password are correct
- Check the browser console (F12) for errors

### Backend Not Ready
- Wait 1-2 minutes for Maven to finish downloading dependencies
- Check the backend terminal for "Started SweetShopApplication" message
- If errors appear, check MySQL is running (or app will use H2 fallback)

### Can't Register
- Make sure backend is running
- Try a different username (usernames must be unique)
- Check browser console for errors

## Quick Test Credentials
After running `.\create-test-user.ps1`:
- **Username:** `admin`
- **Password:** `admin123`

## Next Steps
1. ✅ Wait for backend to start
2. ✅ Register a new user (or use test user)
3. ✅ Login with your credentials
4. ✅ Explore the Dashboard and Admin Panel!

