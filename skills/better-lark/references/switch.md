# 账号切换

在多个 lark-cli 飞书账号配置之间切换。每个 profile 对应一个飞书应用（App ID + Secret），通过替换 `~/.lark-cli/config.json` 实现切换。

切换时自动为当前和目标 profile 续命 token（auto-refresh），避免因长时间不用导致 token 过期需要重新登录。

## Preflight

```bash
bash <SKILL_DIR>/scripts/helper.sh preflight
```

检查 lark-cli 是否安装、config 目录是否存在、有哪些可用 profiles。

## 切换账号

```bash
bash ~/.lark-cli/switch.sh <profile>       # 切到指定 profile（自动续命 token）
bash ~/.lark-cli/switch.sh                 # 查看所有 profiles 及状态
bash ~/.lark-cli/switch.sh --keepalive     # 刷新所有 profiles 的 token（不切换）
```

切换时会自动：
1. 给当前 profile 触发 auto-refresh（防止切走后过期）
2. 切到目标 profile
3. 给目标 profile 触发 auto-refresh

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
bash ~/.lark-cli/switch.sh <previous-profile>
```

**注意**：`lark-cli config init` 是破坏性操作，会覆盖当前 config.json。新增 profile 前务必确认当前 profile 已保存。

## Token 机制

- Access token 有效期约 2 小时，过期后状态变为 `needs_refresh`
- Refresh token 有效期 7 天（滑动窗口，每次 refresh 重新计 7 天）
- `needs_refresh` 状态：任意 API 调用自动刷新，无需手动操作
- `expired` 状态：无法自动恢复，必须 `lark-cli auth login` 重新登录

**关键**：只要每 7 天内至少切换一次（switch.sh 自动续命），token 永不过期。

如果 token 已经 expired：

```bash
lark-cli auth login --domain docs,wiki,drive
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
| `token expired` 需要重新授权 | token 超过 7 天未 refresh | `lark-cli auth login`，之后 switch.sh 会自动续命 |
| 切换后 `needs_refresh` | 正常现象 | 下一次 API 调用会自动刷新，无需干预 |
