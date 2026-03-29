# OpenAPI 探索

当用户的需求**无法被现有模块或 CLI 已注册 API 覆盖**时，从飞书官方文档库逐层挖掘原生 OpenAPI 接口。

## 文档库结构

```
llms.txt                          <- 顶层索引
  └─ llms-<module>.txt            <- 模块文档
       └─ <api-doc>.md            <- 单个 API 完整说明
```

| 品牌 | 入口 URL |
|------|----------|
| 飞书 | `https://open.feishu.cn/llms.txt` |
| Lark | `https://open.larksuite.com/llms.txt` |

## 挖掘流程

### Step 1：确认现有能力不足

```bash
lark-cli <可能的service> --help
```

如果已有对应命令，直接使用，不需要继续挖掘。

### Step 2：从顶层索引定位模块

```
WebFetch https://open.feishu.cn/llms.txt
```

### Step 3：从模块文档定位具体 API

```
WebFetch https://open.feishu.cn/llms-docs/zh-CN/llms-<module>.txt
```

### Step 4：获取 API 完整规范

```
WebFetch https://open.feishu.cn/document/server-docs/.../<api>.md
```

### Step 5：通过 CLI 调用

```bash
lark-cli api GET /open-apis/<path> --params '{"key":"value"}'
lark-cli api POST /open-apis/<path> --data '{"key":"value"}'
lark-cli api PUT /open-apis/<path> --data '{"key":"value"}'
lark-cli api DELETE /open-apis/<path>
```

## 输出规范

1. API 名称与功能
2. HTTP 方法与路径
3. 关键参数
4. 所需权限
5. 调用示例（`lark-cli api` 完整命令）
6. 注意事项

## 安全规则

- 写入/删除类 API 调用前必须确认用户意图
- 不要猜测 API 路径或参数——必须从文档中获取
