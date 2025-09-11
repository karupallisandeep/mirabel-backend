# 🚀 Mirabel Backend - CEO Deployment Guide

## Overview
This is your GraphQL backend API that powers the Mirabel application. It's deployed on AWS Lambda and connects to your PostgreSQL database.

**Current API Endpoint:** `https://8kihckwkhf.execute-api.us-east-1.amazonaws.com/graphql`

---

## 📋 Prerequisites (One-time Setup)

Before you can deploy, make sure these are installed on your computer:

1. **Node.js** (version 18 or higher)
   - Download from: https://nodejs.org/
   - Choose the "LTS" version

2. **AWS CLI** (for deployment)
   - Download from: https://aws.amazon.com/cli/
   - You'll need AWS credentials configured

3. **Git** (for version control)
   - Download from: https://git-scm.com/

---

## 🎯 Simple Deployment Process

### 📂 WHERE TO FIND THE FILES

**Location:** `D:\Aws-GraphQL-FrontEnd-Backend\mirabel-backend\`

**In File Explorer, you'll see:**
- 🎮 `DASHBOARD.bat` ← **START HERE** (Main control panel)
- 🚀 `DEPLOY.bat` ← Direct deployment
- 🧪 `TEST-API.bat` ← Health check
- 🔧 `FIX-PRISMA.bat` ← Problem solver

### For Regular Deployments (Most Common)

**Just double-click:** `DASHBOARD.bat` (then choose option 1)

This will:
- Install all dependencies
- Deploy your backend to AWS
- Test that everything is working
- Show you the API endpoint

**Time:** 3-5 minutes

---

### If You Get Prisma Errors

**Double-click:** `FIX-PRISMA.bat`

Then try `DEPLOY.bat` again.

**When to use:** If you see errors about "Prisma" or "query_engine"

---

### To Update Database Schema

**Use Dashboard Option 4** OR **Double-click:** `UPDATE-DATABASE.bat`

**When to use:** When you or developers change the `prisma/schema.prisma` file

**What it does:**
1. Generates new database client code
2. Updates your database structure  
3. Deploys updated backend to AWS
4. Tests everything works

**⚠️ Warning:** This can affect your data - make sure you have backups!

**Time:** 5-10 minutes

---

### To Test Your API

**Double-click:** `TEST-API.bat`

**When to use:** To check if your API is working properly

---

## 📊 Understanding the Output

### ✅ Success Messages
- "Deployment completed successfully!"
- "Health: OK"
- "Products: [data]"

### ❌ Error Messages
- "ERROR: Failed to..." - Something went wrong
- "Cannot read properties of null" - Database connection issue
- "EPERM: operation not permitted" - Windows file permission issue (run FIX-PRISMA.bat)

---

## 🆘 Troubleshooting

### Problem: Deployment fails
**Solution:** 
1. Run `FIX-PRISMA.bat`
2. Try `DEPLOY.bat` again
3. If still failing, contact technical support

### Problem: API returns errors
**Solution:**
1. Run `TEST-API.bat` to check status
2. Try `DEPLOY.bat` to redeploy
3. Check if database is accessible

### Problem: "Command not found" errors
**Solution:**
1. Make sure Node.js is installed
2. Restart your computer
3. Try again

---

## 📞 Emergency Contacts

**Technical Support:** [Your technical team contact]
**AWS Account:** [AWS account details]
**Database:** [Database connection details]

---

## 📈 Monitoring Your API

### Check API Health
- Run `TEST-API.bat` anytime
- Should return "OK" status

### View Logs
- Go to AWS CloudWatch console
- Look for "mirabel-backend-dev-graphql" logs

### API Usage
- Monitor through AWS Lambda console
- Check for errors or high usage

---

## 🔒 Security Notes

1. **Never share** your `.env` files
2. **Keep AWS credentials** secure
3. **Regular backups** of your database
4. **Monitor** for unusual API usage

---

## 📝 Quick Reference

| Task | Command | When to Use |
|------|---------|-------------|
| Deploy Backend | `DEPLOY.bat` | After code changes |
| Fix Prisma Issues | `FIX-PRISMA.bat` | When getting Prisma errors |
| Update Database | `UPDATE-DATABASE.bat` | When schema changes |
| Test API | `TEST-API.bat` | To check if API works |

---

## 🎯 Success Checklist

After running `DEPLOY.bat`, you should see:
- ✅ "Deployment completed successfully!"
- ✅ Health check returns "OK"
- ✅ Products query returns data
- ✅ No error messages

**Your API is ready when all checks pass!**

---

*Last updated: [Current Date]*
*API Version: 1.0*
*Environment: Production*