function macchione=make_macF(righe,colonne,vegetazione)
    macchione=zeros(righe,colonne);
    for r=1:righe
        for c=1:colonne
            if vegetazione(r,c)==1
                macchione(r,c)=1;
            else
                macchione(r,c)=2;
            end
            
        end
    end

end