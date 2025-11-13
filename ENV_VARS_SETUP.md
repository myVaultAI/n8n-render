# Environment Variables Setup for Render

After deploying to Render, you need to set these environment variables in the Render dashboard.

**⚠️ IMPORTANT:** The actual values are stored securely and should be set in the Render dashboard, not committed to git.

## Required Environment Variables

### n8n Basic Auth
- **`N8N_BASIC_AUTH_PASSWORD`**: Set your preferred password (check your secure notes for the value)

### ElevenLabs
- **`ELEVENLABS_WEBHOOK_SECRET`**: Get from ElevenLabs webhook configuration (check your secure notes)

### Twilio (Optional - for SMS integration)
- **`TWILIO_ACCOUNT_SID`**: Get from Twilio dashboard (check your secure notes)
- **`TWILIO_AUTH_TOKEN`**: Get from Twilio dashboard (check your secure notes)

## How to Set in Render

1. Go to your Render dashboard
2. Select your n8n service
3. Go to **Environment** tab
4. Click **"Add Environment Variable"**
5. Add each variable above with its value
6. Click **"Save Changes"**
7. Service will automatically restart with new variables

## Security Note

These values are not in the repository for security reasons. Always set sensitive credentials in the Render dashboard, not in the `render.yaml` file.

