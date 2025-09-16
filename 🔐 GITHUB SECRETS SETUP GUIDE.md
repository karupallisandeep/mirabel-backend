# 🔐 GitHub Secrets Setup Guide

## 🎯 **Required Secrets for GitHub Actions**

To make GitHub Actions work, you need to add these 3 secrets to your GitHub repository:

1. **AWS_ACCESS_KEY_ID** - Your AWS access key
2. **AWS_SECRET_ACCESS_KEY** - Your AWS secret key  
3. **DATABASE_URL** - Your database connection string

---

## 📍 **Where to Add GitHub Secrets**

### **Step-by-Step Instructions:**

1. **Go to your GitHub repository** (in web browser)
2. **Click:** "Settings" tab (top of repository page)
3. **Click:** "Secrets and variables" (left sidebar)
4. **Click:** "Actions" 
5. **Click:** "New repository secret" button

---

## 🔑 **Secret Values to Add**

### **Secret 1: DATABASE_URL**
- **Name:** `DATABASE_URL`
- **Value:** `postgresql://postgres:Migration2025@dev-aurorapg17.cluster-custom-cd67qapnp4nh.us-east-1.rds.amazonaws.com:5432/marksqltemplate20?schema=app`

### **Secret 2: AWS_ACCESS_KEY_ID**
- **Name:** `AWS_ACCESS_KEY_ID`
- **Value:** `[Your AWS Access Key - see below how to find it]`

### **Secret 3: AWS_SECRET_ACCESS_KEY**
- **Name:** `AWS_SECRET_ACCESS_KEY`
- **Value:** `[Your AWS Secret Key - see below how to find it]`

---

## 🔍 **How to Find Your AWS Credentials**

### **Method 1: Check Local AWS Configuration**

**On Windows (your current setup):**
1. **Open:** Command Prompt or PowerShell
2. **Run:** `aws configure list`
3. **Or check file:** `C:\\Users\\[YourUsername]\\.aws\\credentials`

**The file should look like:**
```
[default]
aws_access_key_id = AKIA...
aws_secret_access_key = ...
```

### **Method 2: Check Serverless Framework Config**
1. **Look for:** `.aws` folder in your user directory
2. **Check:** Any serverless configuration files
3. **Ask developer:** Who set up the original deployment

### **Method 3: AWS Console (Create New)**
1. **Go to:** AWS Console → IAM → Users
2. **Find:** Your deployment user
3. **Click:** "Security credentials" tab
4. **Create:** New access key if needed

---

## ⚠️ **Important Security Notes**

### **Keep Credentials Safe:**
- ❌ **Never commit** AWS credentials to code
- ❌ **Never share** credentials in chat/email
- ✅ **Only add** to GitHub Secrets (encrypted)
- ✅ **Use IAM roles** with minimal permissions

### **GitHub Secrets are Secure:**
- ✅ **Encrypted** at rest
- ✅ **Only visible** to repository collaborators
- ✅ **Only used** in GitHub Actions
- ✅ **Never logged** in action outputs

---

## 📱 **Step-by-Step Visual Guide**

### **Adding Secrets to GitHub:**

```
1. GitHub Repository Page
   ↓
2. Click "Settings" tab
   ↓  
3. Left sidebar → "Secrets and variables"
   ↓
4. Click "Actions"
   ↓
5. Click "New repository secret"
   ↓
6. Enter Name: DATABASE_URL
   ↓
7. Enter Value: [database connection string]
   ↓
8. Click "Add secret"
   ↓
9. Repeat for AWS_ACCESS_KEY_ID
   ↓
10. Repeat for AWS_SECRET_ACCESS_KEY
```

---

## 🧪 **Testing the Setup**

### **After adding all secrets:**

1. **Go to:** Repository → Actions
2. **Click:** "Manual Deploy (CEO Dashboard)"
3. **Click:** "Run workflow"
4. **Watch:** If it runs without credential errors

### **Success indicators:**
- ✅ No "AWS credentials not found" errors
- ✅ No "DATABASE_URL not found" errors
- ✅ Deployment completes successfully

---

## 🆘 **Troubleshooting**

### **If you can't find AWS credentials:**

1. **Check with developer** who set up the original deployment
2. **Look in:** `~/.aws/credentials` file
3. **Check:** Any deployment scripts or batch files
4. **Create new:** AWS IAM user if needed

### **If deployment still fails:**

1. **Check:** Secret names are exactly correct (case-sensitive)
2. **Verify:** AWS credentials have proper permissions
3. **Test:** Database connection string works
4. **Contact:** Technical support with error messages

---

## 🔧 **Required AWS Permissions**

Your AWS user needs these permissions for deployment:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "lambda:*",
                "apigateway:*",
                "iam:*",
                "cloudformation:*",
                "s3:*",
                "logs:*"
            ],
            "Resource": "*"
        }
    ]
}
```

---

## 📋 **Checklist**

### **Before GitHub Actions will work:**

- [ ] **DATABASE_URL** secret added to GitHub
- [ ] **AWS_ACCESS_KEY_ID** secret added to GitHub  
- [ ] **AWS_SECRET_ACCESS_KEY** secret added to GitHub
- [ ] **AWS credentials** have proper permissions
- [ ] **Database** is accessible from AWS Lambda
- [ ] **Test deployment** runs successfully

---

## 🎉 **Once Setup is Complete**

**GitHub Actions will automatically:**
- ✅ **Deploy** when code is pushed to main branch
- ✅ **Use secure credentials** from GitHub Secrets
- ✅ **Send notifications** about deployment status
- ✅ **Work from anywhere** - no local setup needed

---

## 📞 **Need Help?**

### **If you're stuck:**

1. **Screenshot:** Any error messages
2. **Note:** Which step you're on
3. **Check:** With whoever set up the original AWS deployment
4. **Contact:** Technical support

### **Common issues:**
- **Wrong secret names** (case-sensitive)
- **Invalid AWS credentials** 
- **Insufficient AWS permissions**
- **Database connection issues**

---

## 🔒 **Security Best Practices**

### **Do:**
- ✅ Use GitHub Secrets for all credentials
- ✅ Rotate AWS keys periodically
- ✅ Use minimal required permissions
- ✅ Monitor AWS usage

### **Don't:**
- ❌ Put credentials in code files
- ❌ Share credentials via email/chat
- ❌ Use overly broad AWS permissions
- ❌ Leave old credentials active

---

*Once these secrets are added, your GitHub Actions will work perfectly!* 🚀