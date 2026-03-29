# 电子表格

## Shortcuts

| Shortcut | 说明 | 详细文档 |
|----------|------|---------|
| `+info` | 获取表格元信息（sheet 列表、行列数） | [lark-sheets-info.md](sheets/info.md) |
| `+read` | 读取单元格数据 | [lark-sheets-read.md](sheets/read.md) |
| `+write` | 写入单元格数据 | [lark-sheets-write.md](sheets/write.md) |
| `+append` | 追加行数据 | [lark-sheets-append.md](sheets/append.md) |
| `+find` | 查找单元格内容 | [lark-sheets-find.md](sheets/find.md) |
| `+create` | 创建表格并写入表头和数据 | [lark-sheets-create.md](sheets/create.md) |
| `+export` | 导出表格文件 | [lark-sheets-export.md](sheets/export.md) |

## 常用流程

### 读取表格数据

```bash
# 1. 获取 sheet 列表
lark-cli sheets +info --token <spreadsheet_token>

# 2. 读取指定范围
lark-cli sheets +read --token <spreadsheet_token> --range "Sheet1!A1:D10"
```

### 创建并填充表格

```bash
lark-cli sheets +create --title "标题" --headers '["姓名","部门","工号"]' --data '[["张三","工程","001"]]'
```

## 权限

| 操作 | scope | 身份 |
|------|-------|------|
| 读取 | `sheets:spreadsheet:readonly` | user |
| 写入 | `sheets:spreadsheet` | user |
