%plotta la funzione di ripartizione della variabile di Tikhonov 
%assegnato un valore di k

phistep = pi/100; %passo di discretizzazione di phi
phi = -pi:pi/100:pi; %creazione asse x
k = 8; %argomento delle funzioni di Bessel

%creazione della funzione di ripartizione
F1 = (phi+pi)/(2*pi);
F2 = 1/(pi*besseli(0,k));
F3 = 0;
Nj = 10^4; %ultimo termine della serie

for j = 1:Nj;     
    F3 = F3+(besseli(j,k)*sin(j*phi))/j;
end
F = F1+F2*F3;


plot(phi,F,'LineWidth',1.5)
xlabel('\phi')
ylabel('F_\phi(\phi)')
title (['Funzione di ripartizione di Tikhonov con \kappa = ', num2str(k)])
grid on


