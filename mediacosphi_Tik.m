%funzione che calcola la media del coseno dei campioni di Tikhonov

function M = mediacosphi_Tik(Nmax, k)
C = zeros(1, Nmax);
M = zeros(1, Nmax);

[phi, F] = Tikvar_init(k);

    for I = 1:Nmax;
        X = Tikvar(phi, F); %estraggo un campione di fase
        C(I) = cos(X); %calcolo il coseno del campione estratto
        M(I) = mean(C(1:I)); %calcolo la media dei valori sin qui ottenuti
    end


end