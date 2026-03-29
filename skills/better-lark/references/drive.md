# 云空间

管理云空间中的文件和文件夹：上传下载、创建文件夹、复制/移动/删除文件、管理评论和权限。

## 核心概念

- **Token**：每个文件/文件夹有唯一 token
- **Type**：doc、docx、sheet、bitable、folder、file 等

## Shortcuts

| Shortcut | 说明 | 详细文档 |
|----------|------|---------|
| `+upload` | 上传文件 | [lark-drive-upload.md](lark-drive-upload.md) |
| `+download` | 下载文件 | [lark-drive-download.md](lark-drive-download.md) |
| `+add-comment` | 添加文档评论 | [lark-drive-add-comment.md](lark-drive-add-comment.md) |

## API Resources

```bash
# 文件操作
lark-cli drive files.<method>

# 评论操作
lark-cli drive file.comments.<method>
lark-cli drive file.comment.replys.<method>

# 权限管理
lark-cli drive permission.members.<method>

# 元数据
lark-cli drive metas.<method>

# 查看所有可用 API
lark-cli drive --help
```

## 权限

| 操作 | scope | 身份 |
|------|-------|------|
| 读取 | `drive:drive:readonly` | user |
| 上传/管理 | `drive:drive` | user |
| 评论 | `drive:file:comment` | user |
