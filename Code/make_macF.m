function mac=make_macF(righe,colonne,vegetazione)
    mac=zeros(righe,colonne);
    for r=1:righe
        for c=1:colonne
            if vegetazione(r,c)==1
                mac(r,c)=1;
            else
                mac(r,c)=2;
            end
            
        end
    end

end