# MechMate AI

MechMate AI is a portfolio-ready engineering operations cockpit: mission control, task execution, evidence-aware agent runs, research citations, and practical engineering utilities in one responsive workspace.

## What is implemented

The app includes project switching, project-local task/milestone/conversation state, a Kanban board, workload and progress analytics, activity feed, theme switching, deterministic unit conversion, GD&T reference notes, simulation planning guidance, Crossref-backed research citations, report export, and a server-side agent route. The agent uses the configured Manus LLM when the runtime exposes `MANUS_API_URL` and `MANUS_API_KEY`; otherwise it returns an explicitly labeled deterministic fallback. It never pretends a model or simulation succeeded.

The initialized managed stack is React + TypeScript + Vite + Express + tRPC + Drizzle over the provisioned MySQL-compatible database. This is the supported managed runtime for this project; a FastAPI/PostgreSQL adapter is a documented future integration rather than an untested claim.

## Local development

```bash
pnpm install
pnpm dev
```

Open the Preview URL supplied by Manus. The dev server listens on `0.0.0.0:${PORT:-3000}`. The route manifest is available at `/manus-routes.json`.

### Windows setup

Install Node.js 22 LTS and pnpm 10.18.0, then run PowerShell:

```powershell
corepack enable
corepack prepare pnpm@10.18.0 --activate
pnpm install
pnpm dev
```

Copy `.env.example` to `.env` only for local provider configuration. Never commit real API keys. The managed Manus environment injects its own runtime values.

## Persistence and auth

The UI stores demo state in browser local storage so the portfolio demo works before login. The supplied Manus OAuth flow remains the real authentication path. Signed-in users can use the owner-scoped tRPC workspace snapshot procedure, backed by the managed database after the additive migration is applied. Backend procedures do not accept arbitrary owner IDs.

## Database

```bash
pnpm db:push
```

The managed development and published environments share the same database. Treat schema changes and any demo writes as real persistent data. For an external database, set `DATABASE_URL` through the protected secret/configuration flow rather than placing credentials in browser code.

## Build and deployment

```bash
pnpm check
pnpm build
pnpm start
```

The initialized Webdev project includes a Dockerfile, `/api/health`, and server capability. Publish from a committed managed checkpoint using the Webdev deployment workflow. Do not add provider credentials to the image; read them at runtime.

## Environment template

See `.env.example`. The platform-owned names are placeholders only; use the managed environment or protected secrets for real values.

## Honest limitations

Full production collaboration still needs email invitation delivery, object-storage upload and document indexing, comments/notifications persistence, and tenant-wide permission matrices. CAD/FEA/CFD support is currently assistance and planning guidance rather than a solver. Research citations come from Crossref metadata and should be reviewed by an engineer before inclusion in a controlled report. These limits are visible in the UI and do not block the core demo flows.
