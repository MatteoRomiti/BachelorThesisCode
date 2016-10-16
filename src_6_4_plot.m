%plotta sull'asse y le perdite al variare dell'angolo SEP
%vengono sovrapposti gli andamenti smussati ottenuti da "src_6_4_calcolo.m" per le bande Ka, X, S

sep = 0:0.2:5; %asse x 
Rb = 7.8125;
EbN0 = 3; 
Nc = 10^4; %numero di estrazioni
ratio = 0.1; %rapporto R_b/B_l

%dati ricavati dalla figura ottenuta con "src_6_4_calcolo.m"
LossKa = [3.0117, 2.8756, 3.0130, 2.9244, 3.0614, 3.1097, 3.1178, 2.9351, 2.9334, 2.9233, 2.9040, 2.9502, 2.9662, 2.9586, 3.0084, 2.8948, 2.6775, 2.4477, 2.3891, 2.2484, 2.0861, 1.9925, 1.9759, 1.8158, 1.7008, 1.7413];
LossKa1 = [2.9679, 2.9375, 2.9118, 2.9589, 2.9416, 3.0036, 2.9626, 3.0373, 2.9858, 2.5049, 2.1979, 1.9337, 1.9046, 1.7145, 1.6397, 1.6747, 1.5234, 1.4748, 1.4404, 1.4698, 1.4119, 1.4032, 1.3702, 1.3465, 1.3501, 1.3858];
LossX = [3.0258, 2.9559, 3.0388, 2.8947, 2.9280, 3.0871, 2.9793, 2.4254, 2.0606, 1.8877, 1.6433, 1.6017, 1.5159, 1.4319, 1.4363, 1.3825, 1.3916, 1.3688, 1.3592, 1.3548, 1.3362, 1.3341, 1.3615, 1.3490, 1.3307, 1.3138];
LossX1 = [3.0560, 3.0480, 3.0426, 2.9455, 2.9910, 2.7294, 2.1919, 1.9320, 1.6343, 1.5327, 1.4874, 1.4606, 1.3978, 1.3820, 1.3529, 1.3837, 1.3688, 1.3410, 1.3372, 1.3289, 1.2793, 1.3070, 1.3325, 1.3139, 1.2956, 1.2967];
LossX2 = [2.9782, 2.8602, 2.9472, 2.3192, 1.6807, 1.4828, 1.3913, 1.3724, 1.3748, 1.3144, 1.3216, 1.2969, 1.3310, 1.3454, 1.2753, 1.3187, 1.2955, 1.3030, 1.2921, 1.3064, 1.3049, 1.3165, 1.2790, 1.2720, 1.2889, 1.3101];
LossS = [2.9728, 2.8384, 1.9693, 1.4838, 1.3499, 1.3490, 1.3029, 1.3131, 1.2964, 1.3157, 1.2943, 1.3000, 1.2859, 1.2983, 1.2704, 1.2652, 1.3277, 1.2679, 1.3237, 1.2612, 1.2895, 1.2800, 1.2685, 1.3033, 1.2711, 1.3086];


smthPerc = 0.2; %percentuale di smussamento
LLKa = smooth(sep,LossKa, smthPerc, 'rloess');
LLKa1 = smooth(sep,LossKa1, smthPerc, 'rloess');
LLX = smooth(sep,LossX, smthPerc, 'rloess');
LLX1 = smooth(sep,LossX1, smthPerc, 'rloess');
LLX2 = smooth(sep,LossX2, smthPerc, 'rloess');
LLS = smooth(sep,LossS, smthPerc, 'rloess');

plot(sep, LLKa, sep, LLKa1, sep, LLX, sep, LLX1, sep, LLX2, sep, LLS, 'LineWidth', 1.5)
xlabel('SEP')
ylabel('Loss[dB]')
title (['E_b/N_0 = ', num2str(EbN0),', R_b = ', num2str(Rb), ', R_b/B_l = ', num2str(ratio), ', N_c = ', num2str(Nc)])
legend('Ka-Band','Ka-Band x1.5', 'X-Band','X-Band x1.5','X-Band x2.4','S-Band','Location','Best')
grid on