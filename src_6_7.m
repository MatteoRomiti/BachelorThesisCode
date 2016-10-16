%plotta sull'asse y le perdite, sul'asse x l'indice di scintillazione m
%vengono sovrapposti gli andamenti delle perdite per le 3 diverse formule 

%creazione indice di scintillazione per asse x
step = 0.1;
indScint = step:step:1; %indice di scintillazione

EN = 3; %E_b/N_0 in dB


Nv = 10^4; %numero di campioni della variabile di Rice da estrarre per ogni valore di m per il calcolo delle perdite
Nphi = 10^2; %numero di campioni della variabile di Tikhonov da estrarre per ogni valore di m per il calcolo delle perdite
Rb = 7.8125; %bit-rate
ratio = 1; %R_b/B_l

%tc = 3.72*10^-3; %tempo di coerenza Ka-band
%tc = 7.25*10^-3; %X-band
%tc = 13.9*10^-3; %S-band

L1 = loss_function_ratio(EN,Nv, Rb, ratio); %calcolo delle perdite con la (6.4)
L2 = loss_function_Nphi(EN,Nv,Nphi, Rb, ratio); %calcolo delle perdite con la (6.15)
L3 = loss_function_Nphi_Ephi(EN,Nv,Nphi, Rb, ratio); %calcolo delle perdite con la (6.16)

plot(indScint, L1, indScint, L2, indScint, L3, 'LineWidth',1.5)
xlabel('indice di scintillazione')
ylabel('Loss[dB]')
title (['R_b = ',num2str(Rb),', R_b/B_l = ', num2str(ratio), ', N_v = ', num2str(Nv), ', N_\phi = ', num2str(Nphi), ', E_b/N_0 = ', num2str(EN)])
legend('E[v*cos(\phi)]','E[v*E[cos(\phi)]]','E[v*cos(E[\phi])]', 'Location','Best')
grid on