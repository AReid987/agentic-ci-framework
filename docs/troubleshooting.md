# Common Issues

## Agent Looping
```bash
# Reset agent state
dagger run reset-agent --name=developer
```

## Environment Drift
```bash
# Clean work directory
dagger exec -- rm -rf /work_dir/*
```

## Permission Errors
- Verify GitHub token scopes
- Use temporary tokens for sensitive operations