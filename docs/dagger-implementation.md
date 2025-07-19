# Proper Dagger Integration

## GitHub Action Configuration
```yaml
uses: dagger/dagger-for-github@v5
with:
  cmd: run your-pipeline
```

## Key Differences from Greetings-API
1. Uses GitHub App authentication instead of PAT
2. Containerized agent execution via Dagger
3. Prompt engineering for context-aware repairs

[Reference Implementation](https://github.com/kpenfound/greetings-api/blob/main/.github/workflows/ci.yml)