phistep = pi/1000; %passo di discretizzazione di phi
phi = -pi:phistep:pi; %asse x

k = 50; %argomento delle funzioni di Bessel (rho*v^2)
mu = 0; %valor medio distribuzione normale
sigmaq = 1/k; %varianza distribuzione normale
sigma = sqrt(sigmaq); 

%pdf di Tikhonov
tik = exp(k*cos(phi))/(2*pi*besseli(0,k));

%pdf Normale
norm = normpdf(phi, mu, sigma); %(funzione di matlab)

figure(1)
plot(phi, tik, phi, norm, 'LineWidth', 1.5)
xlabel('phi')
ylabel('pdf')
legend('pdf Tikhonov','pdf normale','Location','Best')
title (['\kappa = ', num2str(k), ' \sigma^2 = ', num2str(sigmaq)])
grid on

err = (tik-norm); %differenza tra Tikhonov e normale
errPerc = (abs(err)./tik)*100; %errore percentuale 
mse = mean(err.^2); %mean square error
%eanErrPerc=mean(errPerc); %valore medio dell'errore percentuale

figure(2)
plot(phi,err)
xlabel('\phi')
ylabel('errore')
title (['\kappa = ', num2str(k), ' \sigma^2 = ', num2str(sigmaq)])
grid on
 
figure(3)
plot(phi,errPerc, 'Linewidth', 1.5)
xlabel('\phi')
ylabel('errore %')
title (['\kappa = ', num2str(k), ' \sigma^2 = ', num2str(sigmaq)])
grid on