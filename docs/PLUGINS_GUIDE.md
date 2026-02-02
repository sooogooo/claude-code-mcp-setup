# MCP Plugins 使用指南

## 什么是 MCP Plugins?

MCP (Model Context Protocol) Plugins 是 Claude Code 的扩展模块，提供特定功能的集成。

## 安装方式

### 全局安装 (用户级)

全局安装的插件对所有项目可用:

```bash
claude plugin install <plugin-name>
```

### 项目安装

项目安装的插件只对当前项目可用:

```bash
cd your-project
claude plugin install <plugin-name>
```

## 推荐插件清单

### 核心插件 (建议全局安装)

| 插件 | 用途 | 命令 |
|------|------|------|
| context7 | 文档查询 | `context7@claude-plugins-official` |
| github | GitHub 集成 | `github@claude-plugins-official` |
| supabase | Supabase 数据库 | `supabase@claude-plugins-official` |

### 开发工作流插件 (按项目安装)

| 插件 | 用途 | 推荐项目 |
|------|------|---------|
| code-review | 自动代码审查 | 所有项目 |
| commit-commands | Git 提交命令 | 所有项目 |
| feature-dev | 功能开发工作流 | 开发项目 |
| security-guidance | 安全最佳实践 | 安全敏感项目 |
| pr-review-toolkit | PR 审查工具 | 团队项目 |

### 前端开发插件

| 插件 | 用途 |
|------|------|
| frontend-design | 前端设计模式 |
| playwright | E2E 测试 |

### Agent/Plugin 开发插件

| 插件 | 用途 |
|------|------|
| agent-sdk-dev | Agent SDK 开发 |
| plugin-dev | 插件开发 |

### 输出风格插件

| 插件 | 用途 |
|------|------|
| learning-output-style | 学习输出风格 |
| explanatory-output-style | 解释输出风格 |

## 插件配置

### 启用/禁用插件

在 `.claude/settings.local.json` 中配置:

```json
{
  "enabledPlugins": {
    "plugin-name@source": true
  }
}
```

### 环境变量

部分插件需要配置环境变量:

```json
{
  "env": {
    "GITHUB_TOKEN": "your-github-token",
    "SUPABASE_URL": "your-supabase-url",
    "SUPABASE_KEY": "your-supabase-key"
  }
}
```

## 故障排除

### 插件无法安装

```bash
# 检查网络连接
curl -I https://claude.com

# 检查登录状态
claude auth status
```

### 插件不工作

1. 检查是否已启用
2. 检查环境变量配置
3. 查看日志

```bash
# 查看 Claude Code 日志
claude logs
```

### 插件冲突

如果多个插件冲突，尝试禁用部分插件:

```json
{
  "enabledPlugins": {
    "plugin-a@source": true,
    "plugin-b@source": false
  }
}
```

## 更新插件

```bash
# 更新所有插件
claude plugin update

# 更新特定插件
claude plugin update <plugin-name>
```

## 卸载插件

```bash
claude plugin uninstall <plugin-name>
```
