# 即时通讯

## 核心概念

- **Message**：消息，支持文本/富文本/图片/文件/卡片等类型
- **Chat**：群聊（group）或单聊（p2p）
- **Thread**：话题（消息下的回复链）
- **Reaction**：表情回复

## Shortcuts

| Shortcut | 说明 | 详细文档 |
|----------|------|---------|
| `+chat-create` | 创建群聊 | [lark-im-chat-create.md](lark-im-chat-create.md) |
| `+chat-messages-list` | 获取群消息列表 | [lark-im-chat-messages-list.md](lark-im-chat-messages-list.md) |
| `+chat-search` | 搜索群聊 | [lark-im-chat-search.md](lark-im-chat-search.md) |
| `+chat-update` | 更新群名/描述 | [lark-im-chat-update.md](lark-im-chat-update.md) |
| `+messages-mget` | 批量获取消息 | [lark-im-messages-mget.md](lark-im-messages-mget.md) |
| `+messages-reply` | 回复消息 | [lark-im-messages-reply.md](lark-im-messages-reply.md) |
| `+messages-resources-download` | 下载消息中的图片/文件 | [lark-im-messages-resources-download.md](lark-im-messages-resources-download.md) |
| `+messages-search` | 跨群搜索消息 | [lark-im-messages-search.md](lark-im-messages-search.md) |
| `+messages-send` | 发送消息 | [lark-im-messages-send.md](lark-im-messages-send.md) |
| `+threads-messages-list` | 获取话题消息列表 | [lark-im-threads-messages-list.md](lark-im-threads-messages-list.md) |

## Reactions

表情回复相关 API 见 [lark-im-reactions.md](lark-im-reactions.md)。

## 身份选择

群操作的身份选择见 [lark-im-chat-identity.md](lark-im-chat-identity.md)。

## 权限

| 操作 | scope | 身份 |
|------|-------|------|
| 发消息 | `im:message:send_as_bot` | bot |
| 读消息 | `im:message:readonly` | user/bot |
| 搜索消息 | `search:message:readonly` | user |
| 管理群 | `im:chat` | user/bot |
