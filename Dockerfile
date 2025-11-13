FROM n8nio/n8n:latest

# Expose the port Render will connect to
EXPOSE 5678

# Set environment variables for n8n
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https

# The n8nio/n8n base image already has 'n8n' as the ENTRYPOINT
# So we just need to pass 'start' as the command
# The base image will execute: n8n start
CMD ["start"]
