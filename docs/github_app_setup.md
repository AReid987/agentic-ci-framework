# GitHub App Configuration Guide

1. Create new GitHub App:
   - Repository permissions:
     - Actions: Read & Write
     - Contents: Read & Write
     - Pull requests: Read & Write
   - Subscribe to events:
     - Push
     - Pull request
     - Workflow run

2. Install app in your repository

3. Generate private key and store as GH_APP_PRIVATE_KEY secret

4. Store App ID as GH_APP_ID secret

[Detailed Setup Instructions](https://docs.github.com/en/apps/creating-github-apps)