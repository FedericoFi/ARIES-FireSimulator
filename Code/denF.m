function densita=denF(righe,colonne)
    densita=zeros(righe,colonne);
    for r=1:righe
        for c=1:colonne
            densita(r,c)=1;
        end
    end
end