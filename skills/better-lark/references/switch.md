# 账号切换

在多个 lark-cli 飞书账号配置之间切换。每个 profile 对应一个飞书应用（App ID + Secret），通过替换 `~/.lark-cli/config.json` 实现切换。Token 随 config 文件保存，切换后无需重新授权。

## Preflight

```bash
bash <SKILL_DIR>/scripts/helper.sh preflight
```

检查 lark-cli 是否安装、config 目录是否存在、有哪些可用 profiles。

## 切换账号

```bash
source ~/.lark-cli/switch.sh <profile>    # 切到指定 profile
source ~/.lark-cli/switch.sh              # 查看所有可用 profiles
```

### 验证切换结果

```bash
lark-cli auth status
```

应返回 `tokenStatus: "valid"` 和正确的 `userName`。

## 新增 Profile

```bash
# 1. 配置应用
echo "<app-secret>" | lark-cli config init --app-id <app-id> --app-secret-stdin --brand feishu

# 2. 登录用户身份
lark-cli auth login --domain docs,wiki,drive

# 3. 保存 profile
cp ~/.lark-cli/config.json ~/.lark-cli/config-<name>.json

# 4. 保存 secret（用于 keychain 恢复）
echo -n "<app-secret>" > ~/.lark-cli/.<name>.secret
chmod 600 ~/.lark-cli/.<name>.secret

# 5. 恢复之前的活跃 profile
source ~/.lark-cli/switch.sh <previous-profile>
```

**注意**：`lark-cli config init` 是破坏性操作，会覆盖当前 config.json。新增 profile 前务必确认当前 profile 已保存。

## Token 过期处理

Token 有效期约 2 小时，refresh token 7 天。如果切换后 `auth status` 显示 token 过期：

```bash
lark-cli auth login --domain docs,wiki,drive
cp ~/.lark-cli/config.json ~/.lark-cli/config-<current-profile>.json
```

## Keychain 恢复

```bash
bash <SKILL_DIR>/scripts/helper.sh restore-keychain <profile>
```

## Troubleshooting

| 症状 | 原因 | 解决 |
|------|------|------|
| `keychain entry not found` | keychain 中该 appId 的 secret 被清除 | 用 `restore-keychain` 恢复，或重新 `config init` |
| `client secret is invalid` | 飞书后台的 secret 已刷新 | 获取新 secret，重新 `config init` 并保存 |
| `app is pending approval` | 组织应用未审批 | 联系管理员审批 |
| 切换后需要重新授权 | config 文件中 token 丢失 | 确认保存的是登录后的完整 config |
