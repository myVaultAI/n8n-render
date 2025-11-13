FROM n8nio/n8n:latest

# Expose the port Render will connect to
EXPOSE 5678

# Default command for n8n
CMD ["n8n", "start"]
