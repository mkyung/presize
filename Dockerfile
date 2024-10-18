# Use the official Node.js image as a base
FROM node:18

# Set the working directory
WORKDIR /app

COPY . .


# Install pnpm globally
RUN npm install -g pnpm

# Install dependencies
RUN pnpm install

WORKDIR /app/apps/web

RUN pnpm install

# Expose the port the app runs on
EXPOSE 3000

ENTRYPOINT [ "pnpm" ]
# Start the application
CMD ["preview", "--host"]