# Agentic CI Usage Guide

## Self-Healing Workflow
```mermaid
sequenceDiagram
    participant Dev as Developer
    participant GH as GitHub
    participant CI as CI Pipeline
    participant Agent as Debugger Agent
    Dev->>GH: Pushes code
    GH->>CI: Triggers workflow
    CI->>Agent: Runs on failure
    Agent->>GH: Commits fixes
    GH->>CI: Retriggers pipeline
    CI-->>Dev: Passes after repairs
```

## Configuration Steps
1. Create GitHub PAT with `repo` scope
2. Add secret `AGENTIC_CI_PAT` in repo settings
3. Enable actions in repository permissions