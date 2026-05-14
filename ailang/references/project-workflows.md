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

## Use a local SDK in a repo

```bash
scripts/select-toolchain.sh local .
```

The project selector writes `ailang-toolchain.toml`. Keep that file only when
the project should intentionally pin a local or versioned SDK.
