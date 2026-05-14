---
name: ailang
description: Create, inspect, build, run, publish, and maintain AiLang projects. Use when Codex is asked to install AiLang, create a new AiLang project, initialize a Codex-ready AiLang app, work inside an AiLang project, use AiVM or AiVectra from AiLang, select an AiLang SDK/toolchain, or prepare AiLang project output for local development or alpha release.
---

# AiLang

## Core Workflow

When asked to create a new AiLang project:

1. Verify `ailang` is available:
   ```bash
   command -v ailang
   ailang --version
   ```
2. If missing, install the public alpha SDK:
   ```bash
   curl -fsSL https://ailang.codes/install.sh | sh
   export PATH="$HOME/.ailang/bin:$PATH"
   ```
3. Initialize the project with Codex agent instructions:
   ```bash
   ailang init <ProjectName> --agent codex
   ```
4. Enter the project and follow its generated `AGENTS.md`:
   ```bash
   cd <ProjectName>
   ailang run .
   ```
5. For a complete check, also run:
   ```bash
   ailang build .
   ailang publish . --out dist
   ```

Do not assume AiLang is installed. Check first, install if needed, then continue.

## Project Rules

- Treat `project.aiproj` as the project file.
- Treat `src/app.aos` as the default app entry source for initialized apps.
- Prefer `ailang init` templates over hand-creating project files.
- Keep generated output out of source control: `.ai/`, `.tmp/`, `.toolchain/`, `.artifacts/`, and `dist/`.
- Use the generated project `AGENTS.md` as the local source of truth once inside a project.
- Do not add backward compatibility layers unless explicitly requested; pre-1.0 contracts are negotiable and should be replaced consistently when changed.

## Common Commands

```bash
ailang --version
ailang help
ailang template list
ailang agent list
ailang init MyApp --agent codex
ailang init MyApp --agents codex,claude
ailang run MyApp
ailang build MyApp
ailang publish MyApp --out dist
ailang clean MyApp
```

## Toolchain Selection

Use the installed current SDK by default. For local AiLangCore development, a project may select the mutable local SDK:

```bash
scripts/select-toolchain.sh local <project-dir>
```

When working inside an AiLangCore checkout, update the local SDK from the workspace with:

```bash
cd AiLang
./scripts/update-local-toolchain.sh
```

## Repository Boundaries

- AiLang owns the compiler/toolset, core libraries, SDK, specs, templates, and examples.
- AiVM owns the native C virtual machine, AiBC execution, syscall boundary, and `aivm`.
- AiVectra owns vector UI library/tooling and visual contract behavior.

Do not put VM execution/syscall behavior in AiLang or UI behavior in AiVM.

## Validation

For a generated app, run:

```bash
ailang run .
ailang build .
ailang publish . --out dist
```

For the main repositories:

```bash
cd AiLang && ./test.sh
cd AiVM && ./test-aivm-c.sh
cd AiVectra && ./scripts/test-all.sh
```

If a command fails, report the exact command, exit code, and error output before changing code.
