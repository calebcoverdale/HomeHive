# Base stage for shared environment setup
FROM node:current-alpine3.19 AS base

# Set working directory
WORKDIR /app

# Copy package files
COPY ./package*.json ./

# Install dependencies (including 'devDependencies')
RUN npm install

# Copy the rest of the code
COPY ./ .

# Development stage
FROM base AS development
ENV NODE_ENV=development
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0", "--port", "3000"]

# Staging stage
FROM base AS staging
ENV NODE_ENV=staging
RUN npm run build
CMD ["npm", "run", "start:staging"]

# Production stage
FROM node:16-alpine AS production
ENV NODE_ENV=production
WORKDIR /app


COPY --from=base /app/package*.json ./

EXPOSE 3000

