# AiLang Project Workflows

## Create a Codex-ready app

```bash
ailang init MyApp --agent codex
cd MyApp
ailang run .
ailang build .
ailang publish . --out dist
```

## Create a multi-agent app

```bash
ailang init MyApp --agents codex,claude
```

## Inspect available templates and agents

```bash
ailang template list
ailang template show cli
ailang agent list
```

## Add and restore a package

```bash
ailang package list
ailang package add aivectra
ailang package restore
ailang build .
```

Use `ailang package add <name>@<version>` when a specific version is needed.
Use `ailang package remove <name>` to remove a direct package dependency.

After restore, package tools can be run as AiLang subcommands:

```bash
ailang <tool-name> [args...]
```

Built-in commands win over package tools. If a package conflicts with a
built-in, global, or local command name, fix the package metadata or choose a
different tool name instead of adding a compatibility wrapper.

## Use a local SDK in a repo

```bash
scripts/select-toolchain.sh local .
```

The project selector writes `ailang-toolchain.toml`. Keep that file only when
the project should intentionally pin a local or versioned SDK.
