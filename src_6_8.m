%plotta la media di cos(phi) al variare di n (numero di campioni di phi
%estratti con pdf di Tikhonov)

Nmax = 10^3; %numero massimo di variazioni del canale nel tempo di bit
n = 1:Nmax; %quante volte varia il canale nel tempo di bit, asse x del grafico
k = 10; %argomento delle funzioni di Bessel
N = 500; %realizzazioni

figure;
hold on
for i=1:N
    E=mediacosphi_Tik(Nmax, k); %calcolo della media di cos(phi)
    plot(n, E)
    drawnow;
end
hold off
xlabel('n')
ylabel('E[cos(\phi)] rad' )
title (['\kappa = ', num2str(k), ', ', num2str(N), ' realizzazioni'])
grid on
