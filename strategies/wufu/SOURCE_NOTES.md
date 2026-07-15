# 五福策略来源记录

## 固定来源

```text
repository: stepven8/wufu-etf-rotation-strategy
commit: ff83624798271ea6904850b71c4808452b302d88
file: 五福_ETF轮动策略.txt
observed_file_sha: 2f38c126743b1641068fb56d49c41e159fe15933
```

该公开仓库说明策略文件从聚宽文章中的多策略文件提取，仅保留“策略3：ETF轮动策略”。代码顶部引用的聚宽文章为：

```text
https://www.joinquant.com/post/72500
```

## 许可状态

截至本记录创建时，上游仓库根目录未发现明确的 `LICENSE` 文件。因此本仓库通过固定提交下载脚本获取参考源码，不将第三方源码正文直接复制进版本历史。

下载到 `upstream/` 的文件仅作为研究和迁移参考。后续进入 `adapted/` 的实现应当：

1. 重新组织为 QuantMind/vn.py 的策略接口；
2. 保留来源说明；
3. 明确日内参考版与日线代理版差异；
4. 不伪造历史 NAV、分钟行情或其他缺失数据；
5. 输出累计收益、CAGR、年化波动率、Sharpe、Sortino、Calmar、最大回撤等完整指标。
