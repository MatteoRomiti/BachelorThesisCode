kstep = 0.1; %passo di discretizzazione asse x
k = 0:kstep:50; %creazione vettore asse x
E = besseli(1,k)./besseli(0,k); %calcolo media cos(\phi) con formula analitica
plot(k, E, 'LineWidth', 1.5)
xlabel('\kappa')
ylabel('E(cos\phi)')

grid on