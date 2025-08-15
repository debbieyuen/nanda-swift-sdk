# Nanda Swift SDK
This system implements a Swift-based agent using the [NANDA Agent Protocol](https://github.com/projnanda/nanda-agent) and deploys it as an HTTP service. It allows you to register an agent with a unique ID, expose API endpoints for interaction, and run on a public endpoint (e.g., via Render).  

The agent responds to messages via a `/agent/respond` endpoint and provides a health check endpoint for monitoring.

Here is a link to the video: https://youtu.be/ybC4iie_BGs?si=TeXUCxrcGSspfpqn
[![Watch the demo](https://img.youtube.com/vi/ybC4iie_BGs/0.jpg)](https://youtu.be/ybC4iie_BGs)

Live API: Live API: https://nanda-swift-sdk.onrender.com


## Prerequisites
- macOS (Mac/MacBook)
- Xcode 16+
- Swift 6
- Bash shell
- Internet connectivity
- A [Render](https://render.com/) account for deployment
  
## Configuration

The Swift server is configured in `Servermain.swift` and uses:
- `/health` route for service status
- `/agent/respond` route for JSON-based POST requests
- `/.well-known/agent-facts.json` for metadata

## Deployment

1. Clone the repository:
   ```bash
   git clone https://github.com/debbieyuen/nanda-swift-sdk.git
   cd nanda-swift-sdk
   ```
   
2. Build Locally on your computer
   ```bash
   swift build
   ```
   Or alternatively:

   ```
   swift build -c release
   .build/release/NandaSwiftAgent serve --hostname 0.0.0.0 --port 8080
   # Visit http://localhost:8080/health
   ```

3. To connect to Render: Push to your GitHub repo and connect it to Render for auto-deployment.
Render will provide you with a public URL like ours:
   ```bash
   https://nanda-swift-sdk.onrender.com
   ```
## Usage
Once deployed, the API can be accessed at your Render URL. 

1. Health Check (Browser or Curl)
   Check if your agent is running:
   ```bash
   curl https://nanda-swift-sdk.onrender.com/health
   ```
  Expected response: 
   ```bash
   "ok"
   ```
   
2. Respond Endpoint (POST JSON)
   Send a message to the agent:
  ```bash
    curl -s -X POST https://nanda-swift-sdk.onrender.com/agent/respond \
  -H "content-type: application/json" \
  -d '{"message":"echo hello"}'
  ```
  Example output: 
```bash
{
  "reply": "[swift-agent-core_664BDBFF]: hello",
  "data": {
    "impl": "swift-vapor-sdk",
    "agentName": "swift-agent-core",
    "agentID": "swift-agent-core_664BDBFF"
  }
}
```
3. Agent Facts
   Access the `.well-know/agent-facts.json` file. The expect output should be your JSON metadata configured in your Dockerfile.
   ```bash
   curl https://nanda-swift-sdk.onrender.com/.well-known/agent-facts.json
   ```

## Notes
  Visiting `https://nanda-swift-sdk.onrender.com` in a browser without a defined `/` route will return:
   ```json
    {"error":true,"reason":"Not Found"}
   ```

## Troubleshooting
* **404 Not Found:** Ensure you are calling the correct endpoint (`/health`, `/agent/respond`, or `/.well-known/agent-facts.json`).
* **No Response:** Verify the Render deployment logs to ensure the service is running.
* **Build Errors:** Verify the Render deployment logs to ensure the service is running.

## License

MIT License

Copyright (c) 2024 Internet of Agents

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. 
