package ci

# Developer Agent Pipeline
developer: {
  input: string
  prompt: #"
    import "agents/developer/prompt.md")
  "#
  actions: [
    {
      name: "analyze"
      cmd: "llm analyze --input=input"
    },
    {
      name: "implement"
      cmd: "llm generate --prompt=prompt"
    }
  ]
}