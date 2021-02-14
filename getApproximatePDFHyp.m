function pdf = getApproximatePDFHyp(fun, t, N, a)
syms t s;
p1 = exp(a)/(2*t);
p2 = (1/2)*subs(fun, s, a/t);
j = 0;
for n = 1:N
    j = j + ((-1)^n)*(real(subs(fun, s, a/t+1i*n*(pi/t)))+ imag(subs(fun, s, a/t+1i*(n-(1/2))*(pi/t))));
end
pdf = p1*(p2+j);
end