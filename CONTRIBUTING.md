# Agentic CI Framework Contribution Guide

## Project Layout
```
├── .github/
│   └── workflows/
│       ├── developer-agent.yml
│       ├── reviewer-agent.yml
│       └── debugger-agent.yml
├── agents/
│   ├── developer/
│   │   ├── prompt.md
│   │   └── config.yaml
│   ├── reviewer/
│   ├── debugger/
│   └── feedback/
├── dagger/
│   ├── pipelines/
│   └── ci.cue
├── docs/
│   ├── architecture.md
│   └── agent-roles.md
├── .eslintrc
├── .prettierrc
├── .markdownlint.json
└── README.md
```

## Technologies
- CI: GitHub Actions + Dagger
- AI: LLM Agents (Claude/OpenAI)
- Languages: TypeScript, Python, CUE

## Development Setup
```bash
npm install
dagger project update
dagger run ci:test
```