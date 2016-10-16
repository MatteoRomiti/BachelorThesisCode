%calcolo delle perdite con la (6.16)
%plotta sull'asse y le perdite, sul'asse x l'indice di scintillazione m
%vengono sovrapposti gli andamenti al variare di EbN0=EN

%creazione indice di scintillazione per asse x
step = 0.1;
indScint = step:step:1; %indice di scintillazione

%creo il vettore E_b/N_0 
EN = 0:10; 

Nv = 10^4; %numero di campioni della variabile di Rice da estrarre per ogni valore di m per il calcolo delle perdite
Nphi = 10^2; %numero di campioni della variabile di Tikhonov da estrarre per ogni valore di m per il calcolo delle perdite
Rb = 7.8125; %bit-rate
ratio = 1; %R_b/B_l

%tc = 3.72*10^-3; %Ka-band
%tc = 7.25*10^-3; %X-band
%tc = 13.9*10^-3; %S-band

L0 = loss_function_Nphi_Ephi(EN(1),Nv,Nphi, Rb, ratio); 

L3 = loss_function_Nphi_Ephi(EN(4),Nv,Nphi, Rb, ratio);

L6 = loss_function_Nphi_Ephi(EN(7),Nv,Nphi,Rb, ratio);

plot(indScint, L0, indScint, L3, indScint, L6, 'LineWidth',1.5)
xlabel('indice di scintillazione')
ylabel('Loss[dB]')
title (['E[v*cos(E[\phi])], R_b = ', num2str(Rb), ', R_b/B_l=',num2str(ratio),', N_v = ', num2str(Nv), ', N_\phi = ', num2str(Nphi)])
legend('E_b/N_0=0dB','E_b/N_0=3dB', 'E_b/N_0=6dB', 'Location','Best')
grid on