# Skill 创建

基于 lark-cli 创建新 Skill。Skill = 一份 SKILL.md，教 AI 用 CLI 命令完成任务。

## CLI 核心能力

```bash
lark-cli <service> <resource> <method>          # 已注册 API
lark-cli <service> +<verb>                      # Shortcut（高级封装）
lark-cli api <METHOD> <path> [--data/--params]  # 任意飞书 OpenAPI
lark-cli schema <service.resource.method>       # 查参数定义
```

优先级：Shortcut > 已注册 API > `api` 裸调。

## 调研 API

```bash
# 1. 查看已有 API 和 Shortcut
lark-cli <service> --help

# 2. 查参数定义
lark-cli schema <service.resource.method>

# 3. 未注册的 API
lark-cli api GET /open-apis/xxx --params '{}'
```

如无法覆盖需求，使用 [openapi-explorer.md](openapi-explorer.md) 从文档库挖掘。

## SKILL.md 模板

```markdown
---
name: lark-<name>
version: 1.0.0
description: "<功能描述>。当用户需要<触发场景>时使用。"
metadata:
  requires:
    bins: ["lark-cli"]
---

# <标题>

## 命令

\`\`\`bash
lark-cli api POST /open-apis/xxx --data '{...}'
\`\`\`

## 权限

| 操作 | 所需 scope |
|------|-----------|
| xxx | `scope:name` |
```

## 关键原则

- **description 决定触发** — 包含功能关键词 + "当用户需要...时使用"
- **认证** — 说明所需 scope
- **安全** — 写入操作前确认用户意图
- **编排** — 说明数据传递、失败回滚、可并行步骤
