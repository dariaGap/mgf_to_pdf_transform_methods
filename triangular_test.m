syms t s;

a = 10;
b = 50;
c = 30;

pdf = (t>=a & t<=c)*((2*(t-a))/((b-a)*(c-a))) + (t>=c & t<=b)*((2*(b-t))/((b-a)*(b-c)));

mgf = 2*((b-c)*exp(a*s) - (b-a)*exp(c*s) + (c-a)*exp(b*s))/...
                ((b-a) * (c-a) * (b-c) * s^2);

fun_s = subs(mgf, s, -s);
fun = matlabFunction(fun_s);
 
pdfZak = getApproximatePDFZak(fun, t, 10);
pdfHyp = getApproximatePDFHyp(fun_s, t, 25,2);
pdfSaddlepoint = getApproximatePDFSaddlepoint(matlabFunction(mgf), t);

figure
fplot(pdf, [0 70]), hold off
hold on, fplot(pdfHyp, [0 70]), hold off
hold on, fplot(pdfZak, [0 70]), hold off
hold on, fplot(pdfSaddlepoint, [0 70]), hold off
xlim([0 70])
ylim([-0.01 0.08])
legend("Теория", "Гиперболический. N=25, a=2","Закиан. N=10","Седловые узлы")
title('Плотность распределения')