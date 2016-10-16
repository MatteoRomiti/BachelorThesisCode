%creazione asse x, ossia dei campioni che possono essere estratti
vstep = 0.01; %passo di discretizzazione
v = 0:vstep:100;

m0 = 0.1;
m2 = 0.2;
m4 = 0.4;
m6 = 0.6;
m8 = 0.8;
m10 = 1;

sigmaq0 = (1-sqrt(1-m0^2))/2;
sigmaq2 = (1-sqrt(1-m2^2))/2;
sigmaq4 = (1-sqrt(1-m4^2))/2;
sigmaq6 = (1-sqrt(1-m6^2))/2;
sigmaq8 = (1-sqrt(1-m8^2))/2;
sigmaq10 = (1-sqrt(1-m10^2))/2;

sigma0 = sqrt(sigmaq0);
sigma2 = sqrt(sigmaq2);
sigma4 = sqrt(sigmaq4);
sigma6 = sqrt(sigmaq6);
sigma8 = sqrt(sigmaq8);
sigma10 = sqrt(sigmaq10);

aq0 = sqrt(1-m0^2);
aq2 = sqrt(1-m2^2);
aq4 = sqrt(1-m4^2);
aq6 = sqrt(1-m6^2);
aq8 = sqrt(1-m8^2);
aq10 = sqrt(1-m10^2);

a0 = sqrt(aq0);
a2 = sqrt(aq2);
a4 = sqrt(aq4);
a6 = sqrt(aq6);
a8 = sqrt(aq8);
a10 = sqrt(aq10);

%creazione pdf
pdf0 = ricepdf(v, a0, sigma0);
pdf2 = ricepdf(v, a2, sigma2);
pdf4 = ricepdf(v, a4, sigma4);
pdf6 = ricepdf(v, a6, sigma6);
pdf8 = ricepdf(v, a8, sigma8);
pdf10 = ricepdf(v, a10, sigma10);

figure(1)
plot(v, pdf0, v, pdf2, v, pdf4, v, pdf6, v, pdf8, v, pdf10,'LineWidth', 3) 
xlabel('v')
ylabel('f_v(v)')
legend('m = 0.1 ', 'm = 0.2 ', 'm = 0.4','m = 0.6','m = 0.8', 'm = 1.0 ' )
title ('Densità di probabilità di Rice' )
grid on