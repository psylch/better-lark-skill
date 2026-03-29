# 画板

在飞书云文档中绘制图表：架构图、流程图、思维导图、时序图、组织结构图等。

## 两种路径

| 路径 | 适用场景 | 工具 |
|------|---------|------|
| **DSL 路径** | 自定义设计、精确布局 | `lark-cli docs +whiteboard-update` |
| **Mermaid 路径** | 标准图表类型（流程图、时序图等） | `npx @larksuite/whiteboard-cli` |

## DSL 路径

1. 根据需求选择布局策略
2. 规划内容结构
3. 构建 JSON DSL
4. 调用 `lark-cli docs +whiteboard-update` 写入

### 核心模块参考

| 模块 | 文档 |
|------|------|
| DSL Schema（节点类型定义） | [whiteboard-schema.md](whiteboard/schema.md) |
| 内容规划 | [whiteboard-content.md](whiteboard/content.md) |
| 布局系统 | [whiteboard-layout.md](whiteboard/layout.md) |
| 排版规则 | [whiteboard-typography.md](whiteboard/typography.md) |
| 连接线 | [whiteboard-connectors.md](whiteboard/connectors.md) |
| 样式与配色 | [whiteboard-style.md](whiteboard/style.md) |

### 场景模板

| 场景 | 文档 |
|------|------|
| 架构图 | [whiteboard-scenes/architecture.md](whiteboard/scenes/architecture.md) |
| 对比矩阵 | [whiteboard-scenes/comparison.md](whiteboard/scenes/comparison.md) |
| 鱼骨图 | [whiteboard-scenes/fishbone.md](whiteboard/scenes/fishbone.md) |
| 柱状图 | [whiteboard-scenes/bar-chart.md](whiteboard/scenes/bar-chart.md) |
| 折线图 | [whiteboard-scenes/line-chart.md](whiteboard/scenes/line-chart.md) |
| 树状图 | [whiteboard-scenes/treemap.md](whiteboard/scenes/treemap.md) |
| 漏斗图 | [whiteboard-scenes/funnel.md](whiteboard/scenes/funnel.md) |
| 金字塔图 | [whiteboard-scenes/pyramid.md](whiteboard/scenes/pyramid.md) |
| 飞轮图 | [whiteboard-scenes/flywheel.md](whiteboard/scenes/flywheel.md) |
| 里程碑 | [whiteboard-scenes/milestone.md](whiteboard/scenes/milestone.md) |
| 组织结构图 | [whiteboard-scenes/organization.md](whiteboard/scenes/organization.md) |

## Mermaid 路径

```bash
npx @larksuite/whiteboard-cli --help
```

支持的 Mermaid 图表类型见 [whiteboard-scenes/mermaid.md](whiteboard/scenes/mermaid.md)。

## 权限

| 操作 | scope | 身份 |
|------|-------|------|
| 更新画板 | `docs:doc` | user |
