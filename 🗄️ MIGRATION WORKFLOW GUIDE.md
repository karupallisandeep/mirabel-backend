# 🗄️ Migration Workflow Guide

## 🎯 **Database Migrations vs DB Push**

### **What Changed:**
- **Before:** Used `prisma db push` (no migration files)
- **After:** Uses `prisma migrate` (creates migration files)

### **Why This is Better:**
- ✅ **Migration history** - Track all database changes
- ✅ **Version control** - Migration files in Git
- ✅ **Rollback capability** - Can undo changes if needed
- ✅ **Team collaboration** - Everyone sees schema changes
- ✅ **Production safety** - Controlled database updates

---

## 🔄 **New Migration Workflow**

### **For Schema Changes:**

#### **Method 1: Local Development (Recommended)**
1. **Edit:** `prisma/schema.prisma`
2. **Run:** `UPDATE-DATABASE.bat`
3. **Enter:** Migration name when prompted
4. **Result:** Migration file created + deployed

#### **Method 2: GitHub Actions**
1. **Edit:** `prisma/schema.prisma` and commit
2. **Go to:** GitHub → Actions → "Create Database Migration"
3. **Click:** "Run workflow"
4. **Enter:** Migration name
5. **Result:** Migration file created + committed

---

## 📁 **Migration Files Location**

**Migrations are stored in:**
```
prisma/migrations/
├── 20250909113510_add_app_product_extras/
│   └── migration.sql
├── 20250909130600_add_product_model/
│   └── migration.sql
├── [NEW_TIMESTAMP]_[YOUR_MIGRATION_NAME]/
│   └── migration.sql
└── migration_lock.toml
```

**Each migration contains:**
- ✅ **SQL commands** to update database
- ✅ **Timestamp** for ordering
- ✅ **Descriptive name** for identification

---

## 🚀 **Deployment Process (Updated)**

### **What Happens During Deployment:**

```
[1/6] 📦 Installing dependencies
[2/6] 🔧 Fixing Prisma issues
[3/6] 📋 Generating Prisma client
[4/6] 🗄️ Deploying database migrations  ← CHANGED
[5/6] 🚀 Deploying to AWS
[6/6] 🧪 Testing deployment
```

### **Migration Deployment:**
- ✅ **Runs all pending migrations** in order
- ✅ **Skips already applied migrations**
- ✅ **Safe for production** - only applies new changes
- ✅ **Atomic operations** - all or nothing

---

## 🎮 **How to Create Migrations**

### **Scenario 1: Adding a New Table**

1. **Edit schema.prisma:**
```prisma
model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String?
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
}
```

2. **Run UPDATE-DATABASE.bat**
3. **Enter name:** `add_user_table`
4. **Result:** Migration created and deployed

### **Scenario 2: Adding a Column**

1. **Edit existing model:**
```prisma
model Product {
  id          String   @id @default(cuid())
  name        String
  price       Decimal  @db.Decimal(10,2)
  isArchived  Boolean  @default(false)  // ← NEW FIELD
  // ... other fields
}
```

2. **Run UPDATE-DATABASE.bat**
3. **Enter name:** `add_product_archived_field`
4. **Result:** Migration created and deployed

---

## ⚠️ **Important Migration Rules**

### **Do:**
- ✅ **Use descriptive names** - `add_user_table`, `remove_old_column`
- ✅ **Test locally first** - Before pushing to production
- ✅ **Backup database** - Before major changes
- ✅ **Review migration SQL** - Check generated commands

### **Don't:**
- ❌ **Edit existing migrations** - Create new ones instead
- ❌ **Delete migration files** - Breaks migration history
- ❌ **Skip migration names** - Makes tracking difficult
- ❌ **Make breaking changes** - Without data migration plan

---

## 🔄 **Migration Commands Reference**

### **Local Development:**
```bash
# Create migration (development database)
npx prisma migrate dev --name "migration_name"

# Deploy migrations (production database)
npx prisma migrate deploy

# Reset database (DANGER - deletes all data)
npx prisma migrate reset
```

### **Batch Files:**
- **UPDATE-DATABASE.bat** - Creates and deploys migration
- **DEPLOY.bat** - Deploys existing migrations only

---

## 🧪 **Testing Migrations**

### **Before Deployment:**
1. **Test locally** - Run migration on development database
2. **Check data** - Ensure no data loss
3. **Test application** - Verify everything works
4. **Review SQL** - Check generated migration commands

### **After Deployment:**
1. **Check logs** - Ensure migration succeeded
2. **Test API** - Verify endpoints work
3. **Check data** - Confirm data integrity
4. **Monitor errors** - Watch for issues

---

## 🆘 **Troubleshooting Migrations**

### **Migration Fails:**
1. **Check error message** - Usually shows SQL error
2. **Review migration SQL** - Look for conflicts
3. **Check database state** - Ensure schema is consistent
4. **Contact support** - If stuck

### **Common Issues:**
- **Constraint violations** - Adding non-null columns to existing data
- **Duplicate names** - Table/column already exists
- **Data type conflicts** - Incompatible type changes
- **Foreign key issues** - Referenced tables don't exist

---

## 📊 **Migration History**

### **View Migration Status:**
```bash
# See applied migrations
npx prisma migrate status

# View migration history
npx prisma migrate diff
```

### **In GitHub:**
- **All migrations** are version controlled
- **See changes** in pull requests
- **Track history** through commits
- **Collaborate** on schema changes

---

## 🎉 **Benefits of New System**

### **For CEO:**
- ✅ **Same simple process** - Still just click deploy
- ✅ **Better tracking** - See all database changes
- ✅ **Safer deployments** - Controlled migrations
- ✅ **Rollback capability** - Can undo if needed

### **For Developers:**
- ✅ **Version controlled** - All changes tracked
- ✅ **Team collaboration** - Share schema changes
- ✅ **Production safety** - Tested migration path
- ✅ **Professional workflow** - Industry standard

---

## 📋 **Quick Reference**

### **To Create Migration:**
- **Local:** Run `UPDATE-DATABASE.bat`
- **GitHub:** Actions → Create Database Migration

### **To Deploy:**
- **Local:** Run `DEPLOY.bat` (deploys existing migrations)
- **GitHub:** Automatic on code push

### **Migration Files:**
- **Location:** `prisma/migrations/`
- **Format:** `[timestamp]_[name]/migration.sql`
- **Tracked:** In Git repository

---

*Your database changes are now properly versioned and tracked!* 🗄️