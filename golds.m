function [i,s,phis,ds,dphi,G] = golds(phi,a,b,epsilon,delta)
%   功能:黄金分割法精确线搜索
%   输入:phi是目标函数,a,b是搜索区间的两个端点,
%       epsilon,delta分别是自变量和函数值的容许误差
%   输出:i是选代次数,s,phis分别是近似极小点和极小值,
%       ds,dphi分别是s和phis的误差限,G是ix4矩阵,
%       其第1行分别是a,p,q,b的第i次选代值[ai,pi,qi,bi]

t=(sqrt(5)-1)/2; h=b-a;
phia=feval(phi,a);phib=feval(phi,b);
p=a+(1-t)*h;q=a+t*h;
phip=feval(phi,h);phiq=feval(phi,q);
i=1; G(i,:)=[a,p,q,b];
while(abs(phib-phia)>delta) | (h>epsilon)
    if(phip<=phiq)
        b=q;phib=phiq;q=p;phiq=phip;
        h=b-a; p=a+(1-t)*h; phip=feval(phi,p);
    else
        a=p;phia=phip;p=q;phip=phiq;
        h=b-a; q=a+t*h; phiq=feval(phi,q);
    end
    i=i+1;G(i,:)=[a,p,q,b];
end
if(phip<=phiq)
    s=p; phis=phip;
else
    s=q; phis=phiq;
end
ds=abs(b-a); dphi = abs(phib-phia);

