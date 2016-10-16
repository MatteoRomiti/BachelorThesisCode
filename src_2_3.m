%plotta l'andamento dell'indice di scintillazione al variare del SEP

SEP = 0:0.001:5; %asse x

mS = sind(SEP).^(-1.55)*0.01;
mX = sind(SEP).^(-1.55)*0.0016;
mX1 = sind(SEP).^(-1.55)*0.0016*1.5;
mX2 = sind(SEP).^(-1.55)*0.0016*2.4;
mKa = sind(SEP).^(-1.55)*0.00024;
mKa1 = sind(SEP).^(-1.55)*0.00024*2.4;

plot(SEP, mS, SEP, mX,SEP, mX1,SEP, mX2, SEP, mKa,SEP, mKa1, 'LineWidth', 1.5)
xlabel('SEP (deg)')
ylabel('m')
axis([0 5 0 1])
legend('S-Band','X-Band','X-Band x1.5','X-Band x2.4', 'Ka-Band','Ka-Band x2.4','Location','Best')
title ('Indice di scintillazione')
grid on