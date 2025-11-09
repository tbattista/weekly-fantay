# 🚀 Railway Deployment Guide - GitHub Method (Recommended)

## 🎯 Quick Start

This guide will help you deploy your Fantasy Weekly NFL Dashboard to Railway using GitHub integration - the most reliable deployment method.

## 📋 Prerequisites

- Git installed on your computer
- GitHub account (free)
- Railway account (free tier available)

## 🔧 Deployment Issue - Root Cause

**Problem**: Railway CLI (`railway up`) failed because it only uploads **git-tracked files**. Your project files weren't committed to git, so Railway only saw `README.md` and `week9_dfs_report_sneat.html`.

**Solution**: Use GitHub → Railway integration for automatic, reliable deployments.

---

## 🚀 Step-by-Step Deployment

### Step 1: Initialize Git Repository

Open your terminal in the project directory and run:

```bash
# Initialize git repository
git init

# Add all files to staging
git add .

# Commit all files
git commit -m "Initial commit: Fantasy Weekly NFL Dashboard"
```

**Expected Output:**
```
Initialized empty Git repository in .git/
[main (root-commit) abc1234] Initial commit: Fantasy Weekly NFL Dashboard
 237 files changed, 15000 insertions(+)
```

### Step 2: Create GitHub Repository

1. **Go to GitHub**: https://github.com/new
2. **Repository Settings**:
   - Name: `fantasy-weekly-dashboard` (or your preferred name)
   - Description: "NFL Fantasy Football Dashboard with DFS insights"
   - Visibility: Public or Private (your choice)
   - **DO NOT** initialize with README, .gitignore, or license (you already have these)
3. **Click**: "Create repository"

### Step 3: Push to GitHub

GitHub will show you commands. Use these:

```bash
# Add GitHub as remote origin
git remote add origin https://github.com/YOUR-USERNAME/fantasy-weekly-dashboard.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

**Replace** `YOUR-USERNAME` with your actual GitHub username.

**Expected Output:**
```
Enumerating objects: 250, done.
Counting objects: 100% (250/250), done.
Writing objects: 100% (250/250), 5.2 MiB | 2.1 MiB/s, done.
To https://github.com/YOUR-USERNAME/fantasy-weekly-dashboard.git
 * [new branch]      main -> main
```

### Step 4: Deploy to Railway

#### Option A: Railway Dashboard (Easiest)

1. **Go to Railway**: https://railway.app
2. **Sign in** with GitHub (recommended) or email
3. **Click**: "New Project"
4. **Select**: "Deploy from GitHub repo"
5. **Choose**: Your `fantasy-weekly-dashboard` repository
6. **Railway will**:
   - Automatically detect your `Dockerfile`
   - Read `railway.json` configuration
   - Start building and deploying
7. **Wait**: 2-5 minutes for deployment to complete

#### Option B: Railway CLI (Alternative)

If you prefer CLI:

```bash
# Install Railway CLI (if not installed)
npm install -g @railway/cli

# Login to Railway
railway login

# Link to your Railway project (or create new)
railway link

# Deploy from GitHub
# (Railway will use your GitHub repo automatically)
```

### Step 5: Get Your Live URL

Once deployment completes:

1. **In Railway Dashboard**:
   - Go to your project
   - Click "Settings" tab
   - Click "Generate Domain" under "Domains"
   - Your URL will be: `https://fantasy-weekly-production.up.railway.app`

2. **Or via CLI**:
   ```bash
   railway domain
   ```

### Step 6: Test Your Dashboard

Open your generated URL in a browser. You should see:
- ✅ Main dashboard with Week 10 games
- ✅ DFS Players page
- ✅ All data loading correctly
- ✅ Responsive design on mobile

---

## 🔄 Updating Your Dashboard

### Method 1: GitHub Push (Automatic Deployment)

1. **Edit your files** (e.g., update `data/week10-data.json`)
2. **Commit changes**:
   ```bash
   git add .
   git commit -m "Update Week 10 data with latest injuries"
   ```
3. **Push to GitHub**:
   ```bash
   git push
   ```
4. **Railway auto-deploys** - Changes live in ~2 minutes! 🎉

