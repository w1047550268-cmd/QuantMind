# 五福 ETF 轮动策略参考源码

本目录用于保存和适配公开的“五福 ETF 轮动策略”。

## 上游来源

- 仓库：`stepven8/wufu-etf-rotation-strategy`
- 固定提交：`ff83624798271ea6904850b71c4808452b302d88`
- 策略文件：`五福_ETF轮动策略.txt`
- 文件 SHA：`2f38c126743b1641068fb56d49c41e159fe15933`

上游实现基于聚宽 API，不能直接在 QuantMind/vn.py 环境运行。请先执行本目录的 `fetch_upstream_wufu.ps1` 拉取固定版本，再在独立文件中进行本地适配，不要直接覆盖下载的参考文件。

## 目录约定

```text
strategies/wufu/
├── README.md
├── SOURCE_NOTES.md
├── fetch_upstream_wufu.ps1
├── upstream/                  # 脚本下载的只读参考源码，不提交本地改动
└── adapted/                   # 后续 QuantMind/vn.py 独立适配实现
```

## 使用方式

在仓库根目录执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\strategies\wufu\fetch_upstream_wufu.ps1
```

脚本会下载固定提交中的策略文件，并校验 SHA-256。校验不一致时立即失败。

## 研究要求

后续适配至少应保留并逐项验证：

- 固定大 ETF 池；
- 昨日成交金额前 5 的动态池；
- 5 日平均成交额前 50 中涨幅前 5 的动态池；
- 25 日加权对数价格回归；
- `score = annualized_return * R²`；
- 10 日短期动量过滤；
- 最近三日急跌过滤；
- 放量过热过滤；
- 高点回撤保护；
- 无合格 ETF 时切换至 `511880`；
- 最终只持有排名第一的 ETF。

三年日线代理回测和真实分钟日内复刻必须分别命名和报告，不能混为“完全复刻”。
