syms t s;

lambda = 0.5;

pdf = lambda*exp(-lambda*t);

mgf = lambda/(lambda - s);

fun_s = subs(mgf, s, -s);
fun = matlabFunction(fun_s);
 
pdfZak = getApproximatePDFZak(fun, t, 10);
pdfHyp = getApproximatePDFHyp(fun_s, t, 5,0.5);
pdfSaddlepoint = getApproximatePDFSaddlepoint(matlabFunction(mgf), t);

figure
fplot(pdf, [0 150]), hold off
hold on, fplot(pdfHyp, [0 150]), hold off
hold on, fplot(pdfZak, [0 150]), hold off
hold on, fplot(pdfSaddlepoint, [0 150]), hold off
xlim([0 150])
ylim([-0.01 0.4])
legend("Теория", "Гиперболический. N=5, a=0.5","Закиан. N=10","Седловые узлы")
title('Плотность распределения')
