# AiLang Codex Skill

Codex skill for creating, running, building, publishing, and maintaining
AiLang projects, including package restore and package tool workflows.

## Status

This repository owns the Codex-facing AiLang skill. It teaches Codex the public
SDK install, `ailang init`, package restore, build, run, publish, and debug
workflow commands.

Use this with the public AiLangCore SDK:

```bash
curl -fsSL https://ailang.codes/install.sh | sh
export PATH="$HOME/.ailang/bin:$PATH"
```

## Install

Install the skill locally from this checkout:

```bash
./scripts/install.sh
```

Then ask Codex:

```text
Use $ailang to create a new AiLang project named MyApp and run it.
```

Useful prompts:

```text
Use $ailang to initialize a Codex-ready AiLang CLI project named MyApp.
Use $ailang to add the aivectra package and create a UI project.
Use $ailang to restore packages, build this project, and run it.
Use $ailang to publish this project as a self-contained app for my current platform.
```

## Scope

- Skill metadata and instructions live in `ailang/SKILL.md`.
- `scripts/install.sh` installs the skill into the local Codex skill directory.
- The skill should point agents at public SDK commands, not repo-private
  shortcuts, unless the user is explicitly working in the AiLangCore source
  workspace.

Project sources:

- [AiLang](https://github.com/AiLangCore/AiLang)
- [AiVM](https://github.com/AiLangCore/AiVM)
- [AiVectra](https://github.com/AiLangCore/AiVectra)
- [Public website](https://ailang.codes/)
