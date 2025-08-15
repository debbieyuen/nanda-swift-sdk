# Build stage
FROM swift:6.1.0 as build
WORKDIR /app
COPY . .
RUN swift build -c release

# Runtime stage
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y ca-certificates && update-ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /run
# Server binary
COPY --from=build /app/.build/release/NandaSwiftAgent /usr/local/bin/NandaSwiftAgent
# Include agent-facts so your /.well-known endpoint can serve it
COPY agent-facts.json /run/agent-facts.json
ENV PORT=8080
EXPOSE 8080
CMD ["NandaSwiftAgent"]

