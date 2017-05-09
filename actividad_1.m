
num = [5 18]; 
den = [34 -6 25]; 

%obtener función de transferencia
sist = tf(num, den);

%numerador y denominador función de transferencia
numc = [5 18];
denc = [34 -6 25];

%se obtiene la respuesta frente a un escalon del sistema continuo
t=0:0.01:50;
[y,t] = step(sist, t); 
createfigure1(t,y,'Sistema continuo', 1);
pause;
%clf();

%transformar a forma discreta
[numd1, dend1] = c2dm(numc, denc, 0.3, 'zoh');

%construir los puntos
[y1] = dstep(numd1, dend1, 166+1);
x1 = 0:0.3:0.3*166;

%graficar sistema discreto 1
createfigure1(x1,y1,'Sistema discreto 1 muestreo = 0.3', 2);
pause;
%clf();

%transformar a forma discreta
[numd2, dend2] = c2dm(numc, denc, 0.08, 'zoh');

%construir los puntos
[y1] = dstep(numd2, dend2, 625+1);
x1 = 0:0.08:0.08*625;

%graficar sistema discreto 1
createfigure1(x1,y1,'Sistema discreto 2 muestreo = 0.08', 2);
pause;
%clf();


%transfromar de discreta a continua
[numc1, denc1] = d2cm(numd2, dend2, 0.08, 'zoh');

%graficar sistema discreto 1
sistc = tf(numc1, denc1);
t=0:0.01:50;
[y,t] = step(sistc,t); 
createfigure1(t,y,'Sistema continuo muestreo = 0.08', 1);
pause;
%clf();