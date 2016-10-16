%prende in input ScintFact (indice di scintillazione m) e restituisce Gain = campione di Rice
%deve essere 0 < ScintFact < 1, altrimenti Gain ha parte reale e
%immaginaria

function Gain = Ricevar(ScintFact)
    Campioni = 1; % campioni generati

    RiceFactor = (1/(ScintFact^2)-1)+sqrt((1/(ScintFact^2)-1)^2+(1/(ScintFact^2)-1)); % rice factor

    mu = sqrt(RiceFactor/(RiceFactor+1)); 
    sigma = sqrt(1/2/(RiceFactor+1));

    Xvect = mu + sigma*randn(1,Campioni);
    Yvect = sigma*randn(1,Campioni);
    
Gain = sqrt((Xvect.^2) + (Yvect.^2));
