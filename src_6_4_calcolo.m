%plotta sull'asse y le perdite al variare dell'angolo SEP
%vengono sovrapposti gli andamenti per le bande Ka, X, S

EbN0 = 3; %Eb/N0 in dB
Nc = 10^2; %numero di campioni da estrarre per un dato m

%tcKa = 3.72*10^-3; %Ka-band
%tcX =7.25*10^-3; %X-band
%tcS =13.9*10^-3; %S-band

coeffS = 0.01; %S-Band
coeffX = 0.0016; %X-Band
coeffX1 = 0.0016*1.5; %X-Band with enhancement factor 1.5
coeffX2 = 0.0016*2.4; %X-Band with enhancement factor 2.4
coeffKa = 0.00024; %Ka-Band
coeffKa1 = 0.00024*2.4; %Ka-Band with enhancement factor 2.4

Rb = 7.8125;
ratio = 1; %R_b/B_l

sep = 0:0.2:5;

LKa = loss_function_SEP(EbN0, Nc, coeffKa, Rb, sep, ratio);
LKa1 = loss_function_SEP(EbN0, Nc, coeffKa1, Rb, sep, ratio);
LX = loss_function_SEP(EbN0, Nc, coeffX, Rb, sep, ratio);
LX1 = loss_function_SEP(EbN0, Nc, coeffX1, Rb, sep, ratio);
LX2 = loss_function_SEP(EbN0, Nc, coeffX2, Rb, sep, ratio);
LS = loss_function_SEP(EbN0, Nc, coeffS, Rb, sep, ratio);

figure(1)
plot(sep, LKa, sep, LKa1, sep, LX, sep, LX1, sep, LX2, sep, LS, 'LineWidth', 1.5)
xlabel('SEP')
ylabel('Loss[dB]')
title (['E_b/N_0 = ', num2str(EbN0),', R_b = ', num2str(Rb), ', R_b/B_l = ', num2str(ratio)])
legend('Ka-Band','Ka-Band x1.5', 'X-Band','X-Band x1.5','X-Band x2.4','S-Band','Location','Best')
grid on




