```markdown
# Demo_RP

Minimal ASP.NET Core 7 demo app with a login page, Dockerfile and GitHub Actions CI/CD.

Demo credentials (for demo purposes only):
- Username: demo
- Password: Password123!

Run locally:
```bash
dotnet restore
dotnet run
# open http://localhost:5000 or the port indicated
```

Build and run Docker:
```bash
docker build -t demo_rp:local .
docker run -p 8080:80 demo_rp:local
# open http://localhost:8080
```

CI:
- `.github/workflows/ci.yml` builds and runs tests on push and PR.

CD:
- `.github/workflows/cd.yml` builds and pushes a Docker image to GitHub Container Registry (GHCR) on push to `main`.
- The workflow uses `GITHUB_TOKEN` (already provided to Actions) to push to GHCR. Adjust permissions or use a personal access token if you prefer.

Next steps:
- Replace the demo in-memory auth with a real user store (Identity, database, or external provider).
- Add unit/integration tests and secrets for production deployments.
- If you want, I can push these files into your repository directly and open a PR — tell me to proceed.
```