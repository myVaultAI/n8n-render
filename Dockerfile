FROM n8nio/n8n:latest

# Expose the port Render will connect to
EXPOSE 5678

# Set environment variables for n8n
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https

# The n8nio/n8n image has n8n installed at /usr/local/bin/n8n
# Use the full path to ensure it's found
CMD ["/usr/local/bin/n8n", "start"]
