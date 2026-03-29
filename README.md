# lark

[中文文档](README.zh.md)

Unified [lark-cli](https://github.com/larksuite/cli) skill for Feishu/Lark — all-in-one access to messaging, docs, spreadsheets, databases, calendar, tasks, drive, email, contacts, wiki, meetings, whiteboard, and more.

Consolidates 19 separate lark-* skills into a single, modular skill with on-demand reference loading.

## Installation

### Via skills.sh (recommended)

```bash
npx skills add psylch/lark-skill -g -y
```

### Manual Install

```bash
git clone https://github.com/psylch/lark-skill.git ~/.claude/skills/lark
```

Restart your agent after installation.

## Prerequisites

- Any AI coding agent that supports [skills.sh](https://skills.sh/) (Claude Code, Cursor, Windsurf, etc.)
- [lark-cli](https://github.com/larksuite/cli) installed (`npm install -g @larksuite/cli`)

## Modules

| Module | Description |
|--------|-------------|
| IM | Send/receive messages, manage groups |
| Docs | Create/edit cloud documents from Markdown |
| Sheets | Read/write spreadsheets |
| Base | Multi-dimensional tables (Bitable) |
| Calendar | Schedule, free/busy, suggestions |
| Task | Todos, task lists, assignments |
| Drive | Upload/download files, permissions |
| Mail | Email with safety rules |
| Contact | Search employees, org structure |
| Wiki | Knowledge base management |
| VC | Meeting records and notes |
| Minutes | AI-generated meeting summaries |
| Whiteboard | Diagrams and visualizations |
| Event | Real-time event subscriptions |
| Switch | Multi-account profile management |

## Usage

The skill activates automatically based on context. Examples:

```
> 查看今天的日程
> 发个消息给张三
> 切换到 einsia 账号
> 创建一个多维表格
> 搜索云空间里的文档
```

## License

MIT
