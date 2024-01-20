# Base stage for shared environment setup
FROM node:16-alpine AS base

# Set working directory
WORKDIR /app

# Copy package files
COPY ./homehive/package*.json ./

# Install dependencies (including 'devDependencies')
RUN npm install

# Copy the rest of the code
COPY ./homehive/ .

# Development stage
FROM base AS development
ENV NODE_ENV=development
CMD ["npm", "run", "dev"]

# Staging stage
FROM base AS staging
ENV NODE_ENV=staging
RUN npm run build
CMD ["npm", "run", "start:staging"]

# Production stage
FROM node:16-alpine AS production
ENV NODE_ENV=production
WORKDIR /app

# Check if DOPPLER_TOKEN environment variable exists
RUN if [ ! -z "$DOPPLER_TOKEN" ]; then \
    npm install -g doppler-cli && \
    doppler setup --silent && \
    doppler run -- npm install --production; \
    else \
    npm install --production; \
    fi

COPY --from=base /app/package*.json ./
COPY --from=base /app/build ./build
EXPOSE 3000

# Run with Doppler if DOPPLER_TOKEN exists
CMD ["sh", "-c", "if [ ! -z \"$DOPPLER_TOKEN\" ]; then doppler run -- npm run start; else npm run start; fi"]