### Method 2: Railway CLI

```bash
# Make your changes, then:
git add .
git commit -m "Your update message"
git push

# Railway will automatically deploy from GitHub
```

---

## 📁 Project Structure

```
fantasy-weekly-dashboard/
├── .dockerignore          # Docker build optimization
├── .gitignore            # Git ignore rules
├── .railwayignore        # Railway CLI ignore rules
├── Dockerfile            # Docker configuration
├── railway.json          # Railway deployment config
├── index.html            # Main dashboard
├── pages/                # Additional pages
│   ├── dfs-players.html
│   ├── game-details.html
│   └── weather.html
├── assets/               # JavaScript and CSS
│   └── js/
│       ├── data-loader.js
│       ├── dashboard.js
│       └── dfs-players.js
├── data/                 # NFL game data
│   └── week10-data.json
└── sneat-bootstrap-template/  # UI framework
```

---

## 🐛 Troubleshooting

### Issue: Railway CLI Upload Failed

**Symptom**: `railway up` shows "Script start.sh not found" or only sees README.md

**Solution**: 
- ✅ Use GitHub deployment method instead (recommended)
- OR ensure all files are committed to git:
  ```bash
  git status  # Check what's not committed
  git add .   # Add all files
  git commit -m "Add missing files"
  railway up  # Try again
  ```

### Issue: Deployment Fails on Railway

**Check the logs**:
1. Go to Railway dashboard
2. Click on your project
3. Click "Deployments" tab
4. Click on the failed deployment
5. Review build logs

**Common fixes**:
- Verify `Dockerfile` syntax is correct
- Ensure all required files are in GitHub repo
- Check that `railway.json` is in root directory

### Issue: Site Loads But No Data

**Symptoms**: Dashboard shows but games/players don't load

**Solutions**:
1. **Check browser console** (F12 → Console tab)
2. **Verify JSON file**:
   ```bash
   # Test JSON validity
   cat data/week10-data.json | python -m json.tool
   ```
3. **Check file paths** in HTML are relative (not absolute)
4. **Clear browser cache** and hard reload (Ctrl+Shift+R)

### Issue: 404 Errors on Pages

**Problem**: Main page works but `/pages/dfs-players.html` gives 404

**Solution**: Nginx configuration is correct. Verify:
- Files exist in GitHub repo
- File names match exactly (case-sensitive)
- Paths in HTML links are correct

---

## 🔧 Configuration Files Explained

### Dockerfile
```dockerfile
FROM nginx:alpine          # Lightweight web server
COPY . /usr/share/nginx/html  # Copy all files
EXPOSE 80                  # Web server port
CMD ["nginx", "-g", "daemon off;"]  # Start server
```

### railway.json
```json
{
  "build": {
    "builder": "DOCKERFILE",      # Use Dockerfile
    "dockerfilePath": "Dockerfile"
  },
  "deploy": {
    "startCommand": "nginx -g 'daemon off;'",
    "restartPolicyType": "ON_FAILURE"
  }
}
```

### .dockerignore
Excludes unnecessary files from Docker build:
- Documentation files (*.md)
- IDE settings (.vscode, .idea)
- Git files (.git)
- Logs and temporary files

### .railwayignore
Excludes files from Railway CLI uploads:
- Same as .dockerignore
- Only relevant for `railway up` command

---

## 💰 Railway Pricing

### Free Tier
- **$5 credit/month** (resets monthly)
- Perfect for static sites like this dashboard
- Includes:
  - Unlimited deployments
  - Custom domains
  - SSL certificates
  - 500 GB bandwidth

### Usage Estimate
Your static dashboard should use:
- **~$0.50-$2/month** (well within free tier)
- Depends on traffic volume

### Monitoring Usage
```bash
railway status  # Check current usage
```

Or in Railway dashboard → Project → Usage tab

---

## 🎯 Custom Domain Setup

### Add Custom Domain

1. **In Railway Dashboard**:
   - Go to Settings → Domains
   - Click "Custom Domain"
   - Enter your domain: `fantasydashboard.com`

