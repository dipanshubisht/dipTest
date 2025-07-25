# --- Build Stage ---
FROM oven/bun:latest AS builder
WORKDIR /app

# Install all dependencies
COPY package.json bun.lock ./
RUN bun install

# Copy source files and build
COPY . .
RUN bun run build

# --- Run Stage ---
FROM oven/bun:latest AS runner
WORKDIR /app

# Copy the entire project (needed for vite preview)
COPY --from=builder /app ./

# Expose Vite preview port
EXPOSE 4173

# Serve the built app
CMD ["bun", "run", "preview"] 