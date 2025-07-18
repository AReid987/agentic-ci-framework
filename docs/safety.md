# Safety Protocols

## Isolation Guidelines
```mermaid
flowchart LR
    A[CI Agent] -->|Docker Container| B[Host System]
    B -->|Read-only Mounts| C[Source Code]
    A -->|Limited GitHub Token| D[Repository]
```

## Best Practices
- Always run agents with least-privilege tokens
- Use ephemeral containers for agent execution
- Implement automatic timeout (max 30m per agent task)