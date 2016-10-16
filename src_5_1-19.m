%densità di probabilità di Tikhonov simulata e analitica
 
%definizione di parametri e variabili
phistep = pi/100; %passo di discretizzazione di phi
phi = -pi:phistep:pi; 
k = 50; %argomento della funzione di Bessel modificata
Nc = 10^6;%numero di campioni di Tikhonov generati
Nj = 10^2; %ultimo termine della serie della cdf di Tikhonov
f = zeros(size(phi)); %inizializzo la densità di probabilità a 0
 
%definizione della funzione di ripartizione
F1 = (phi+pi)/(2*pi);
F2 = 1/(pi*besseli(0,k));
F3 = 0;

for j = 1:Nj;     
	F3 = F3+(besseli(j,k)*sin(j*phi))/j;
end
F = F1+F2*F3;
 
%ciclo per ottenere Nc campioni della variabile di Tikhonov
for i = 1:Nc;
    V = rand; %generazione variate con statistica uniforme nell'intervallo [0;1]
    n = find(F>V,1);   
    
    distSX = V-F(n-1); %calcolo la distanza dall'elemento precedente
    distDX = F(n)-V; %calcolo la distanza dall'elemento successivo
    
    if distSX < distDX %se è più vicino al precedente, sposto n 
        n = n-1; 
    end
    f(n) = f(n)+1; %creo la densità di probabilità
    
end


Mi = mean(f); %valore medio della densità di probabilità prima della normalizzazione
f = f/(Mi*2*pi); %normalizzazione
Mf = mean(f); %valore medio dopo la normalizzazione
%f è normalizzata se Mf*2*pi=1
 
%definisco analiticamente la densità di probabilità
pdf = exp(k*cos(phi))/(2*pi*besseli(0,k));

figure(1)
plot(phi, f, phi, pdf,'LineWidth', 1.5) %sovrappongo la densità di probabilità analitica e simulata
xlabel('\phi')
ylabel('pdf')
legend('pdf simulata','pdf analitica','Location','Best')
title (['Densità di probabilità di Tikhonov analitica e simulata con N_c = ', num2str(Nc),', N_j = ', num2str(Nj),', \kappa = ', num2str(k), ', passo = ', num2str(phistep)])
grid on

err = (pdf-f); %differenza tra densità analitica e simulata
errPerc = (abs(err)./pdf)*100; %errore percentuale 
mse = mean(err.^2); %mean square error

figure(2)
plot(phi,err)
xlabel('\phi')
ylabel('e')
title (['N_c = ', num2str(Nc),', N_j = ', num2str(Nj), ', \kappa = ', num2str(k), ', passo = ', num2str(phistep)])
grid on
 
figure(3)
plot(phi,errPerc)
xlabel('\phi')
ylabel('errPerc')
title (['N_c = ', num2str(Nc),', N_j = ', num2str(Nj), ', \kappa = ', num2str(k), ', passo = ', num2str(phistep)])
grid on
