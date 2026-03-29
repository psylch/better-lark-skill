# 日历

## 核心场景

查看/搜索日程、创建/更新日程、管理参会人、查询忙闲状态及推荐空闲时段。

## Shortcuts

| Shortcut | 说明 | 详细文档 |
|----------|------|---------|
| `+agenda` | 快速概览今日/近期行程 | [lark-calendar-agenda.md](calendar/agenda.md) |
| `+create` | 创建日程并按需邀请参会人 | [lark-calendar-create.md](calendar/create.md) |
| `+freebusy` | 查询用户主日历的忙闲信息 | [lark-calendar-freebusy.md](calendar/freebusy.md) |
| `+suggestion` | 针对时间未确定的预约需求，提供多个时间推荐 | [lark-calendar-suggestion.md](calendar/suggestion.md) |

## 常用流程

### 查看今日日程

```bash
lark-cli calendar +agenda
```

### 创建会议

```bash
lark-cli calendar +create --summary "周会" --start "2026-03-28 14:00" --end "2026-03-28 15:00" --attendees "ou_xxx,ou_yyy"
```

### 查询忙闲并推荐时间

```bash
lark-cli calendar +freebusy --user-ids "ou_xxx,ou_yyy" --start "2026-03-28" --end "2026-03-29"
lark-cli calendar +suggestion --user-ids "ou_xxx,ou_yyy" --duration 60
```

## 权限

| 操作 | scope | 身份 |
|------|-------|------|
| 读取日程 | `calendar:calendar:readonly` | user |
| 创建/更新日程 | `calendar:calendar` | user |
| 查询忙闲 | `calendar:calendar:time_free_busy:readonly` | user |
