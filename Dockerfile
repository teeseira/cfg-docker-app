# Use an official Node.js runtime as a base image
FROM node:13-alpine

# Create and Set Working Directory (so that next commands executes in /home/app dir)
RUN mkdir -p /home/app
WORKDIR /home/app

# Copy application files to the Docker image
COPY ./app /home/app

# Install app dependencies
RUN npm install

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run your app (no need for /home/app/server.js because of WORKDIR)
CMD ["node", "server.js"]