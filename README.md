# n8n Deployment for Addi Conversations

This directory contains the configuration files for deploying n8n workflow automation to handle ElevenLabs post-call webhooks.

## 📁 Files

- **`Dockerfile`** - Docker image configuration for n8n
- **`render.yaml`** - Render.com deployment configuration
- **`Addi-Conversations.json`** - n8n workflow definition (import this after deployment)
- **`README.md`** - This file

## 🚀 Quick Start

### For Render.com Deployment

1. **Push to GitHub:**
   ```bash
   git add .
   git commit -m "n8n Render deployment"
   git push origin main
   ```

2. **Deploy to Render:**
   - Go to https://render.com
   - New → Web Service
   - Connect GitHub repo
   - Render will auto-detect `render.yaml`
   - Click "Create Web Service"

3. **After Deployment:**
   - Access n8n UI at: `https://n8n-addi-server-[random].onrender.com`
   - Login with basic auth (see `render.yaml` for credentials)
   - Import workflow: `Addi-Conversations.json`
   - Update ElevenLabs webhook URL to n8n Production URL

**Full instructions:** See `/plans/2025-11-06_N8N_RENDER_DEPLOYMENT_PLAN.md`

## 🔧 Configuration

### Environment Variables (in render.yaml)

- **`N8N_BASIC_AUTH_USER`** - Username for n8n UI (default: `admin`)
- **`N8N_BASIC_AUTH_PASSWORD`** - **CHANGE THIS** to a strong password
- **`ELEVENLABS_WEBHOOK_SECRET`** - HMAC secret from ElevenLabs
- **`DASHBOARD_BACKEND_URL`** - Your dashboard backend URL
- **`TWILIO_*`** - Twilio credentials for SMS (optional)

### Workflow Structure

The `Addi-Conversations.json` workflow includes:

1. **Webhook** - Receives POST from ElevenLabs
2. **Code** - Processes transcript to plain text
3. **HTTP Request** - Forwards to dashboard backend
4. **Google Sheets** - Backs up conversation data

## 📊 Architecture

```
ElevenLabs → n8n Webhook → [Process] → Dashboard Backend
                                    → Google Sheets
```

## 🔐 Security Notes

- **Change the default password** in `render.yaml` before deployment
- Webhook secret is already configured
- Basic auth protects n8n UI
- HTTPS is automatic on Render

## 📚 Documentation

- **Render Deployment:** `/plans/2025-11-06_N8N_RENDER_DEPLOYMENT_PLAN.md`
- **Self-Hosting (Future):** `/plans/2025-11-06_N8N_SELF_HOSTING_MIGRATION_PLAN.md`
- **Integration Plan:** `/plans/2025-11-06_N8N_INTEGRATION_PLAN.md`

## ⚠️ Important Notes

1. **Persistent Storage:** Add a disk in Render (1GB) mounted at `/home/node/.n8n` to persist workflows
2. **Free Tier Limitation:** Render free tier sleeps after 15 min idle - upgrade to $7/mo Starter for 24/7
3. **Webhook URL:** Copy the Production URL from n8n webhook node (not Test URL)
4. **Credentials:** Google Sheets OAuth must be reconnected after deployment

## 🆘 Troubleshooting

- **Workflows reset:** Add persistent disk (see deployment plan)
- **Webhook not receiving:** Check workflow is Active, verify URL in ElevenLabs
- **Dashboard not updating:** Check HTTP Request node is executing in n8n

---

*Last updated: November 6, 2025*

