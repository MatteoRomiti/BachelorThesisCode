%funzione che restituisce le perdite al variare del SEP

function Loss = loss_function_SEP(EbN0_dB, Ni, coeff, Rb, SEP, ratio)

m = sind(SEP).^(-1.55)*coeff;

Nj = length(SEP); %j = 1,2,...,Nj indice che scorre il vettore m
L_dB = zeros(size(SEP)); 
A = zeros(1,Ni); %vettore in cui salvo i risultati delle estrazioni fissato in valore di m

%calcolo di rho
EbN0 = 10^(EbN0_dB/10);
theta = 0.9;
Bl = Rb/ratio;
rho = EbN0*Rb*(besselj(0,theta))^2/(2*Bl*(besselj(1,theta))^2); 

for j = 1:Nj; %scorro gli elementi di L_dB e passo al SEP successivo (a cui corrisponde un m)

    mval = m(j); %j-esimo valore di m per calcolare il j-esimo valore di L_dB
    if mval > 1 %controllo il valore di m
        mval = 1; %saturazione
    end
    
    for i = 1:Ni; %cicli necessari per il calcolo di L_dB

        v = Ricevar(mval); %generazione campione di Rice

        kappa = rho*(v^2); %parametro per il calcolo delle funzioni di Bessel

        [phi, F] = Tikvar_init(kappa); %inizializzazione vettori
        PHI = Tikvar(phi, F); %generazione campione di Tikhonov
               
        A(i) = v*cos(PHI); %salvo il risultato dell'estrazione i-esima


    end


    L_dB(j) = 10*log10((mean(A))^-2); %calcolo il valore di L_dB per un dato SEP (o il relativo m)

end


Loss = L_dB;

end