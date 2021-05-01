function []=plot_surf(matrice_quote, immagine_campionata,stato_foresta,mappa_colori)
    [n,m]=size(stato_foresta);
    rosso_fuoco=[1,0,0];
    nero=[ 0 0 0];
    
    colori=vertcat(mappa_colori,vertcat(rosso_fuoco,nero));
    
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
         
    colormap(colori);
    

    surf(matrice_quote,immagine_campionata);
end