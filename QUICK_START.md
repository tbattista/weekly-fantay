# 🚀 Quick Start: Generate Week 10 Data Now

This guide will help you generate comprehensive Week 10 NFL data using OpenAI right now.

---

## 📋 Step-by-Step Setup (10 minutes)

### Step 1: Get Your OpenAI API Key

1. **Go to OpenAI Platform**: https://platform.openai.com/api-keys
2. **Sign in** or create account (if you don't have one)
3. **Click**: "Create new secret key"
4. **Name it**: "Fantasy-Weekly"
5. **Copy the key**: It starts with `sk-...` (you'll only see it once!)
6. **Save it somewhere safe** (you'll need it in Step 3)

**Important**: Make sure you have billing set up at https://platform.openai.com/account/billing

### Step 2: Install Dependencies

Open your terminal in the project directory and run:

```bash
cd scripts
npm install
```

This installs the OpenAI SDK (takes ~30 seconds).

### Step 3: Set Your API Key

**Windows (PowerShell):**
```powershell
$env:OPENAI_API_KEY="sk-your-actual-key-here"
```

**Windows (Command Prompt):**
```cmd
set OPENAI_API_KEY=sk-your-actual-key-here
```

**Mac/Linux:**
```bash
export OPENAI_API_KEY="sk-your-actual-key-here"
```

**Replace** `sk-your-actual-key-here` with your actual OpenAI API key from Step 1.

### Step 4: Generate Week 10 Data

Still in the `scripts` directory, run:

```bash
node generate-weekly-data.js
```

**What happens:**
1. Script calculates current week (Week 10)
2. Calls OpenAI API with comprehensive prompt
3. Generates complete JSON with all game data
4. Saves to `data/week10-data.json`
5. Takes 2-3 minutes

**Expected output:**
```
🏈 Fantasy Weekly Data Generator
================================
Week: 10
Season: 2025
Date: 2025-11-09T00:30:00-05:00

📡 Calling OpenAI API...
Model: gpt-4-turbo

✅ Received response from OpenAI
Tokens used: 12,450

🔍 Parsing JSON...
✅ JSON parsed successfully

🔍 Validating data...
✅ Data validation passed

💾 Data saved successfully
File: ../data/week10-data.json

📊 Summary:
   Games: 14
   DFS QBs: 12
   DFS RBs: 18
   DFS WRs: 24
   DFS TEs: 10
   Sources: 18

🎉 Weekly data generation complete!
```

### Step 5: Deploy to Railway

```bash
cd ..
git add data/week10-data.json
git commit -m "Update Week 10 data with OpenAI generation"
git push
```

Railway will automatically deploy the new data (2-5 minutes).

### Step 6: Verify

Visit: https://fantasyweekly-production.up.railway.app

Your dashboard should now show the fresh Week 10 data!

---

## 🎯 One-Command Quick Run

After initial setup, you can run everything with one command:

**Windows PowerShell:**
```powershell
$env:OPENAI_API_KEY="sk-your-key"; cd scripts; node generate-weekly-data.js; cd ..; git add data/*.json; git commit -m "Update data"; git push
```

**Mac/Linux:**
```bash
export OPENAI_API_KEY="sk-your-key" && cd scripts && node generate-weekly-data.js && cd .. && git add data/*.json && git commit -m "Update data" && git push
```

---

## 🔧 Troubleshooting

### "OPENAI_API_KEY environment variable not set"

**Problem**: API key not set in terminal

**Fix**: Run the `set` or `export` command again in your current terminal window

### "npm: command not found"

**Problem**: Node.js not installed

**Fix**: 
1. Download Node.js: https://nodejs.org/
2. Install LTS version
3. Restart terminal
4. Try again

### "Invalid API key"

**Problem**: API key is incorrect or expired

**Fix**:
1. Go to https://platform.openai.com/api-keys
2. Create a new key
3. Update your environment variable
4. Try again

### "Insufficient credits"

**Problem**: No credits in OpenAI account

**Fix**:
1. Go to https://platform.openai.com/account/billing
2. Add payment method
3. Add credits ($5-10 is plenty)
4. Try again

### JSON Parse Error

**Problem**: OpenAI returned invalid JSON

**Fix**: The script automatically cleans the response. If it still fails:
1. Check the error message
2. Try running again (sometimes API has hiccups)
3. Check OpenAI status: https://status.openai.com

---

## 💰 Cost Per Run

- **Model**: GPT-4-turbo
- **Tokens**: ~10,000-15,000
- **Cost**: $0.10-0.50 per run
- **Very affordable** for comprehensive NFL data!

---

## 🎨 Customize the Data

### Change Week Number

Edit `scripts/get-current-week.js` or set environment variable:

```bash
export WEEK_OVERRIDE=11
node generate-weekly-data.js
```

### Change OpenAI Model

Edit `scripts/generate-weekly-data.js` line 175:

```javascript
model: 'gpt-4-turbo', // Options: 'gpt-4', 'gpt-4-turbo', 'gpt-3.5-turbo'
```

**Cost comparison:**
- `gpt-4-turbo`: $0.10-0.50 (recommended - best quality)
- `gpt-4`: $0.30-1.00 (slower, more expensive)
- `gpt-3.5-turbo`: $0.01-0.05 (faster, lower quality)

### Adjust Data Detail

Edit `scripts/generate-weekly-data.js` line 176:

```javascript
temperature: 0.3, // 0.0 = very consistent, 1.0 = more creative
```

---

## 📊 What Data You Get

The generated JSON includes:

### Game Data (per game)
- ✅ Kickoff time and venue
- ✅ Vegas spread and total
- ✅ Implied team totals
- ✅ Over/Under trends (last 5 games)
- ✅ Weather forecast (outdoor games)
- ✅ Surface type (grass/turf/dome)

### DFS Player Pool
- ✅ QB: 10-15 players with salaries
- ✅ RB: 15-25 players with salaries
- ✅ WR: 20-35 players with salaries
- ✅ TE: 8-15 players with salaries
- ✅ Projections and value ratings

### Additional Data
- ✅ Key injuries with impact analysis
- ✅ Player props and betting angles
- ✅ Narrative notes and insights
- ✅ 15-20 cited sources
- ✅ Weather alerts
- ✅ Outlier betting trends

---

## 🔄 For Future Weeks

### Manual Run (Any Week)

```bash
# Set week number
export WEEK_OVERRIDE=11

# Generate data
cd scripts
node generate-weekly-data.js

# Deploy
cd ..
git add data/week11-data.json
git commit -m "Add Week 11 data"
git push
```

### Automated Run (Saturday 7 AM EST)

Once you add `OPENAI_API_KEY` to GitHub Secrets:
1. Go to: https://github.com/tbattista/weekly-fantay/settings/secrets/actions
2. Add secret: `OPENAI_API_KEY` = your key
3. Done! Runs automatically every Saturday

---

## ✅ Success Checklist

After running the script, verify:

- [ ] Script completed without errors
- [ ] File created: `data/week10-data.json`
- [ ] JSON is valid (no syntax errors)
- [ ] Games array has 10+ games
- [ ] DFS player pool is populated
- [ ] Sources array has 15+ sources
- [ ] Committed and pushed to GitHub
- [ ] Railway deployed successfully
- [ ] Dashboard displays new data

---

## 🎯 Next Steps

1. **Run it now** to generate Week 10 data
2. **Test the dashboard** to see the results
3. **Add API key to GitHub Secrets** for automation
4. **Relax** - future weeks update automatically!

---

## 📞 Need Help?

### OpenAI Issues
- API Keys: https://platform.openai.com/api-keys
- Billing: https://platform.openai.com/account/billing
- Status: https://status.openai.com

### Script Issues
- Check `scripts/README.md` for details
- Review error messages carefully
- Try running with `--verbose` flag

### Deployment Issues
- See `DEPLOYMENT_GUIDE.md`
- Check Railway logs
- Verify git push succeeded

---

**Ready to generate your Week 10 data? Follow Step 1 above to get started!** 🏈