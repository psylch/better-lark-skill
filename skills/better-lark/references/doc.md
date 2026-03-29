# 云文档

## 核心概念

- **文档类型**：docx（新版文档）、doc（旧版）、sheet、bitable、mindnote、wiki 节点
- **Token**：每个文档有唯一 token，从 URL 提取
- **Wiki 链接处理**：wiki 链接需先解析为实际文档类型和 token

## 快速决策

| 需求 | 操作 |
|------|------|
| 从 Markdown 创建文档 | `docs +create` |
| 搜索云空间文档 | `docs +search` |
| 获取文档内容 | `docs +fetch` |
| 更新文档 | `docs +update` |
| 插入图片/文件 | `docs +media-insert` |
| 下载文档中的图片 | `docs +media-download` |

## Shortcuts

| Shortcut | 说明 | 详细文档 |
|----------|------|---------|
| `+create` | 从 Markdown 创建文档 | [lark-doc-create.md](doc/create.md) |
| `+fetch` | 获取文档内容 | [lark-doc-fetch.md](doc/fetch.md) |
| `+update` | 更新文档（追加/覆盖/替换/插入/删除） | [lark-doc-update.md](doc/update.md) |
| `+search` | 搜索云空间文档 | [lark-doc-search.md](doc/search.md) |
| `+media-insert` | 插入图片/文件到文档 | [lark-doc-media-insert.md](doc/media-insert.md) |
| `+media-download` | 下载文档中的媒体 | [lark-doc-media-download.md](doc/media-download.md) |
| `+whiteboard-update` | 更新画板内容 | [lark-doc-whiteboard-update.md](doc/whiteboard-update.md) |

## 权限

| 操作 | scope | 身份 |
|------|-------|------|
| 创建文档 | `docs:doc` | user |
| 读取文档 | `docs:doc:readonly` | user |
| 搜索文档 | `docs:doc:readonly` | user |
