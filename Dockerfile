# Specify the base image
FROM node:14-alpine

RUN npm cache clean --f
# Copy the package.json and package-lock.json files to the container
ADD package.json ./

# Install the application dependencies
RUN npm install

# Set the working directory inside the container
WORKDIR /app

# Copy the application source code to the container
COPY . .

# Expose a port for the application (if needed)
EXPOSE 3000

# Specify the command to run the application
CMD [ "node", "app.js" ]

