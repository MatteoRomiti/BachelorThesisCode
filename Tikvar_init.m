%inizializza i vettori phi e F per il calcolo del campione della variabile di Tikhonov
%k = rho*v^2, dove rho è il SNR della portante del PLL e v è un campione
%della variabile di Rice

function [phi, F] = Tikvar_init(k)
    if k<0
        disp('ERROR! k < 0!');
    end

    phistep = pi/100; %il passo di discretizzazione dei campioni della fase
    phi = -pi:phistep:pi; %i campioni di fase verranno estratti da questo vettore
    Nj = 10^2; %ultimo termine della serie della funzione di ripartizione di Tikhonov

    %funzione di ripartizione (viene scomposta in 3 parti, di cui l'ulima è
    %la serie
    F1 = (phi+pi)/(2*pi); 
    F2 = 1/(pi*besseli(0,k)); %besseli: funzione di Bessel modificata di ordine 0
    F3 = 0;
    
    for j = 1:Nj;     
        F3 = F3+(besseli(j,k)*sin(j*phi))/j;
    end

    F = F1+F2*F3;

end
