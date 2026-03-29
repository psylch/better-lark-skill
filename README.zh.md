# lark

[English](README.md)

统一的 [lark-cli](https://github.com/larksuite/cli) 飞书技能——一站式访问即时通讯、云文档、电子表格、多维表格、日历、任务、云空间、邮箱、通讯录、知识库、视频会议、画板等全部功能。

将 19 个独立的 lark-* skill 合并为一个模块化 skill，按需加载 reference 文档。

## 安装

### 通过 skills.sh（推荐）

```bash
npx skills add psylch/lark-skill -g -y
```

### 手动安装

```bash
git clone https://github.com/psylch/lark-skill.git ~/.claude/skills/lark
```

安装后需重启 agent。

## 前置条件

- 支持 [skills.sh](https://skills.sh/) 的 AI 编程 agent（Claude Code、Cursor、Windsurf 等）
- 已安装 [lark-cli](https://github.com/larksuite/cli)（`npm install -g @larksuite/cli`）

## 模块

| 模块 | 说明 |
|------|------|
| 即时通讯 | 收发消息、管理群聊 |
| 云文档 | 从 Markdown 创建/编辑文档 |
| 电子表格 | 读写表格数据 |
| 多维表格 | 多维数据表（Bitable） |
| 日历 | 日程管理、忙闲查询、时间推荐 |
| 任务 | 待办事项、任务清单 |
| 云空间 | 上传下载文件、权限管理 |
| 邮箱 | 收发邮件（含安全规则） |
| 通讯录 | 搜索员工、组织架构 |
| 知识库 | 知识空间管理 |
| 视频会议 | 会议记录和纪要 |
| 妙记 | AI 会议摘要 |
| 画板 | 图表和可视化 |
| 事件订阅 | 实时事件监听 |
| 账号切换 | 多账号 profile 管理 |

## 使用方法

Skill 会根据上下文自动激活。示例：

```
> 查看今天的日程
> 发个消息给张三
> 切换到 einsia 账号
> 创建一个多维表格
> 搜索云空间里的文档
```

## 许可证

MIT
