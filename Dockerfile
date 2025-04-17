# Use an official Node.js runtime as a parent image
# Choose a specific LTS version (e.g., 20) and a slim variant for smaller size
FROM node:20-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or yarn.lock)
# This leverages Docker cache - dependencies are only reinstalled if these files change
COPY package*.json ./

# Install production dependencies using npm ci for consistency and speed
# --only=production ensures devDependencies are not installed in the final image
RUN npm ci --only=production

# Bundle app source code inside the Docker image
# Copy local code to the container image's working directory
COPY . .

# Inform Docker that the container listens on the specified port at runtime.
# Cloud Run uses the PORT environment variable, but EXPOSE is good practice.
EXPOSE 8080

# Define the command to run your app using CMD which defines your runtime
# This will run "node server.js"
CMD [ "node", "server.js" ]