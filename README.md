# YHTTP SSR Skill

A coding-agent skill for building, extending, diagnosing, and reviewing
server-side-rendered [YHTTP](https://github.com/yhttp/yhttp) applications.

The skill guides coding agents through an existing project's composition,
routing, Mako templates, localization, assets, authentication, persistence,
and tests. It favors the project's installed YHTTP extensions and established
conventions over introducing parallel frameworks or infrastructure.

## What it covers

- YHTTP application composition and route or model registration
- Server-rendered pages, shared Mako layouts, forms, and metadata
- Localized routes, translated content, and LTR/RTL behavior
- Alpine.js progressive enhancement and Vite-managed assets
- Authentication-aware pages, authorization, and persistence boundaries
- bddrest and project-native page tests
- Safe worktree inspection, verification, and change reporting

## Install

Ask Codex to install the skill from this repository:

```text
$skill-installer install https://github.com/yhttp/yhttp-ssr-codex-skill
```

Or use the included Makefile to install the skill for Codex, Claude Code, or
Grok. Each install target copies the skill files into that agent's user skills
directory. The matching uninstall target removes only that installed copy; it
does not remove this source checkout.

Install for one agent:

```console
make install-codex
make install-claude
make install-grok
```

The default destinations are `~/.codex/skills`, `~/.claude/skills`, and
`~/.grok/skills`. Codex uses `$CODEX_HOME/skills` when `CODEX_HOME` is set.
Override a destination when needed:

```console
make install-codex CODEX_SKILLS_DIR=/path/to/skills
make install-claude CLAUDE_SKILLS_DIR=/path/to/skills
make install-grok GROK_SKILLS_DIR=/path/to/skills
```

Remove an installation with its matching target:

```console
make uninstall-codex
make uninstall-claude
make uninstall-grok
```

### Other coding agents

The skill uses the `SKILL.md` Agent Skills format, supported by multiple coding
agents. To install it in another compatible agent, find that agent's documented
user skills directory and clone this repository there as `yhttp-ssr`:

```console
AGENT_SKILLS_DIR=/path/to/agent/skills
mkdir -p "$AGENT_SKILLS_DIR"
git clone https://github.com/yhttp/yhttp-ssr-codex-skill.git "$AGENT_SKILLS_DIR/yhttp-ssr"
```

If the agent supports skills but uses a different install workflow, copy this
repository's `SKILL.md` and any required supporting files into its documented
skill directory. Restart or refresh the agent if it does not discover the new
skill automatically.

## Use

Mention the skill explicitly in a Codex prompt:

```text
$yhttp-ssr add a localized contact page with English and Arabic routes.
```

```text
$yhttp-ssr diagnose why this Mako page is not reachable and add a regression test.
```

```text
$yhttp-ssr review the authentication, localization, and asset handling in this SSR feature.
```

Codex can also select the skill automatically when a request matches its scope.

## Repository contents

```text
.
├── SKILL.md                    # Core workflow and implementation guidance
├── agents/openai.yaml          # Skill display metadata and default prompt
└── LICENSE
```

## Scope

This self-contained skill is intended for work in an existing YHTTP codebase.
It has no application-project or auxiliary-reference dependency: the agent
first inspects the target repository, verifies the installed framework and
extension APIs, and follows the nearest complete feature before making
changes. It does not install YHTTP, replace project-specific instructions, or
prescribe a new application architecture.

Every commit made while using this skill must pass the target project's full
coverage suite at exactly 100%. Do not use exclusions, pragmas, lowered
thresholds, or weakened assertions to obtain that result.

## License

Released under the [MIT License](LICENSE).
