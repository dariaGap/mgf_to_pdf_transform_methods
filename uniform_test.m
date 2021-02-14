syms t s;

a = 20;
b = 40;

pdf = (t>=a & t<=b)*(1/(b-a));

mgf = (exp(s*b)- exp(s*a))/(s*(b-a));

fun_s = subs(mgf, s, -s);
fun = matlabFunction(fun_s);
 
pdfZak = getApproximatePDFZak(fun, t, 10);
pdfHyp = getApproximatePDFHyp(fun_s, t, 45,2);
pdfSaddlepoint = getApproximatePDFSaddlepoint(matlabFunction(mgf), t);

figure
fplot(pdf, [0 70]), hold off
hold on, fplot(pdfHyp, [0 70]), hold off
hold on, fplot(pdfZak, [0 70]), hold off
hold on, fplot(pdfSaddlepoint, [0 70]), hold off
xlim([0 70])
ylim([-0.01 0.08])
legend("Теория", "Гиперболический. N=45, a=2","Закиан. N=10","Седловые узлы")
title('Плотность распределения')