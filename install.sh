#!/bin/bash

#===============================================================================
# Claude Code MCP Plugins & Skills 部署脚本
#===============================================================================
# 用法:
#   ./install.sh                    # 交互式安装
#   ./install.sh --minimal          # 最小安装 (仅基础配置)
#   ./install.sh --web-dev          # Web 开发配置
#   ./install.sh --agent-dev        # Agent 开发配置
#   ./install.sh --scientific       # 科学计算配置
#   ./install.sh --biomed           # 生物医学配置
#   ./install.sh --force            # 强制覆盖
#===============================================================================

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 配置
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_DIR="$SCRIPT_DIR"
PROJECT_DIR="${SCRIPT_DIR}"
CLAUDE_DIR="$PROJECT_DIR/.claude"

# 默认配置
FORCE=false
PROFILE="minimal"

# 解析参数
while [[ $# -gt 0 ]]; do
    case $1 in
        --force)
            FORCE=true
            shift
            ;;
        --minimal)
            PROFILE="minimal"
            shift
            ;;
        --web-dev)
            PROFILE="web-dev"
            shift
            ;;
        --agent-dev)
            PROFILE="agent-dev"
            shift
            ;;
        --scientific)
            PROFILE="scientific"
            shift
            ;;
        --biomed)
            PROFILE="biomed"
            shift
            ;;
        --help|-h)
            show_help
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            show_help
            exit 1
            ;;
    esac
done

#-------------------------------------------------------------------------------
show_help() {
    echo "Claude Code MCP Plugins & Skills 部署脚本"
    echo ""
    echo "用法: $0 [选项]"
    echo ""
    echo "选项:"
    echo "  --minimal      最小安装 (基础配置)"
    echo "  --web-dev      Web 开发配置"
    echo "  --agent-dev    Agent/Plugin 开发配置"
    echo "  --scientific   科学计算配置"
    echo "  --biomed       生物医学配置"
    echo "  --force        强制覆盖现有文件"
    echo "  --help, -h     显示帮助信息"
    echo ""
    echo "示例:"
    echo "  $0 --web-dev           # 安装 Web 开发配置"
    echo "  $0 --agent-dev --force # 强制重新安装 Agent 开发配置"
}

