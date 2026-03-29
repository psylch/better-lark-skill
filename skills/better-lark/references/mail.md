# 邮箱

## 安全规则（邮箱专用）

- **发送前必须确认收件人和内容**
- 回复/转发时展示原始邮件摘要供用户确认
- 草稿优先：不确定时先创建草稿，让用户确认后再发送
- **禁止批量发送**：不支持群发营销类邮件

## 典型工作流

1. **读邮件**：`+triage` 查看列表 → `+message` 读单封 → `+thread` 读整个会话
2. **写邮件**：`+send` 直接发送 / `+draft-create` 创建草稿 → `+draft-edit` 编辑
3. **回复邮件**：`+reply` 回复发件人 / `+reply-all` 回复所有人
4. **转发邮件**：`+forward`
5. **监控邮件**：`+watch` 实时监听新邮件

## Shortcuts

| Shortcut | 说明 | 详细文档 |
|----------|------|---------|
| `+triage` | 邮件列表（支持筛选） | [lark-mail-triage.md](mail/triage.md) |
| `+message` | 读单封邮件 | [lark-mail-message.md](mail/message.md) |
| `+messages` | 批量读邮件 | [lark-mail-messages.md](mail/messages.md) |
| `+thread` | 读邮件会话 | [lark-mail-thread.md](mail/thread.md) |
| `+send` | 发送邮件 | [lark-mail-send.md](mail/send.md) |
| `+reply` | 回复发件人 | [lark-mail-reply.md](mail/reply.md) |
| `+reply-all` | 回复所有人 | [lark-mail-reply-all.md](mail/reply-all.md) |
| `+forward` | 转发邮件 | [lark-mail-forward.md](mail/forward.md) |
| `+draft-create` | 创建草稿 | [lark-mail-draft-create.md](mail/draft-create.md) |
| `+draft-edit` | 编辑草稿 | [lark-mail-draft-edit.md](mail/draft-edit.md) |
| `+watch` | 实时监听新邮件 | [lark-mail-watch.md](mail/watch.md) |

## 权限

| 操作 | scope | 身份 |
|------|-------|------|
| 读取邮件 | `mail:user_mailbox:readonly` | user |
| 发送邮件 | `mail:user_mailbox` | user |
