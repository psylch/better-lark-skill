# 工作流编排

预定义的多步编排工作流，组合多个模块完成复杂任务。

## 日程待办摘要（Standup Report）

编排 `calendar +agenda` 和 `task +get-my-tasks`，生成指定日期的日程与未完成任务摘要。

### 流程

1. **确定日期范围**：默认今天，支持"明天"、"本周"等
2. **获取日程**：`lark-cli calendar +agenda --start <date> --end <date>`
3. **获取未完成任务**：`lark-cli task +get-my-tasks`
4. **生成摘要**：结合日程和任务，按时间线组织

### 输出格式

```
## 📅 日程（N 项）
- HH:MM-HH:MM 会议名称（参会人）
- ...

## ✅ 待办（N 项未完成）
- [ ] 任务名称（截止日期）
- ...
```

## 会议纪要整理（Meeting Summary）

汇总指定时间范围内的会议纪要并生成结构化报告。

### 流程

1. **确定时间范围**：如"上周"、"昨天"
2. **搜索会议记录**：`lark-cli vc +search --start <date> --end <date>`
3. **逐个获取纪要**：`lark-cli vc +notes --meeting-id <id>`
4. **获取元数据**（可选）：`lark-cli drive metas batch_query`
5. **组织报告**：按时间排序，包含总结、待办、关键决策
6. **生成文档**（可选）：`lark-cli docs +create --title "会议纪要汇总" --markdown "$(cat report.md)"`

### 输出格式

```
# 会议纪要汇总（日期范围）

## 会议名称 1（日期 时间）
**参会人**：...
**总结**：...
**待办**：
- [ ] ...

## 会议名称 2
...
```
