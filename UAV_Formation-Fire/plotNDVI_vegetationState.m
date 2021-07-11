function [h]=plotNDVI_vegetationState(matrice_quote, immagine_campionata,tensore,piano_tensore,colori)%,stato_foresta)

    stato_foresta=tensore(:,:,piano_tensore);
    [n,m]=size(stato_foresta);
    
    rosso_fuoco=[1,0,0];
    rossoNDVI=[0.6350, 0.0780, 0.1840];
    nero=[ 0 0 0];
    

    colori=vertcat(colori,rosso_fuoco);
    colori=vertcat(colori,nero);
    colormap(colori);

    
    fuoco=5;
    bruciato=6;
    for righe=1:n
        for j=1:m
            if stato_foresta(righe,j)==3
                immagine_campionata(righe,j)=fuoco;
            elseif stato_foresta(righe,j)==4
                immagine_campionata(righe,j)=bruciato;
            end
        end
    end
    
    immagine_campionata(1,1)=1;
    immagine_campionata(1,2)=2;
    immagine_campionata(1,3)=3;
    immagine_campionata(1,4)=4;
    immagine_campionata(1,5)=5;
    immagine_campionata(1,6)=6;
    
    

    colori(1,:)=rossoNDVI;
    colormap(colori);
            
    

    h=surf(matrice_quote,immagine_campionata);
    alpha 0.8;
end