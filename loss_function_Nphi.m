%funzione che restituisce le perdite al variare dell'indice di
%scintillazione secondo la (6.15)

function Loss = loss_function_Nphi(EbN0_dB, Nv, Nphi, Rb, ratio)

mstep = 0.1;
m = mstep:mstep:1; %indice di scintillazione
Nj = length(m); %j = 1,2,...,Nj indice che scorre il vettore m
L_dB = zeros(size(m)); 
A = zeros(1,Nv); %vettore in cui salvo i risultati delle estrazioni fissato un valore di m

%calcolo di rho
EbN0 = 10^(EbN0_dB/10);
theta = 0.9;
Bl = Rb/ratio;
rho = EbN0*Rb*(besselj(0,theta))^2/(2*Bl*(besselj(1,theta))^2); 

for j = 1:Nj; %scorro gli elementi di L_dB e passo all'm successivo

    mval = m(j); %j-esimo valore di m per calcolare il j-esimo valore di L_dB

    for i = 1:Nv; %cicli necessari per il calcolo di L_dB

        v = Ricevar(mval); %generazione di un campione di Rice

        kappa = rho*(v^2); %parametro per il calcolo delle funzioni di Bessel
        
        
        PHI = Tikvar_2(kappa,Nphi); % per ogni campione v genero Nphi campioni di Tikhonov
        
                
        A(i) = v*mean(cos(PHI)); 


    end


    L_dB(j) = 10*log10((mean(A))^-2); %calcolo il valore di L_dB per un dato m: E{v*E[cos(phi)]}

end


Loss = L_dB;

end
