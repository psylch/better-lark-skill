# 多维表格（Base / Bitable）

## 核心概念

- **Base/App**：一个多维表格应用，包含多个数据表
- **Table**：数据表，包含字段和记录
- **Field**：字段（列），支持多种类型（文本、数字、单选、公式、查找引用等）
- **Record**：记录（行）
- **View**：视图（表格视图、看板、甘特图等）
- **Dashboard**：仪表盘

## 模块导航

| 模块 | Shortcuts | 详细文档 |
|------|-----------|---------|
| 表操作 | `+table-create/delete/get/list/update` | [lark-base-table.md](base/table.md) |
| 字段管理 | `+field-create/delete/get/list/update` | [lark-base-field.md](base/field.md) |
| 记录读写 | `+record-get/list/upsert/delete` | [lark-base-record.md](base/record.md) |
| 数据查询 | `+data-query` | [lark-base-data-query.md](base/data-query.md) |
| 视图配置 | `+view-create/get/list/set-filter/...` | [lark-base-view.md](base/view.md) |
| 仪表盘 | `+dashboard-create/get/list/...` | [lark-base-dashboard.md](base/dashboard.md) |
| 工作流 | `+workflow-create/get/list/...` | [lark-base-workflow.md](base/workflow.md) |
| 高级权限 | `+advperm-enable/disable` | [lark-base-advperm-enable.md](base/advperm-enable.md) |
| 角色管理 | `+role-create/get/list/update/delete` | [role-config.md](base/role-config.md) |
| 表单管理 | `+form-create/get/list/update/delete` | [lark-base-form.md](base/form.md) |
| 历史记录 | history 相关 | [lark-base-history.md](base/history.md) |

## 专题指南

| 主题 | 文档 |
|------|------|
| 字段属性参考 | [lark-base-shortcut-field-properties.md](base/shortcut-field-properties.md) |
| 记录值格式参考 | [lark-base-shortcut-record-value.md](base/shortcut-record-value.md) |
| 公式字段指南 | [formula-field-guide.md](base/formula-field-guide.md) |
| 查找引用字段指南 | [lookup-field-guide.md](base/lookup-field-guide.md) |
| 使用示例 | [examples.md](base/examples.md) |

## 权限

| 操作 | scope | 身份 |
|------|-------|------|
| 读取 | `bitable:bitable:readonly` | user |
| 写入 | `bitable:bitable` | user |
