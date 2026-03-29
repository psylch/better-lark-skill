# 妙记

获取飞书妙记的基础信息（标题、封面、时长）和 AI 产物（总结、待办、章节）。

> 飞书妙记 URL 格式：`http(s)://<host>/minutes/<minute-token>`

## 使用

```bash
# 获取妙记信息
lark-cli minutes minutes.get --minute_token <token>
```

从 URL 中提取 `minute-token` 后调用 API。

## 返回内容

- 基础信息：标题、封面图、时长、创建时间
- AI 产物：总结文本、待办事项、章节列表

## 权限

| 操作 | scope | 身份 |
|------|-------|------|
| 读取妙记 | `minutes:minutes:readonly` | user |
