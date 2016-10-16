%phi ed F devono essere inizializzati con Tikvar_init.m
%restituisce un campione della variabile di Tikhonov X

function X = Tikvar(phi, F)

    V = rand; %generazione variate con statistica uniforme nell'intervallo [0;1]
    n = find(F>V,1); %cerco nel vettore F la posizione del primo elemento che ha valore superiore al campione V estratto   
    distSX = V-F(n-1); %calcolo la distanza dall'elemento precedente
    distDX = F(n)-V; %calcolo la distanza dall'elemento successivo
    
    if distSX < distDX %se è più vicino al precedente, sposto n 
        n = n-1;
    end
    
    X = phi(n); %campione della variabile di Tikhonov,ossia corrispondente valore della funzione inversa 

end