%prende in input k e restituisce Ni campioni di Tikhonov, salvati
%all'interno del dettore X
%N.B.: questa funzione può essere usata se il campione di Rice è fisso

function X = Tikvar_2(k,Ni)
    if k<0
        disp('ERROR! k < 0!');
    end

    phistep = pi/100;%il passo di discretizzazione dei campioni della fase
    phi = -pi:phistep:pi; 
    Nj = 10^2; %ultimo termine della serie della funzione di ripartizione di Tikhonov
    X = zeros(1,Ni);%preallocation

    %funzione di ripartizione (viene scomposta in 3 parti, di cui l'ulima è
    %la serie
    F1 = (phi+pi)/(2*pi);
    F2 = 1/(pi*besseli(0,k));
    F3 = 0;
    for j = 1:Nj;     
        F3 = F3+(besseli(j,k)*sin(j*phi))/j;
    end

    F = F1+F2*F3;

    for i = 1:Ni;
        V = rand; %generazione variate con statistica uniforme nell'intervallo [0;1]
        n = find(F>V,1); %posizione nel vettore F del valore più vicino alla variate generata  
        distSX = V-F(n-1); %calcolo la distanza dall'elemento precedente
        distDX = F(n)-V; %calcolo la distanza dall'elemento successivo
        if distSX < distDX %se è più vicino al precedente, sposto n 
            n = n-1;
        end
        X(i) = phi(n); %campione della variabile di Tikhonov,ossia corrispondente valore della funzione inversa 
    end

end