# 知识库

管理知识空间和文档节点。

## API Resources

| Resource | 说明 |
|----------|------|
| `spaces.get_node` | 获取知识空间节点信息 |

```bash
# 获取节点信息
lark-cli wiki spaces.get_node --token <node_token>

# 查看可用 API
lark-cli wiki --help
```

## 权限

| 操作 | scope | 身份 |
|------|-------|------|
| 读取节点 | `wiki:wiki:readonly` | user |
