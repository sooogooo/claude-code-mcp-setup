# Skills 使用指南

## 什么是 Skills?

Skills 是 Claude Code 的可复用功能模块，提供特定领域的专业能力。

## 安装 Skills

### 全局安装

全局安装的 Skills 对所有项目可用:

```bash
claude skill install <skill-name>
```

### 项目安装

项目安装的 Skills 只对当前项目可用:

```bash
cd your-project
mkdir -p .claude/skills
# 复制 skill 到 .claude/skills/
```

## Skills 分类

### 1. 通用开发技能

| Skill | 用途 | 安装命令 |
|-------|------|---------|
| skill-creator | 创建新技能 | `claude skill install skill-creator` |
| find-skills | 查找/安装技能 | `claude skill install find-skills` |

### 2. 文档处理技能

| Skill | 用途 |
|-------|------|
| docx | Word 文档 |
| pdf | PDF 操作 |
| pptx | PowerPoint |
| pptx-posters | 研究海报 |
| xlsx | Excel/CSV |
| markitdown | 文档转换 |

### 3. 前端/UI 技能

| Skill | 用途 |
|-------|------|
| frontend-design | 前端设计模式 |
| ui-ux-pro-max | UI/UX 设计 |
| web-artifacts-builder | Web 构建 |
| canvas-design | Canvas 绘图 |
| algorithmic-art | 算法艺术 |

### 4. 科学计算技能

| Skill | 用途 |
|-------|------|
| scientific-brainstorming | 科学头脑风暴 |
| scientific-critical-thinking | 批判性思维 |
| scientific-writing | 科学写作 |
| scientific-slides | 幻灯片 |
| scientific-visualization | 可视化 |
| scientific-schematics | 图表 |
| research-lookup | 研究查询 |

### 5. 生物医学技能

| Skill | 用途 |
|-------|------|
| biomni | 生物医学 AI |
| biorxiv-database | 预印本数据库 |
| bioservices | 生物服务 |
| chembl-database | 药物数据 |
| clinvar-database | 变异数据 |
| clinpgx-database | 药物基因组 |
| clinical-decision-support | 临床决策 |
| clinical-reports | 临床报告 |
| clinicaltrials-database | 临床试验 |
| drugbank-database | 药物数据库 |
| pubchem-database | 化学数据库 |
| treatment-plans | 治疗方案 |

### 6. 生信计算技能

| Skill | 用途 |
|-------|------|
| scikit-learn | 机器学习 |
| scikit-bio | 生物序列 |
| scikit-survival | 生存分析 |
| pydeseq2 | 差异表达 |
| scanpy | 单细胞分析 |
| rdkit | 化学信息学 |
| networkx | 网络分析 |

### 7. 品牌/市场技能

| Skill | 用途 |
|-------|------|
| brand-guidelines | 品牌指南 |
| market-research-reports | 市场报告 |
| media-downloader | 媒体下载 |
| zimage-skill | 图片生成 |
| pretty-mermaid | Mermaid 图表 |

## 项目级 Skills

### 创建项目级 Skill

1. 创建目录:

```bash
mkdir -p .claude/skills/my-custom-skill
```

2. 创建 SKILL.md:

```markdown
---
description: '我的自定义技能'
---

# 我的自定义技能

这个技能用于...
```

3. 使用技能:

```bash
# 直接使用
/claude-skill my-custom-skill
```

### 项目级 Skills 结构

```
.claude/skills/
├── my-skill-1/
│   ├── SKILL.md
│   ├── scripts/
│   └── data/
├── my-skill-2/
│   ├── SKILL.md
│   └── ...
└── README.md
```

## 常用命令

```bash
# 列出已安装的 Skills
claude skill list

# 查看 Skill 详情
claude skill show <skill-name>

# 卸载 Skill
claude skill uninstall <skill-name>

# 更新 Skills
claude skill update
```

## 故障排除

### Skill 不显示

```bash
# 检查 Skills 目录
ls ~/.claude/skills/

# 检查项目 Skills
ls .claude/skills/
```

### Skill 安装失败

```bash
# 检查网络
curl -I https://claude.com

# 重试安装
claude skill install <skill-name> --verbose
```

### Skill 使用出错

查看 Skill 文档了解正确用法:

```bash
claude skill show <skill-name>
```

## 推荐的 Skills 组合

### Web 开发项目

```bash
claude skill install frontend-design
claude skill install web-artifacts-builder
claude skill install docx pdf xlsx
```

### 数据科学项目

```bash
claude skill install scikit-learn
claude skill install scientific-writing
claude skill install scientific-visualization
```

### 医疗研究项目

```bash
claude skill install clinical-decision-support
claude skill install treatment-plans
claude skill install biomni
```

### 药物研发项目

```bash
claude skill install chembl-database
claude skill install drugbank-database
claude skill install rdkit
```
