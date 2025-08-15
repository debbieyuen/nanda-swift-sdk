# Build stage
FROM swift:6.1.0 AS build
WORKDIR /app
COPY . .
RUN swift build -c release

# Runtime stage (keeps Swift runtime libs)
FROM swift:6.1.0-slim
WORKDIR /run

# Binary
COPY --from=build /app/.build/release/NandaSwiftAgent /usr/local/bin/NandaSwiftAgent

# Optional: data/assets your app expects at runtime
COPY agent-facts.json /run/agent-facts.json

# Render will set PORT; your app reads it in Servermain.swift
EXPOSE 8080
CMD ["NandaSwiftAgent"]


