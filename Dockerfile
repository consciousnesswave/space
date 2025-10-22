# Use official Node.js latest image as build stage
FROM node:latest AS builder
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json* ./
RUN npm ci --production=false || npm install

# Copy source and build
COPY . .
RUN npm run build

# Production image
FROM node:latest AS runner
WORKDIR /app
ENV NODE_ENV=production

# Copy only necessary files from builder
COPY --from=builder /app/package.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/public ./public

EXPOSE 3000
CMD ["node", "node_modules/next/dist/bin/next", "start", "-p", "3000"]
