# 项目级 Skills

此目录用于存放项目特定的 Skills。

## 推荐的 Skills 结构

```
.claude/skills/
├── your-custom-skill/
│   ├── SKILL.md
│   ├── scripts/
│   └── data/
└── README.md
```

## 可选安装的项目级 Skills

根据项目类型，选择性安装以下 Skills:

### 通用项目
- `frontend-design` - 前端设计模式
- `web-artifacts-builder` - Web 构建工具
- `skill-creator` - 创建新技能

### 科学/研究项目
- `scientific-brainstorming` - 科学头脑风暴
- `scientific-writing` - 科学写作
- `scientific-slides` - 科学幻灯片
- `research-lookup` - 研究资料查询

### 医疗/生物项目
- `clinical-decision-support` - 临床决策支持
- `clinical-reports` - 临床报告
- `treatment-plans` - 治疗方案

## 安装方式

```bash
# 方法 1: 复制全局 skills (不推荐，可能造成重复)
cp -r ~/.claude/skills/skill-name .claude/skills/

# 方法 2: 使用符号链接 (推荐)
cd .claude/skills
ln -s ~/.claude/skills/skill-name skill-name
```

## 注意事项

- 项目级 Skills 会覆盖全局同名 Skills
- 建议仅存放项目特定的自定义 Skills
- 通用 Skills 保持全局安装
