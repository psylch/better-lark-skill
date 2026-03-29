# 认证与配置

## 配置初始化

首次使用需运行 `lark-cli config init` 完成应用配置。

使用 background 方式执行以下命令发起配置流程，启动后读取输出，从中提取授权链接并发给用户：

```bash
lark-cli config init --new
```

## 认证

### 身份类型

两种身份类型，通过 `--as` 切换：

| 身份 | 标识 | 获取方式 | 适用场景 |
|------|------|---------|---------|
| user 用户身份 | `--as user` | `lark-cli auth login` | 访问用户自己的资源（日历、云空间等） |
| bot 应用身份 | `--as bot` | 自动，只需 appId + appSecret | 应用级操作，访问 bot 自己的资源 |

### 身份选择原则

- **Bot 看不到用户资源**：无法访问用户的日历、云空间文档、邮箱等个人资源
- **Bot 无法代表用户操作**：发消息以应用名义发送，创建文档归属 bot
- **Bot 权限**：只需在飞书开发者后台开通 scope，无需 `auth login`
- **User 权限**：后台开通 scope + 用户通过 `auth login` 授权，两层都要满足

### 权限不足处理

错误响应中包含关键信息：
- `permission_violations`：列出缺失的 scope（N 选 1）
- `console_url`：飞书开发者后台的权限配置链接
- `hint`：建议的修复命令

#### Bot 身份（`--as bot`）

将错误中的 `console_url` 提供给用户，引导去后台开通 scope。**禁止**对 bot 执行 `auth login`。

#### User 身份（`--as user`）

```bash
lark-cli auth login --domain <domain>           # 按业务域授权
lark-cli auth login --scope "<missing_scope>"   # 按具体 scope 授权（推荐）
```

**规则**：auth login 必须指定范围（`--domain` 或 `--scope`）。多次 login 的 scope 会累积（增量授权）。

#### Agent 代理发起认证

使用 background 方式执行以下命令发起授权流程，并将授权链接发给用户：

```bash
lark-cli auth login --scope "calendar:calendar:readonly"
```

## 安全规则

- **禁止输出密钥**（appSecret、accessToken）到终端明文
- **写入/删除操作前必须确认用户意图**
- 用 `--dry-run` 预览危险请求
