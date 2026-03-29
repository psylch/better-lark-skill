# 视频会议

查询已结束的会议记录、获取会议纪要产物（总结、待办、章节、逐字稿）。

> **注意**：查询未开始的会议日程请使用 [calendar.md](calendar.md)。本模块仅处理已结束的会议。

## Shortcuts

| Shortcut | 说明 | 详细文档 |
|----------|------|---------|
| `+search` | 搜索会议记录（支持时间/关键词/参与者筛选） | [lark-vc-search.md](lark-vc-search.md) |
| `+notes` | 获取会议纪要（总结、待办、章节、逐字稿） | [lark-vc-notes.md](lark-vc-notes.md) |

## 常用流程

```bash
# 搜索昨天的会议
lark-cli vc +search --start "2026-03-27" --end "2026-03-28"

# 获取会议纪要
lark-cli vc +notes --meeting-id <meeting_id>
```

## 权限

| 操作 | scope | 身份 |
|------|-------|------|
| 搜索会议 | `vc:meeting:readonly` | user |
| 获取纪要 | `minutes:minutes:readonly` | user |
