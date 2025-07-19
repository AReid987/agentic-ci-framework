describe('Agentic CI Framework', () => {
  test('should run basic workflow', async () => {
    const response = await runAgent('/develop test-issue');
    expect(response.prCreated).toBe(true);
    expect(response.testsPassed).toBe(true);
  });
});