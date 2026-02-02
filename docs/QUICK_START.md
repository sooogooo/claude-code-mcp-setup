# Claude Code MCP Plugins & Skills 快速开始指南

## 一分钟快速部署

```bash
# 1. 克隆配置项目
git clone https://github.com/YOUR_USERNAME/claude-code-mcp-setup.git
cd claude-code-mcp-setup

# 2. 选择你的项目类型并安装
# Web 开发
./install.sh --web-dev

# Agent/Plugin 开发
./install.sh --agent-dev

# 科学计算
./install.sh --scientific

# 生物医学
./install.sh --biomed

# 3. 复制到你的项目
cp -r .claude /path/to/your-project/
```

## 详细步骤

### 步骤 1: 准备工作

确保你已经安装 Claude Code:

```bash
# 检查安装
claude --version

# 如果未安装，请访问 https://claude.com/downloads
```

### 步骤 2: 克隆配置仓库

```bash
git clone https://github.com/YOUR_USERNAME/claude-code-mcp-setup.git
cd claude-code-mcp-setup
```

### 步骤 3: 选择配置模板

根据你的项目类型选择合适的配置:

| 项目类型 | 安装命令 |
|---------|---------|
| 最小配置 | `./install.sh --minimal` |
| Web 开发 | `./install.sh --web-dev` |
| Agent 开发 | `./install.sh --agent-dev` |
| 科学计算 | `./install.sh --scientific` |
| 生物医学 | `./install.sh --biomed` |

### 步骤 4: 安装全局插件

```bash
# 核心插件 (所有项目都需要)
claude plugin install context7@claude-plugins-official
claude plugin install github@claude-plugins-official

# 根据项目类型安装其他插件
claude plugin install code-review@claude-plugins-official
claude plugin install feature-dev@claude-plugins-official
```

### 步骤 5: 安装全局 Skills

```bash
# 通用 Skills
claude skill install docx
claude skill install pdf
claude skill install xlsx
claude skill install pptx

# Web 开发
claude skill install frontend-design
claude skill install web-artifacts-builder

# 科学计算
claude skill install scientific-brainstorming
claude skill install scientific-writing
claude skill install research-lookup
```

### 步骤 6: 复制到项目

```bash
# 复制 .claude 目录到项目根目录
cp -r .claude /path/to/your-project/

# 重启 Claude Code 使配置生效
```

## 验证安装

```bash
# 检查配置
cat .claude/settings.local.json

# 检查命令是否可用
claude --help
```

## 常见问题

### Q: 配置没有生效?
A: 重启 Claude Code 或重新打开终端

### Q: 插件安装失败?
A: 确认已登录 Claude Code 账号

### Q: Commands 不显示?
A: 确认 `.claude/commands/` 目录存在且包含 `.md` 文件

## 下一步

- 阅读 [PLUGINS_GUIDE.md](PLUGINS_GUIDE.md) 了解插件详情
- 阅读 [SKILLS_GUIDE.md](SKILLS_GUIDE.md) 了解技能详情
- 查看 [README.md](../README.md) 完整文档
