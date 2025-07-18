# Agentic CI Framework

![Framework Diagram](docs/architecture.png)

## Features
```mermaid
flowchart TB
    A[Developer Agent] --> B[Automated Testing]
    B --> C[Reviewer Agent]
    C --> D[Debugger Agent]
    D -->|Feedback| A
```

## Quick Start
```bash
docker pull frdel/agent-zero-run
docker run -p 50001:80 frdel/agent-zero-run
# Visit http://localhost:50001
```

## Safety Protocols
- Always run in Docker containers
- Use least-privilege GitHub tokens
- Automatic timeout (30m max per agent)

[Full Documentation](docs/usage.md)