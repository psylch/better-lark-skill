---
name: better-lark
description: "飞书/Lark 全功能 CLI skill：即时通讯、云文档、电子表格、多维表格、日历、任务、云空间、邮箱、通讯录、知识库、视频会议、妙记、画板、事件订阅、账号切换。触发词：飞书、lark、feishu、lark-cli、发消息、查日程、创建文档、切换账号、发邮件、搜索员工、多维表格、上传文件、会议纪要、日报、standup。"
metadata:
  requires:
    bins: ["lark-cli"]
---

# Lark CLI

## Language

**Match user's language**: Respond in the same language the user uses.

## Preflight

```bash
bash <SKILL_DIR>/scripts/helper.sh preflight
```

## Module Router

根据用户需求，用 Read 工具读取对应的 reference 文档，然后按文档指引执行操作。

| 模块 | 触发关键词 | Reference |
|------|-----------|-----------|
| 认证/配置 | 配置、登录、权限、scope、auth | [shared.md](references/shared.md) |
| 账号切换 | 切换账号、switch、profile | [switch.md](references/switch.md) |
| 即时通讯 | 消息、群聊、发消息、chat | [im.md](references/im.md) |
| 云文档 | 文档、创建文档、doc | [doc.md](references/doc.md) |
| 电子表格 | 表格、spreadsheet、sheets | [sheets.md](references/sheets.md) |
| 多维表格 | 多维表格、base、bitable | [base.md](references/base.md) |
| 日历 | 日程、日历、会议、calendar | [calendar.md](references/calendar.md) |
| 任务 | 任务、待办、todo、task | [task.md](references/task.md) |
| 云空间 | 文件、上传、下载、drive | [drive.md](references/drive.md) |
| 邮箱 | 邮件、邮箱、mail、email | [mail.md](references/mail.md) |
| 通讯录 | 搜索员工、通讯录、contact | [contact.md](references/contact.md) |
| 知识库 | 知识库、wiki、空间 | [wiki.md](references/wiki.md) |
| 视频会议 | 会议记录、vc | [vc.md](references/vc.md) |
| 妙记 | 妙记、minutes | [minutes.md](references/minutes.md) |
| 画板 | 画板、白板、图表、whiteboard | [whiteboard.md](references/whiteboard.md) |
| 事件订阅 | 监听、事件、subscribe | [event.md](references/event.md) |
| API 探索 | 原生API、openapi、未封装 | [openapi-explorer.md](references/openapi-explorer.md) |
| 工作流 | 日报、standup、会议总结 | [workflows.md](references/workflows.md) |
| Skill 创建 | 创建skill、封装API | [skill-maker.md](references/skill-maker.md) |

**使用模式**：识别模块 → Read reference → 如有子文档按需 Read → 执行 `lark-cli` 命令。

## 认证速查

```bash
lark-cli config init --new                          # 首次配置
lark-cli auth login --domain <domain>                # 用户身份登录（按域）
lark-cli auth login --scope "<scope>"                # 用户身份登录（按 scope）
lark-cli auth status                                 # 检查状态
```

两种身份：`--as user`（用户资源）vs `--as bot`（应用级操作）。详见 [shared.md](references/shared.md)。

## 账号切换速查

```bash
source ~/.lark-cli/switch.sh <profile>    # 切换
source ~/.lark-cli/switch.sh              # 列出所有
lark-cli auth status                      # 验证
```

详见 [switch.md](references/switch.md)。

## 安全规则

- **禁止输出密钥**（appSecret、accessToken）到终端明文
- **写入/删除操作前必须确认用户意图**
- 用 `--dry-run` 预览危险请求

<!-- Keep this file under 200 lines. Detailed docs in references/. -->
