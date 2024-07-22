# Use a base image that supports Node.js
FROM node:14-buster-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo 'root:root' | chpasswd

# Expose the web-based terminal port
EXPOSE 4200

# Copy the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Define the start command
CMD ["./start.sh"]
