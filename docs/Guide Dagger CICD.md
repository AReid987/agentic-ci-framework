---
type: Page
title: 'Guide: Dagger CI/CD'
description: null
icon: null
createdAt: '2025-07-17T08:42:42.631Z'
creationDate: 2025-07-17 03:42
modificationDate: 2025-07-17 03:43
tags: []
coverImage: null
---

**Phase 1: Foundational Improvements (Bootstrapping Agentic CI)**

1. **Enhance Developer Documentation:**

    - Create or improve your `contributing.md` file or equivalent developer documentation.

    - Include a clear project layout or map, detailing where different components (backend, frontend, docs, CI/CD scripts) are located. An ASCII tree structure can be helpful.

    - Describe the technologies and frameworks used (e.g., Go for backend).

    - Explain how to run tests and list dependencies.

    - This documentation is crucial for both human contributors and AI agents to understand how to contribute to the project.

    - **Continuously Update:** This documentation is not static. If something comes up in a review that isn't documented, it needs to be added as part of that review process. [[01:03:14](http://www.youtube.com/watch?v=ZinmeM5mljg&t=3794)]

2. **Codify Your "Human Linting" and Styles:**

    - Identify common feedback points in code reviews that relate to style, best practices, or team-specific conventions (e.g., "in this part of the org, we write it like this"). [[01:01:48](http://www.youtube.com/watch?v=ZinmeM5mljg&t=3708)]

    - Incorporate these into your linters and automated style checkers. If your current linters aren't advanced enough, they need to be improved. [[01:02:05](http://www.youtube.com/watch?v=ZinmeM5mljg&t=3725)]

    - This applies to both code styles and documentation writing styles. [[01:02:15](http://www.youtube.com/watch?v=ZinmeM5mljg&t=3735)]

    - The goal is to catch these issues with tooling before a human reviewer sees them. [[01:02:23](http://www.youtube.com/watch?v=ZinmeM5mljg&t=3743)]

**Phase 2: Introducing AI Agents into the Workflow**

1. **Define Agent Roles and Prompts:**

    - **Developer Agent:** This agent is responsible for generating code based on tasks (e.g., from a GitHub issue). [[01:15:23](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4523)]

        - Its prompt should guide its problem-solving process. [[01:20:53](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4853)]

        - Crucially, point the agent to your developer documentation (e.g., "look at the contributing.md, specifically the project architecture section"). [[01:21:13](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4873)]

        - Instruct it to run tests and linters as part of its task completion. [[01:22:03](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4923)]

    - **Reviewer Agent:** This agent reviews pull requests. [[01:16:01](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4561)]

        - Define clear, codified PR review criteria (a checklist). This is beneficial even without AI. [[01:22:21](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4941)]

        - Criteria should include:

            - Accomplishing the task without unrelated changes. [[01:23:05](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4985)]

            - Absence of obvious malicious code (this needs careful prompting). [[01:23:13](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4993)]

            - New functionality having tests. [[01:23:20](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5000)]

            - Architectural changes updating developer docs. [[01:23:27](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5007)]

            - Product functionality changes updating product docs. [[01:23:34](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5014)]

    - **Debugger Agent:** This agent attempts to fix linting and test failures automatically. [[01:16:13](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4573)]

        - When linters or tests fail, this agent takes the failure output and tries to generate a fix. [[01:16:33](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4593)]

        - The fix can be proposed as a code suggestion on the PR for the contributor to accept. [[01:29:59](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5399)]

    - **Feedback Agent:** An extension of the developer agent, allowing iteration on PRs based on feedback. [[01:17:08](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4628)]

        - It takes the original assignment, the work done so far, and the feedback (e.g., from the reviewer agent) to make revisions. [[01:17:19](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4639)]

2. **Integrate Agents into Your CI System (e.g., GitHub Actions):**

    - **Triggering Agents:**

        - The **Developer Agent** can be triggered by a command in a GitHub issue (e.g., `/develop`). This involves a GitHub Actions workflow that listens for issue comments. [[01:39:40](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5980)]

        - The **Debugger Agent** can be triggered automatically within your test/linting CI jobs if they fail. [[01:32:05](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5525)]

        - The **Reviewer Agent** can be triggered when a PR is opened or when requested (e.g., by the Developer Agent after it creates a PR). [[01:41:39](http://www.youtube.com/watch?v=ZinmeM5mljg&t=6099)]

    - **Running Agents:**

        - The example uses Dagger to define and run these agents. Dagger functions encapsulate the agent's logic, including interacting with LLMs (e.g., via `dag.llm`). [[01:31:57](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5517)]

        - Agents run within the CI environment (e.g., GitHub Actions runners). [[01:32:30](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5550)]

        - The LLM interaction itself (API calls to Claude, etc.) happens externally, but the agent's orchestration and tool use (reading files, running tests) are within the CI job. [[01:34:41](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5681)]

    - **Permissions and Identity:**

        - For agents to perform actions like opening PRs, commenting, or pushing commits, they need appropriate permissions.

        - Using a GitHub App (like "Agent Cal" in the demo) is preferred over personal access tokens. This allows the bot to have its own identity and correctly trigger subsequent workflows (which might be suppressed if a workflow is triggered by the default `GITHUB_TOKEN` from another workflow). [[01:41:15](http://www.youtube.com/watch?v=ZinmeM5mljg&t=6075)]

**Phase 3: Establishing the Feedback Loop**

1. **Automated Pre-Review and Fixes:**

    - When a PR is opened (by a human or an agent):

        - CI runs linters and tests.

        - If failures occur, the **Debugger Agent** attempts to fix them and posts suggestions. [[01:29:37](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5377)] The contributor (or another agent) can then commit these fixes. [[01:30:07](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5407)]

2. **Automated Code Review:**

    - The **Reviewer Agent** runs, checking the PR against the codified criteria. [[01:38:35](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5915)]

    - It posts its review as a comment on the PR, potentially with a checklist of required changes. [[01:38:51](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5931)]

3. **Iterative Refinement (Agent-to-Agent or Agent-to-Human):**

    - If the PR was opened by the **Developer Agent**:

        - The **Reviewer Agent's** feedback can be automatically passed to the **Feedback Agent**. [[01:42:12](http://www.youtube.com/watch?v=ZinmeM5mljg&t=6132)]

        - The **Feedback Agent** attempts to address the review comments, makes new commits, and potentially updates its own rules/prompts or the developer documentation based on the feedback. [[01:42:24](http://www.youtube.com/watch?v=ZinmeM5mljg&t=6144)] This creates a self-improvement loop.

    - If the PR was opened by a human:

        - The human contributor sees the **Debugger Agent's** suggestions and the **Reviewer Agent's** feedback and makes the necessary changes. [[01:39:03](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5943)]

4. **Human Maintainer Review (Final Step):**

    - By the time a human maintainer looks at the PR, many common issues (style, basic test failures, missing docs updates) should have already been addressed by the automated tooling and agents. [[01:09:36](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4176)]

    - This allows the human reviewer to focus on higher-level concerns, architectural soundness, and the core logic of the change, significantly shortening their review time. [[01:09:46](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4186)]

**Phase 4: Monitoring and Continuous Improvement**

1. **Observability:**

    - Use tools like Dagger Cloud to visualize the execution of these agentic CI pipelines, see the LLM interactions (prompts, responses, tool usage), and debug issues. [[01:45:45](http://www.youtube.com/watch?v=ZinmeM5mljg&t=6345)] This is especially important when multiple agents are interacting.

2. **Refine Prompts and Rules:**

```markdown
*   Continuously refine the prompts for your agents and the rules in your developer documentation based on the quality of their output and any recurring issues. \[[01:04:14](http://www.youtube.com/watch?v=ZinmeM5mljg&t=3854)\]
```

```markdown
*   If an agent consistently makes a mistake or misses something, update its guiding prompt or the project's documented rules.
```

**Key Principles Emphasized:**

- **Start Small and Incremental:** Don't try to automate everything with AI at once. Focus on specific pain points, like the initial review cycle for style and basic tests. [[01:06:28](http://www.youtube.com/watch?v=ZinmeM5mljg&t=3988)]

- **Tooling for All Contributors:** The improvements (better docs, better linters) benefit both human and AI contributors. [[01:14:14](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4454)]

- **Shift CI Left:** Move feedback and checks earlier in the process, ideally before a human maintainer spends time on it. [[01:12:16](http://www.youtube.com/watch?v=ZinmeM5mljg&t=4336)]

- **Codify Implicit Knowledge:** Turn the unwritten rules and common review feedback into explicit, automated checks and documentation. [[01:02:05](http://www.youtube.com/watch?v=ZinmeM5mljg&t=3725)]

- **Bring Your Own Model:** The framework allows using various LLMs; the focus is on the process and tooling integration. [[01:33:39](http://www.youtube.com/watch?v=ZinmeM5mljg&t=5619)]

You can find the video at:

[Agentic CI: Using AI to Eliminate Bottlenecks in Code Review and Developer Workflows](https://app.capacities.io/6002bb54-716f-4804-8c6a-17e1e219e363/fc5cfa06-28f8-4e80-9733-3d7ab4107cfd)

