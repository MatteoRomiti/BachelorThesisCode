%plotta sull'asse y le perdite, sul'asse x l'indice di scintillazione m
%vengono sovrapposti gli andamenti al variare di Rb/Bl, fissato EbNo

%creazione indice di scintillazione per asse x
step = 0.1;
indScint = step:step:1; %indice di scintillazione

Nc = 10^4;%numero di campioni da estrarre per ogni valore di m per il calcolo delle perdite
Rb = 7.8125;
EbN0 = 3;

%valori ottenuti da "src_6_2_calcolo.m"
L1 = [13.8799, 14.3106, 13.9552, 14.2275, 13.2389, 13.9912, 13.1176, 13.1818, 12.5824, 12.5567];
L2 = [3.0752, 3.3295, 3.2823, 3.4907, 3.7325, 3.7997, 3.9461, 4.1459, 4.4099, 4.6027];
L3 = [1.3426, 1.3549, 1.5250, 1.6542, 1.8744, 2.0315, 2.2702, 2.5501, 2.7874, 3.0866];
L4 = [0.8224, 0.8699, 0.9907, 1.0735, 1.2330, 1.4373, 1.6945, 1.9028, 2.1447, 2.3233];
L5 = [0.6054, 0.6537, 0.7657, 0.8949, 1.0104, 1.2752, 1.4030, 1.6347, 1.9212, 1.9572];

smthPerc = 0.7;%percentuale di smussamento
LL1 = smooth(indScint, L1, smthPerc, 'rloess');

plot(indScint, LL1, indScint, L2, indScint, L3, indScint, L4, indScint, L5, 'LineWidth', 1.5)
xlabel('indice di scintillazione')
ylabel('Loss[dB]')
title (['R_b = ', num2str(Rb),', E_b/N_0 = ', num2str(EbN0), 'dB, N_c = ', num2str(Nc)])
legend('R_b/B_l = 0.1','R_b/B_l = 0.5','R_b/B_l = 1','R_b/B_l = 1.5','R_b/B_l = 2','Location','Best')
grid on