2. **Update DNS Records** (at your domain registrar):
   ```
   Type: CNAME
   Name: www (or @)
   Value: [provided by Railway]
   ```

3. **Wait for DNS propagation** (5-30 minutes)

4. **SSL Certificate**: Railway auto-generates (free)

---

## 📊 Monitoring & Logs

### View Live Logs
```bash
railway logs --follow
```

Or in Railway dashboard → Deployments → View Logs

### Check Deployment Status
```bash
railway status
```

Shows:
- Deployment state (Running/Building/Failed)
- Memory usage
- CPU usage
- Request count

### Restart Service
```bash
railway restart
```

---

## 🔐 Environment Variables

If you need to add API keys or secrets:

### Via Railway Dashboard
1. Go to Variables tab
2. Click "New Variable"
3. Add KEY=value pairs

### Via CLI
```bash
railway variables set API_KEY=your-secret-key
```

**Note**: Your current dashboard doesn't need environment variables.

---

## ✅ Deployment Checklist

### Pre-Deployment
- [x] Project files created
- [x] Dockerfile configured
- [x] railway.json configured
- [x] .dockerignore created
- [x] .railwayignore created
- [ ] Git repository initialized
- [ ] Files committed to git
- [ ] GitHub repository created
- [ ] Code pushed to GitHub

### Deployment
- [ ] Railway account created
- [ ] GitHub connected to Railway
- [ ] Project deployed from GitHub
- [ ] Domain generated
- [ ] Site accessible via URL

### Post-Deployment
- [ ] All pages load correctly
- [ ] Data displays properly
- [ ] Mobile responsiveness verified
- [ ] Browser console shows no errors
- [ ] Bookmarked Railway dashboard URL

---

## 🎉 Success Indicators

Your deployment is successful when:

✅ **GitHub**: Repository shows all files  
✅ **Railway**: Deployment status shows "Success"  
✅ **URL**: Generated domain loads your dashboard  
✅ **Data**: Games and players display correctly  
✅ **Pages**: All navigation links work  
✅ **Mobile**: Responsive design works on phone  
✅ **Console**: No JavaScript errors (F12)  

---

## 🚀 Advanced: Continuous Deployment

### Automatic Deployments

Railway automatically deploys when you push to GitHub:

```bash
# Make changes
vim data/week10-data.json

# Commit and push
git add .
git commit -m "Update player projections"
git push

# Railway deploys automatically! 🎉
```

### Branch Deployments

Deploy different branches:
1. Create feature branch: `git checkout -b feature/new-page`
2. Push to GitHub: `git push -u origin feature/new-page`
3. In Railway, add new environment for this branch
4. Test changes before merging to main

---

## 📞 Support Resources

### Railway
- **Documentation**: https://docs.railway.app/
- **Discord Community**: https://discord.gg/railway
- **Status Page**: https://status.railway.app/

### Project
- **GitHub Issues**: Report bugs in your repo
- **Railway Dashboard**: Monitor deployments

### Quick Commands Reference

```bash
# Git Commands
git status              # Check what's changed
git add .              # Stage all changes
git commit -m "msg"    # Commit changes
git push               # Push to GitHub

# Railway Commands
railway login          # Login to Railway
railway status         # Check deployment
railway logs           # View logs
railway open           # Open in browser
railway restart        # Restart service
```

---

## 🎯 Next Steps

1. **Complete Git Setup** (see Step 1 above)
2. **Create GitHub Repository** (see Step 2)
3. **Push to GitHub** (see Step 3)
4. **Deploy on Railway** (see Step 4)
5. **Test Your Dashboard** (see Step 5)
6. **Share Your URL** 🎉

---

## 📝 Update Log

- **2025-11-09**: Created comprehensive GitHub deployment guide
- **2025-11-09**: Added .dockerignore and .railwayignore files
- **2025-11-09**: Documented troubleshooting for CLI upload issues

---

**🏈 Your Fantasy Football Dashboard will be live in minutes!**

Follow the steps above and you'll have a production-ready dashboard deployed via GitHub → Railway with automatic deployments on every push.

**Questions?** Check the troubleshooting section or Railway documentation.