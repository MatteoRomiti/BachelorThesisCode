%funzione che restituisce le perdite al variare dell'indice di
%scintillazione

%richiede in ingresso:
    %Eb/N0_dB 
    %Ni, numero di campioni da estrarre per ogni valore di m
    %Rb, bit rate
    %ratio=Rb/Bl

function Loss = loss_function_ratio(EbN0_dB, Ni, Rb, ratio)

mstep = 0.1;
m = mstep:mstep:1; %indice di scintillazione
Nj = length(m); %j = 1,2,...,Nj indice che scorre il vettore m
L_dB = zeros(size(m)); 
A = zeros(1,Ni); %vettore in cui salvo i risultati delle estrazioni fissato un valore di m

%calcolo di rho
EbN0 = 10^(EbN0_dB/10);
theta = 0.9;

%Bl=Rb/0.9;
Bl = Rb/ratio; 
rho = EbN0*Rb*(besselj(0,theta))^2/(2*Bl*(besselj(1,theta))^2);

for j = 1:Nj; %scorro gli elementi di L_dB e passo all'm successivo

    mval = m(j); %j-esimo valore di m per calcolare il j-esimo valore di L_dB

    for i = 1:Ni; %estrazioni dei campioni di Rice e Tikhonov

        v = Ricevar(mval); %generazione campione di Rice

        kappa = rho*(v^2); %parametro per il calcolo delle funzioni di Bessel

        if kappa > 700 %valore massimo con cui le funzioni di Bessel riescono a lavorare
            kappa = 700; %saturazione
        end
        
        [phi, F] = Tikvar_init(kappa); %inizializzazione vettori
        PHI = Tikvar(phi, F); %generazione campione di Tikhonov

        A(i) = v*cos(PHI); %salvo il risultato dell'estrazione i-esima


    end


    L_dB(j) = 10*log10((mean(A))^-2); %calcolo il valore di L_dB per un dato m

end


Loss = L_dB;

end