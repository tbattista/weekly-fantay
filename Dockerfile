# Use Nginx Alpine for lightweight static file serving
FROM nginx:alpine

# Copy all project files to nginx html directory
COPY . /usr/share/nginx/html

# Copy custom nginx configuration for port 8080
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 8080 (Railway requirement)
EXPOSE 8080

# Start nginx
CMD ["nginx", "-g", "daemon off;"]