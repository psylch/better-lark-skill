# 事件订阅

通过 WebSocket 长连接实时监听飞书事件（消息、通讯录变更、日历变更等）。

## Shortcuts

| Shortcut | 说明 | 详细文档 |
|----------|------|---------|
| `+subscribe` | 订阅飞书事件 | [lark-event-subscribe.md](event/subscribe.md) |

## 基本用法

```bash
# 监听所有事件
lark-cli event +subscribe

# 只监听消息事件
lark-cli event +subscribe --route "im\\.message\\.receive_v1"

# 输出到文件
lark-cli event +subscribe --output events.ndjson
```

## 支持的事件类型

IM 消息、通讯录变更、日历事件、审批、任务、云空间评论等 24 种常见事件类型。详见 [lark-event-subscribe.md](event/subscribe.md)。
