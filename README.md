# Claude Code MCP Plugins & Skills 部署包

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

这是一个可复用的 Claude Code MCP Plugins 和 Skills 配置包，帮助你在新项目中快速部署开发环境。

## 特性

- **开箱即用**: 复制配置文件即可完成部署
- **分类清晰**: 按用途分类的 Plugins 和 Skills
- **按需选择**: 不同项目类型有对应的推荐配置
- **脚本支持**: 提供自动化安装脚本

## 快速开始

### 方式一: 使用安装脚本 (推荐)

```bash
# 1. 克隆项目
git clone https://github.com/YOUR_USERNAME/claude-code-mcp-setup.git
cd claude-code-mcp-setup

# 2. 复制到你的项目
cp -r .claude /path/to/your-project/
cp install.sh /path/to/your-project/

# 3. 运行安装脚本
cd /path/to/your-project
chmod +x install.sh
./install.sh
```

### 方式二: 手动部署

```bash
# 克隆项目
git clone https://github.com/YOUR_USERNAME/claude-code-mcp-setup.git
cd claude-code-mcp-setup

# 复制 .claude 目录到你的项目根目录
cp -r .claude /path/to/your-project/

# 根据项目类型编辑配置
nano /path/to/your-project/.claude/settings.local.json
```

## 项目结构

```
claude-code-mcp-setup/
├── .claude/
│   ├── settings.local.json      # 项目级配置模板
│   ├── skills/                  # 项目级 Skills
│   │   └── README.md
│   └── commands/                # 项目级 Commands
│       ├── README.md
│       └── bmad_*.md           # Bmad 工作流 Commands
├── config/
│   ├── plugins-config.json      # 完整 Plugins 配置
│   └── skills-categories.md     # Skills 分类说明
├── scripts/
│   ├── install.sh              # 主安装脚本
│   ├── install-plugins.sh      # 插件安装脚本
│   └── link-skills.sh          # Skills 符号链接脚本
├── docs/
│   ├── QUICK_START.md          # 快速开始指南
│   ├── PLUGINS_GUIDE.md        # Plugins 使用指南
│   └── SKILLS_GUIDE.md         # Skills 使用指南
├── .gitignore
├── LICENSE
├── README.md
└── install.sh                  # 入口安装脚本
```

## 配置说明

### settings.local.json

在项目 `.claude/settings.local.json` 中配置启用的 Plugins:

```json
{
  "env": {
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
  },
  "enabledPlugins": {
    "context7@claude-plugins-official": true,
    "github@claude-plugins-official": true,
    "code-review@claude-plugins-official": true,
    "feature-dev@claude-plugins-official": true,
    "security-guidance@claude-plugins-official": true
  }
}
```

## 推荐配置

### 通用 Web 开发项目

**Plugins:**
- `context7`, `github`, `code-review`, `commit-commands`, `feature-dev`

**Skills:**
- `frontend-design`, `web-artifacts-builder`, `docx`, `pdf`, `pptx`

### Agent/Plugin 开发项目

**Plugins:**
- `context7`, `github`, `agent-sdk-dev`, `plugin-dev`, `code-review`

**Skills:**
- `skill-creator`, `agent-sdk-dev`, `code-review`

### 科学计算/研究项目

**Plugins:**
- `context7`, `github`, `learning-output-style`

**Skills:**
- `scientific-brainstorming`, `scientific-writing`, `scientific-slides`
- `research-lookup`, `pydeseq2`, `scanpy`, `scikit-learn`

### 医疗/生物信息学项目

**Plugins:**
- `context7`, `github`, `learning-output-style`

**Skills:**
- `biomni`, `biorxiv-database`, `chembl-database`, `drugbank-database`
- `clinical-decision-support`, `treatment-plans`

## 全局安装 vs 项目安装

### 全局安装 (User Scope)

以下 Plugins 建议全局安装，它们在大多数项目中都会用到:

```bash
claude plugin install context7@claude-plugins-official
claude plugin install github@claude-plugins-official
claude plugin install supabase@claude-plugins-official
```

### 项目安装 (Project Scope)

以下 Plugins 建议按项目安装:

```bash
cd your-project
claude plugin install code-review@claude-plugins-official
claude plugin install feature-dev@claude-plugins-official
claude plugin install security-guidance@claude-plugins-official
```

## 可用的 Commands

### 开发工作流

| Command | 用途 |
|---------|------|
| `/quick-dev` | 快速开发模式 |
| `/quick-spec` | 快速规格定义 |
| `/dev-story` | 按用户故事开发 |
| `/code-review` | 代码审查 |

### 可视化

| Command | 用途 |
|---------|------|
| `/create-excalidraw-flowchart` | 创建流程图 |
| `/create-excalidraw-diagram` | 创建架构图 |

### 项目管理

| Command | 用途 |
|---------|------|
| `/sprint-status` | Sprint 状态 |
| `/sprint-planning` | Sprint 规划 |

## 安装全局 Skills

```bash
# 前端开发
claude skill install frontend-design
claude skill install web-artifacts-builder

# 文档处理
claude skill install docx
claude skill install pdf
claude skill install xlsx
claude skill install pptx

# 科学计算
claude skill install scientific-brainstorming
claude skill install scientific-writing
claude skill install research-lookup

# 医疗/生物
claude skill install clinical-decision-support
claude skill install treatment-plans
```

## 故障排除

### 插件未启用

检查 `settings.local.json` 中的 `enabledPlugins` 配置:

```bash
cat .claude/settings.local.json | grep enabledPlugins
```

### Skills 不显示

确认 Skills 放置在正确的目录:

```bash
# 全局 Skills
ls ~/.claude/skills/

# 项目 Skills
ls .claude/skills/
```

### 符号链接问题

如果 Skills 是符号链接，确保源目录存在:

```bash
# 检查链接
ls -la .claude/skills/

# 重新创建链接
cd .claude/skills
rm skill-name
ln -s ~/.claude/skills/skill-name skill-name
```

## 贡献

欢迎提交 Issue 和 Pull Request!

## 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件

---

**注意**: 本项目仅包含配置文件和安装脚本，实际的 Plugins 和 Skills 需要通过 Claude Code CLI 安装。
