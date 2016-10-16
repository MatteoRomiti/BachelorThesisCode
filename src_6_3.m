mstep = 0.1;
m = mstep:mstep:1;


anLoss = [14.2343, 14.1574, 14.0336, 13.8693, 13.6732, 13.4563, 13.2316, 13.0144, 12.8220, 12.6826]; %valore ricavato dalla formula analitica delle perdite
simLoss = [13.8799, 14.3106, 13.9552, 14.2275, 13.2389, 13.9912, 13.1176, 13.1818, 12.5824, 12.5567]; %valore ricavato dalla Fig. 6.2
Rb = 7.8125;
EbN0 = 3;
Nc = 10^4; %numero di campioni da estrarre per un dato m 
ratio = 0.1; %R_b/B_l

smthPerc = 0.7; %percentuale di smussamento
simLL = smooth(m, simLoss, smthPerc, 'rloess');

plot(m, anLoss, m, simLL,'LineWidth', 1.5) 
xlabel('indice di scintillazione')
ylabel('Loss[dB]')
legend('Loss analitica','Loss simulata','Location','Best')
title (['R_b = ', num2str(Rb),', E_b/N_0 = ', num2str(EbN0), 'dB, N_c = ', num2str(Nc), ', R_b/B_l = ', num2str(ratio)])
grid on