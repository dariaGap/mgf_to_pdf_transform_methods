syms t s;

M = 30;

sigma = 3;

pdf = exp(-((t-M)^2)/(2*sigma^2))/(sigma*(2*pi)^(1/2));

mgf = exp(M*s + (sigma^2*s^2)/2);

fun_s = subs(mgf, s, -s);
fun = matlabFunction(fun_s);
 
pdfZak = getApproximatePDFZak(fun, t, 10);
pdfHyp = getApproximatePDFHyp(fun_s, t, 35,1);
pdfSaddlepoint = getApproximatePDFSaddlepoint(matlabFunction(mgf), t);

figure
fplot(pdf, [0 60]), hold off
hold on, fplot(pdfHyp, [0 60]), hold off
hold on, fplot(pdfZak, [0 60]), hold off
hold on, fplot(pdfSaddlepoint, [0 60]), hold off
xlim([0 60])
ylim([-0.01 0.4])
legend("Теория", "Гиперболический. N=35, a=1","Закиан. N=10","Седловые узлы")
title('Плотность распределения')