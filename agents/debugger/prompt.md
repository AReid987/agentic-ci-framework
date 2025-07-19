# Debugger Agent Protocol

## Auto-Repair Workflow
1. Analyze CI failure logs
2. Generate minimal code fix with tests
3. Update relevant documentation
4. Commit with message: "fix: [CI-AUTO] {issue-description}"
5. Push changes to trigger new CI run

## Safety Constraints
- Max 3 repair attempts
- 10 minute timeout
- Never modify protected branches
- Maintain commit history integrity