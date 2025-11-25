# golden-section-search

步骤 0, 确定初始搜索区间 $[a_0, b_0]$ 和容许误差 $0 \leq \varepsilon \ll 1$. 令 $t = (\sqrt{5}-1)/2$, 计算初始试探点
$p_0 = a_0 + (1-t)(b_0 - a_0),\quad q_0 = a_0 + t(b_0 - a_0)$及相应的函数值 $\phi(p_0) , \phi(q_0)$. 令 $i:=0$.

步骤1, 若 $\phi(p_i) \leq \phi(q_i)$, 转步骤2; 否则, 转步骤3.

步骤2, 计算左试探点. 若 $|q_i - a_i| \leq \varepsilon$, 停算, 输出 $p_i$; 否则, 令
$a_{i+1} := a_i, b_{i+1} := q_i, \phi(q_{i+1}) := \phi(p_i), q_{i+1} := p_i, p_{i+1} := a_{i+1} + (1-t)(b_{i+1} - a_{i+1}).\newline $

计算 $\phi(p_{i+1})$, $i:=i+1$, 转步骤1.
步骤3, 计算右试探点. 若 $|b_i - p_i| \leq \varepsilon$, 停算, 输出 $q_i$; 否则, 令
$a_{i+1} := p_i,\quad b_{i+1} := b_i,\quad \phi(p_{i+1}) := \phi(q_i), \\
p_{i+1} := q_i,\quad q_{i+1} := a_{i+1} + t(b_{i+1} - a_{i+1}).$

计算 $\phi(q_{i+1})$, $i:=i+1$, 转步骤1.
