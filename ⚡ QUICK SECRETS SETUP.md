# ⚡ Quick Secrets Setup

## 🎯 **3 Simple Steps to Enable GitHub Actions**

---

## 📍 **Step 1: Go to GitHub Secrets**

1. **Open:** Your GitHub repository in browser
2. **Click:** Settings tab → Secrets and variables → Actions
3. **Click:** "New repository secret"

---

## 🔑 **Step 2: Add These 3 Secrets**

### **Secret #1:**
- **Name:** `DATABASE_URL`
- **Value:** `postgresql://postgres:Migration2025@dev-aurorapg17.cluster-custom-cd67qapnp4nh.us-east-1.rds.amazonaws.com:5432/marksqltemplate20?schema=app`

### **Secret #2:**
- **Name:** `AWS_ACCESS_KEY_ID`
- **Value:** `[Find this in ~/.aws/credentials or ask developer]`

### **Secret #3:**
- **Name:** `AWS_SECRET_ACCESS_KEY`
- **Value:** `[Find this in ~/.aws/credentials or ask developer]`

---

## 🧪 **Step 3: Test It**

1. **Go to:** Actions tab
2. **Click:** "Manual Deploy (CEO Dashboard)"
3. **Click:** "Run workflow"
4. **Watch:** Should deploy successfully ✅

---

## 🔍 **Finding AWS Credentials**

### **On Windows:**
```cmd
# Check AWS configuration
aws configure list

# Or check this file:
C:\Users\[YourName]\.aws\credentials
```

### **Ask Developer:**
"What AWS credentials are used for the Mirabel backend deployment?"

---

## ✅ **You'll Know It's Working When:**

- ✅ No credential errors in GitHub Actions
- ✅ Deployment completes successfully
- ✅ API responds at the endpoint
- ✅ You get email notifications

---

## 🆘 **If Stuck:**

1. **Screenshot** any error messages
2. **Ask developer** for AWS credentials
3. **Double-check** secret names are exact
4. **Contact** technical support

---

*Just these 3 secrets and GitHub Actions will work perfectly!* 🚀