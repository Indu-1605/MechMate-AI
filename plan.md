# MechMate AI — implementation and design plan

## Scope and delivery approach

MechMate AI will ship as a portfolio-ready engineering operations cockpit built on the initialized React/TypeScript/Express/tRPC/Drizzle starter. The first complete slice prioritizes a real, navigable product over disconnected mock screens:

- project switching, local-first persistence, and a backend persistence hook for signed-in users;
- mission control dashboard with project health, progress, blockers, deadlines, workload, and recommendations derived from the current project data;
- Kanban task management with assignments, priorities, status, due dates, milestones, dependencies, and progress updates;
- named AI conversations with persistent client history and a server-side Manus LLM route when configured;
- explicit rule-based fallback when no model call is possible, labeled as such rather than presented as AI;
- engineering tools for unit conversion, GD&T reference, research/citation lookup, simulation planning, and report export;
- theme switching, responsive navigation, activity feed, notifications, collaboration/invitation affordances, and authentication entry points;
- source documentation, demo data, environment template, Windows setup, deployment notes, and limitations.

The requested FastAPI/PostgreSQL preference is documented as an interoperability option; this managed starter uses Express/tRPC/Drizzle over the provisioned MySQL-compatible database so it stays native to the available runtime and persistent storage. The server modules are separated so a FastAPI/PostgreSQL adapter can be added later without replacing the UI.

## Architecture

- `client/src/pages/Home.tsx`: responsive product shell and routed cockpit views.
- `client/src/lib/mechmate-data.ts`: typed demo data, local persistence, and derived metrics.
- `client/src/components/mechmate/*`: reusable cards, charts, board columns, dialogs, and agent timeline.
- `server/routers.ts`: protected tRPC procedures for workspace persistence and server-side agent invocation.
- `server/db.ts` and `drizzle/schema.ts`: additive workspace snapshot persistence with owner-scoped access.
- `public/manus-routes.json`: route manifest required by Webdev.
- `README.md`, `.env.example`, `TODO.md`: handoff, setup, and known limitations.

## Design system

### Style options considered

1. **0.04 — Mission-control noir:** dark aerospace instrumentation, luminous blue telemetry, dense but calm operational panels.
2. **0.07 — Precision atelier:** graphite surfaces, cream paper accents, and editorial engineering documentation.
3. **0.03 — Electric lab:** high-contrast cobalt and acid-green experimental interface with oversized data readouts.

### Chosen movement: Mission-control noir

**Core principles:** make project state legible at a glance; make AI actions inspectable; keep controls tactile and restrained; use whitespace to create confidence rather than decoration.

**Color philosophy:** navy-black backgrounds create a quiet operations room; cobalt is the ownable signal color for active work; cool cyan marks verified system output; amber is reserved for risk and deadlines; muted steel text keeps long sessions comfortable.

**Layout paradigm:** a fixed rail anchors navigation while the main canvas behaves like a stitched telemetry wall: a wide status band, asymmetric metric cards, a dominant work surface, and a narrow evidence rail.

**Signature elements:** `MM` monogram in a cut-corner badge; hairline blue telemetry rules; status chips with tiny live dots and soft blue glow.

**Interaction philosophy:** every action should reveal state. Buttons update local data immediately, save state to storage, and show a toast. AI work exposes plan → tool → validation → result instead of hiding everything behind a spinner.

**Animation:** 160–240ms ease-out transitions; staggered card entrance only on view changes; progress bars animate once; respect reduced motion.

**Typography system:** Manrope for UI and labels, IBM Plex Mono for IDs, status values, formulas, and citations. Headings use tight tracking and sentence case; labels are compact uppercase with generous letter spacing.

**Brand essence:** the operating system for engineers who want AI to move work forward, not just generate text. Personality: precise, candid, momentum-driven.

**Brand voice:** direct, operational, and evidence-led. Example lines: “Turn the next unknown into a verified move.” / “No black boxes. Every run leaves a trace.”

**Wordmark & logo:** compact `MM` monogram with a diagonal cut suggesting a mechanical linkage, paired with a lower-case wordmark and a small “engineering intelligence” descriptor.

**Signature brand color:** telemetry cobalt `#4F8CFF`.

## Build workflow

1. Implement the data model, UI shell, and route manifest.
2. Add the tRPC agent and workspace persistence procedures with permission checks.
3. Add database schema/migration, then run typecheck/build and fix actionable diagnostics.
4. Start Preview on port 3000, verify `/manus-routes.json` and core screens, then commit to the managed canonical remote.
5. Leave publishing as a separate user-controlled action unless explicitly requested.

## Limitations called out in the handoff

- No claim is made that a model call succeeded when platform credentials or a model response are unavailable; the fallback is explicitly labeled.
- Browser file upload, full CAD/FEA/CFD solvers, email delivery, and production-grade multi-tenant collaboration require a follow-up backend iteration; the shipped UI exposes honest entry points and records the limitation.
- The managed project uses its provisioned MySQL-compatible database through Drizzle rather than FastAPI/PostgreSQL because that is the available managed runtime contract.
