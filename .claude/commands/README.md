# Bmad Commands 集合

此目录包含 Bmad 工作流的 Commands，用于敏捷开发和协作。

## 目录结构

```
.claude/commands/
├── agent/                    # Agent Commands
│   ├── bmad_agent_bmad-master.md
│   ├── bmad_bmm_agent_dev.md
│   ├── bmad_bmm_agent_analyst.md
│   ├── bmad_bmm_agent_architect.md
│   ├── bmad_bmm_agent_pm.md
│   ├── bmad_bmm_agent_ux-designer.md
│   └── bmad_bmm_agent_tech-writer_tech-writer.md
├── planning/                 # 规划 Commands
│   ├── bmad_bmm_create-prd.md
│   ├── bmad_bmm_create-product-brief.md
│   ├── bmad_bmm_create-architecture.md
│   ├── bmad_bmm_create-ux-design.md
│   ├── bmad_bmm_create-epics-and-stories.md
│   ├── bmad_bmm_create-story.md
│   └── bmad_bmm_research.md
├── development/              # 开发 Commands
│   ├── bmad_bmm_quick-dev.md
│   ├── bmad_bmm_quick-spec.md
│   ├── bmad_bmm_dev-story.md
│   └── bmad_bmm_correct-course.md
├── review/                   # 评审 Commands
│   ├── bmad_bmm_code-review.md
│   ├── bmad_bmm_check-implementation-readiness.md
│   └── bmad_review-adversarial-general.md
├── visualization/            # 可视化 Commands
│   ├── bmad_bmm_create-excalidraw-diagram.md
│   ├── bmad_bmm_create-excalidraw-flowchart.md
│   ├── bmad_bmm_create-excalidraw-wireframe.md
│   └── bmad_bmm_create-excalidraw-dataflow.md
├── testing/                  # 测试 Commands
│   ├── bmad_bmm_testarch-test-design.md
│   ├── bmad_bmm_testarch-framework.md
│   ├── bmad_bmm_testarch-ci.md
│   ├── bmad_bmm_testarch-automate.md
│   ├── bmad_bmm_testarch-atdd.md
│   ├── bmad_bmm_testarch-nfr.md
│   ├── bmad_bmm_testarch-test-review.md
│   └── bmad_bmm_testarch-trace.md
├── sprint/                   # Sprint Commands
│   ├── bmad_bmm_sprint-planning.md
│   ├── bmad_bmm_sprint-status.md
│   └── bmad_bmm_retrospective.md
└── collaboration/            # 协作 Commands
    ├── bmad_brainstorming.md
    ├── bmad_party-mode.md
    └── bmad_editorial-review-prose.md
```

## 快速开始

### 新项目初始化
1. `bmad_bmm_quick-spec` - 快速定义规格
2. `bmad_bmm_create-prd` - 创建产品需求文档

### 开发阶段
1. `bmad_bmm_quick-dev` - 快速开发
2. `bmad_bmm_dev-story` - 按故事开发

### 代码评审
1. `bmad_bmm_code-review` - 代码审查
2. `bmad_bmm_check-implementation-readiness` - 检查就绪状态

## 推荐的最小 Commands 集合

如果只需要核心功能，安装以下 Commands 即可:

```
.claude/commands/
├── bmad_bmm_quick-dev.md
├── bmad_bmm_quick-spec.md
├── bmad_bmm_dev-story.md
├── bmad_bmm_code-review.md
├── bmad_bmm_create-excalidraw-diagram.md
└── bmad_bmm_sprint-status.md
```

## 完整安装

```bash
# 复制所有 commands
cp -r path/to/claude-package/.claude/commands/* .claude/commands/
```

## 注意事项

- 这些 commands 依赖于 `scientific-skills` plugin
- 部分 commands 需要配置相应的 workflow 文件
- 建议配合 Bmad Agent 一起使用
