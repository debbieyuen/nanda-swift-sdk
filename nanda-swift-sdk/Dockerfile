# Build stage
FROM swift:6.1.0 AS build
WORKDIR /app
COPY . .
RUN swift build -c release

# Runtime stage
FROM swift:6.1.0-slim
WORKDIR /run
# binary
COPY --from=build /app/.build/release/NandaSwiftAgent /usr/local/bin/NandaSwiftAgent
# facts file for /.well-known/agent-facts.json
COPY agent-facts.json /run/agent-facts.json

ENV PORT=8080
EXPOSE 8080
CMD ["NandaSwiftAgent"]

