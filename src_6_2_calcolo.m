%plotta sull'asse y le perdite, sul'asse x l'indice di scintillazione m
%vengono sovrapposti gli andamenti al variare di Rb/Bl, fissato EbNo

%creazione indice di scintillazione per asse x
step = 0.1;
indScint = step:step:1; %indice di scintillazione

Nc = 10^4;%numero di campioni da estrarre per ogni valore di m per il calcolo delle perdite
Rb = 7.8125;
EbN0 = 3;
r1 = 0.1;
r2 = 0.5;
r3 = 1;
r4 = 1.5;
r5 = 2;
%tc = 3.72*10^-3; %Ka-band
%tc = 7.25*10^-3; %X-band
%tc = 13.9*10^-3; %S-band

L1 = loss_function_ratio(EbN0, Nc, Rb, r1);
L2 = loss_function_ratio(EbN0, Nc, Rb, r2);
L3 = loss_function_ratio(EbN0, Nc, Rb, r3);
L4 = loss_function_ratio(EbN0, Nc, Rb, r4);
L5 = loss_function_ratio(EbN0, Nc, Rb, r5);

plot(indScint, L1, indScint, L2, indScint, L3, indScint, L4, indScint, L5, 'LineWidth', 1.5)
xlabel('indice di scintillazione')
ylabel('Loss[dB]')
title (['R_b = ', num2str(Rb),', E_b/N_0 = ', num2str(EbN0), 'dB, N_c = ', num2str(Nc)])
legend('R_b/B_l = 0.1','R_b/B_l = 0.5','R_b/B_l = 1','R_b/B_l = 1.5','R_b/B_l = 2','Location','Best')
grid on