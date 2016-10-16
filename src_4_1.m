%plotta le funzioni di Bessel modificate

k = 0:0.01:8; %creazione asse x
I = zeros(10,801); %preallocation 
for j = 0:9
    I(j+1,:) = besseli(j,k);
end
plot(k,I,'LineWidth',1.5)
axis([0 8 0 10]);
grid on
legend('I_0','I_1','I_2','I_3','I_4','I_5','I_6','I_7','I_8','I_9','Location','Best')
title('Funzioni di Bessel modificate di ordine j = 0, 1, ..., 9')
xlabel('\kappa')
ylabel('I_j(\kappa)')
