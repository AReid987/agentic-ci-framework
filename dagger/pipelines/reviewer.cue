package ci

reviewer: {
  pr: number
  rules: "agents/reviewer/prompt.md"
  actions: [
    {
      name: "analyze"
      cmd: "llm review --pr=pr --rules=rules"
    }
  ]
}