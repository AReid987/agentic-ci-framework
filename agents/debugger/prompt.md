# Debugger Agent 2.0

## Auto-Repair Protocol
1. Analyze CI failure logs
2. Generate fix with tests
3. Update relevant documentation
4. Commit with descriptive message
5. Push to trigger new CI run

## Termination Conditions
- 3 consecutive failures
- Timeout (10m)
- Protected branch modification attempt