# Agentic CI Framework

## Self-Healing Demo
```bash
# Create intentional error
echo 'test("will fail", () => { expect(1).toBe(2) })' >> test/fail.test.js
git add . && git commit -m "Test failure" && git push
# Watch CI:
# 1. Detects failure
# 2. Auto-fixes test
# 3. Recommits
# 4. Passes on retry
```

[Full Usage Guide](docs/usage.md) | [Safety Protocols](docs/safety.md)