#-------------------------------------------------------------------------------
print_step() {
    echo -e "${BLUE}[步骤 $1]${NC} $2"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

#-------------------------------------------------------------------------------
check_prerequisites() {
    print_step "0/3" "检查前置条件..."

    # 检查是否是 Git 仓库
    if [ -d ".git" ]; then
        print_success "当前目录是 Git 仓库"
    else
        print_warning "当前目录不是 Git 仓库，建议先初始化: git init"
    fi

    # 检查 Claude Code 是否可用
    if command -v claude &> /dev/null; then
        print_success "Claude Code CLI 已安装"
    else
        print_warning "Claude Code CLI 未找到，请先安装"
        print_info "安装方式: https://claude.com/downloads"
    fi

    echo ""
}

#-------------------------------------------------------------------------------
setup_directories() {
    print_step "1/3" "创建目录结构..."

    # 创建 .claude 目录
    mkdir -p "$CLAUDE_DIR/skills"
    mkdir -p "$CLAUDE_DIR/commands"

    print_success "目录结构创建完成"
}

#-------------------------------------------------------------------------------
copy_config() {
    print_step "2/3" "复制配置文件..."

    # 复制基础配置
    if [ -f "$PACKAGE_DIR/.claude/settings.local.json" ]; then
        if [ ! -f "$CLAUDE_DIR/settings.local.json" ] || [ "$FORCE" = true ]; then
            cp "$PACKAGE_DIR/.claude/settings.local.json" "$CLAUDE_DIR/settings.local.json"
            print_success "复制 settings.local.json"
        else
            print_info "settings.local.json 已存在，使用 --force 覆盖"
        fi
    fi

    # 复制 Commands
    if [ -d "$PACKAGE_DIR/.claude/commands" ]; then
        for cmd in "$PACKAGE_DIR/.claude/commands"/*.md; do
            if [ -f "$cmd" ]; then
                filename=$(basename "$cmd")
                if [ ! -f "$CLAUDE_DIR/commands/$filename" ] || [ "$FORCE" = true ]; then
                    cp "$cmd" "$CLAUDE_DIR/commands/$filename"
                    print_success "复制 $filename"
                fi
            fi
        done
    fi

    # 复制 Skills README
    if [ -f "$PACKAGE_DIR/.claude/skills/README.md" ]; then
        cp "$PACKAGE_DIR/.claude/skills/README.md" "$CLAUDE_DIR/skills/README.md"
    fi

    # 复制 Commands README
    if [ -f "$PACKAGE_DIR/.claude/commands/README.md" ]; then
        cp "$PACKAGE_DIR/.claude/commands/README.md" "$CLAUDE_DIR/commands/README.md"
    fi

    print_success "配置文件复制完成"
}

#-------------------------------------------------------------------------------
apply_profile() {
    print_step "3/3" "应用配置模板: $PROFILE..."

    local config_file="$CLAUDE_DIR/settings.local.json"

    case $PROFILE in
        minimal)
            # 基础配置 - 核心插件
            cat > "$config_file" << 'EOF'
{
  "env": {
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
  },
  "enabledPlugins": {
    "context7@claude-plugins-official": true,
    "github@claude-plugins-official": true
  }
}
EOF
            print_success "已应用最小配置"
            ;;
        web-dev)
            # Web 开发配置
            cat > "$config_file" << 'EOF'
{
  "env": {
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
  },
  "enabledPlugins": {
    "context7@claude-plugins-official": true,
    "github@claude-plugins-official": true,
    "code-review@claude-plugins-official": true,
    "commit-commands@claude-plugins-official": true,
    "feature-dev@claude-plugins-official": true,
    "frontend-design@claude-plugins-official": true,
    "playwright@claude-plugins-official": false,
    "vercel@claude-plugins-official": false
  }
}
EOF
            print_success "已应用 Web 开发配置"
            ;;
        agent-dev)
            # Agent/Plugin 开发配置
            cat > "$config_file" << 'EOF'
{
  "env": {
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
  },
  "enabledPlugins": {
    "context7@claude-plugins-official": true,
    "github@claude-plugins-official": true,
    "agent-sdk-dev@claude-plugins-official": true,
    "plugin-dev@claude-plugins-official": true,
    "code-review@claude-plugins-official": true,
    "commit-commands@claude-plugins-official": true,
    "feature-dev@claude-plugins-official": true,
    "security-guidance@claude-plugins-official": true
  }
}
EOF
            print_success "已应用 Agent 开发配置"
            ;;
        scientific)
            # 科学计算配置
            cat > "$config_file" << 'EOF'
{
  "env": {
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
  },
  "enabledPlugins": {
    "context7@claude-plugins-official": true,
    "github@claude-plugins-official": true,
    "learning-output-style@claude-plugins-official": true,
    "explanatory-output-style@claude-plugins-official": true
  }
}
EOF
            print_success "已应用科学计算配置"
            ;;
        biomed)
            # 生物医学配置
            cat > "$config_file" << 'EOF'
{
  "env": {
    "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
  },
  "enabledPlugins": {
    "context7@claude-plugins-official": true,
    "github@claude-plugins-official": true,
    "learning-output-style@claude-plugins-official": true,
    "scientific-skills@claude-scientific-skills": true
  }
}
EOF
            print_success "已应用生物医学配置"
            ;;
    esac

    echo ""
}

#-------------------------------------------------------------------------------
print_next_steps() {
    echo ""
    echo "========================================"
    echo -e "${GREEN}安装完成!${NC}"
    echo "========================================"
    echo ""
    echo "下一步操作:"
    echo ""
    echo -e "${BLUE}1. 安装全局 MCP Plugins:${NC}"
    echo "   claude plugin install context7@claude-plugins-official"
    echo "   claude plugin install github@claude-plugins-official"
    echo ""
    echo -e "${BLUE}2. 安装全局 Skills (根据需要):${NC}"

    case $PROFILE in
        web-dev)
            echo "   claude skill install frontend-design"
            echo "   claude skill install web-artifacts-builder"
            echo "   claude skill install docx pdf xlsx pptx"
            ;;
        agent-dev)
            echo "   claude skill install agent-sdk-dev"
            echo "   claude skill install plugin-dev"
            echo "   claude skill install skill-creator"
            ;;
        scientific)
            echo "   claude skill install scientific-brainstorming"
            echo "   claude skill install scientific-writing"
            echo "   claude skill install research-lookup"
            ;;
        biomed)
            echo "   claude skill install clinical-decision-support"
            echo "   claude skill install treatment-plans"
            echo "   claude skill install biorxiv-database"
            ;;
    esac

    echo ""
    echo -e "${BLUE}3. 重启 Claude Code 使配置生效${NC}"
    echo ""
    echo "文档: $PACKAGE_DIR/README.md"
    echo ""
}

#-------------------------------------------------------------------------------
# 主程序
#-------------------------------------------------------------------------------
main() {
    echo ""
    echo "========================================"
    echo "Claude Code MCP Plugins & Skills 部署"
    echo "========================================"
    echo ""

    check_prerequisites
    setup_directories
    copy_config
    apply_profile
    print_next_steps
}

main
