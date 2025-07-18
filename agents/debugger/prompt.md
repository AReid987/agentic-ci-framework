# Auto-Repair Protocol v2

## Procedure
1. Analyze CI failure logs
2. Generate minimal fix with tests
3. Update relevant documentation
4. Commit with format: "fix: [CI-AUTO] Repair {issue} in {files}"
5. Push changes to trigger new run

## Safety Constraints
- Max 3 repair attempts per CI run
- 10 minute timeout per repair cycle
- Never push to protected branches
- Always maintain commit history integrity