SKILL_NAME ?= yhttp-ssr
CODEX_SKILLS_DIR ?= $(if $(SKILLS_DIR),$(SKILLS_DIR),$(if $(CODEX_HOME),$(CODEX_HOME)/skills,$(HOME)/.codex/skills))
CLAUDE_SKILLS_DIR ?= $(HOME)/.claude/skills
GROK_SKILLS_DIR ?= $(HOME)/.grok/skills

CODEX_INSTALL_PATH = $(abspath $(CODEX_SKILLS_DIR)/$(SKILL_NAME))
CLAUDE_INSTALL_PATH = $(abspath $(CLAUDE_SKILLS_DIR)/$(SKILL_NAME))
GROK_INSTALL_PATH = $(abspath $(GROK_SKILLS_DIR)/$(SKILL_NAME))

INSTALL_FILES = SKILL.md README.md LICENSE agents

.PHONY: install-codex install-claude install-grok
.PHONY: uninstall-codex uninstall-claude uninstall-grok

install-codex:
	@mkdir -p "$(CODEX_INSTALL_PATH)"
	@cp -R $(INSTALL_FILES) "$(CODEX_INSTALL_PATH)/"
	@echo "Installed $(SKILL_NAME) for Codex to $(CODEX_INSTALL_PATH)"

install-claude:
	@mkdir -p "$(CLAUDE_INSTALL_PATH)"
	@cp -R $(INSTALL_FILES) "$(CLAUDE_INSTALL_PATH)/"
	@echo "Installed $(SKILL_NAME) for Claude Code to $(CLAUDE_INSTALL_PATH)"

install-grok:
	@mkdir -p "$(GROK_INSTALL_PATH)"
	@cp -R $(INSTALL_FILES) "$(GROK_INSTALL_PATH)/"
	@echo "Installed $(SKILL_NAME) for Grok to $(GROK_INSTALL_PATH)"

uninstall-codex:
	@test -n "$(CODEX_INSTALL_PATH)"
	@test "$(CODEX_INSTALL_PATH)" != "/"
	@test "$(CODEX_INSTALL_PATH)" != "$(CURDIR)"
	@rm -rf -- "$(CODEX_INSTALL_PATH)"
	@echo "Uninstalled $(SKILL_NAME) for Codex from $(CODEX_INSTALL_PATH)"

uninstall-claude:
	@test -n "$(CLAUDE_INSTALL_PATH)"
	@test "$(CLAUDE_INSTALL_PATH)" != "/"
	@test "$(CLAUDE_INSTALL_PATH)" != "$(CURDIR)"
	@rm -rf -- "$(CLAUDE_INSTALL_PATH)"
	@echo "Uninstalled $(SKILL_NAME) for Claude Code from $(CLAUDE_INSTALL_PATH)"

uninstall-grok:
	@test -n "$(GROK_INSTALL_PATH)"
	@test "$(GROK_INSTALL_PATH)" != "/"
	@test "$(GROK_INSTALL_PATH)" != "$(CURDIR)"
	@rm -rf -- "$(GROK_INSTALL_PATH)"
	@echo "Uninstalled $(SKILL_NAME) for Grok from $(GROK_INSTALL_PATH)"
