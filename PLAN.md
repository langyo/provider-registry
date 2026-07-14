# provider-registry — 项目状态与计划 (PLAN)

> 刷新于 2026-07-14。LLM provider 多源聚合配置仓库。

## 1. 项目概述

- **名称**：`provider-registry`
- **简介**：celestia LLM provider 多源聚合配置（OpenRouter + models.dev），定义 provider 端点、模型列表、限速与回退策略。
- **远程仓库**：https://github.com/celestia-island/provider-registry.git
- **技术栈**：TOML / JSON / lagrange 静态渲染
- **类别**：config

## 2. 当前状态

- **当前分支**：`dev`
- **工作区**：干净
- **最近提交时间**：2026-07-12
- **最近提交**：`🔧 Pin script recipes to the resolved Git Bash to survive WSL shadowing.`
- **本地领先 `origin/dev`**：0

## 3. 未提交改动

无

## 4. 近期进展

- `🔧 Pin script recipes to the resolved Git Bash to survive WSL shadowing.`
- `🔧 Switch the justfile to Git Bash and fetch devtools recipes on demand.`
- `📝 Add FUNDING.yml for GitHub Sponsors.`
- `🔧 Add dependabot.yml for automated dependency updates.`
- `📝 Add a SECURITY.md vulnerability reporting policy.`

## 5. 后续计划

1. **与 models.dev 同步**：每周 cron 从上游拉新模型条目；本仓只存我们筛选后的子集。
2. **回退策略档位化**：把"primary → secondary → tertiary → direct"策略参数化为 TOML 矩阵，便于 entelecheia scepter 直接消费。
3. **国内 provider 全栈**：DeepSeek / Qwen / GLM / StepFun / Moonshot / Doubao / Hunyuan 端点表增删可读化。

## 6. 跨仓依赖

- 被 entelecheia `packages/llm_provider` 消费（git submodule 或在构建时 fetch）。
- 本仓无 `path = "../..."` 的硬编码 patch。

---

## 既有详细计划（存档）

provider 条目结构与字段说明在 `docs/en/`；本文件只承载"当前态 → 后续计划"两部分。
