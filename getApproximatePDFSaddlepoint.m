function pdf = getApproximatePDFSaddlepoint(fun, t)
syms s;
K = log(fun(s));
eqn = diff(K) == t;
a = solve(eqn,s);
pdf_1 = (2*pi*diff(diff(K)))^(-1/2)*exp(K - s*t);
pdf = subs(pdf_1,s,a);
end

