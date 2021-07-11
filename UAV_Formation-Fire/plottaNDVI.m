function []=plottaNDVI(matrice_quote, immagine_campionata);%,stato_foresta)
%     matriceDiProva(1,1)=0;
%     matriceDiProva(1,2)=1;
%     matriceDiProva(1,3)=2;
%     matriceDiProva(1,4)=3;

    %colormap(lines(8));
    %colour=[1 1 1;0 0.5 0; 1 0 0; 0 0 0];
    %010
%     [n,m]=size(stato_foresta);
    
    arancione_chiaro=[0.9290,0.6940,0.1250];
    verde_chiaro=[0,1,0];
    verde_scuro=[0,0.5,0];
    rosso_fuoco=[1,0,0];
    rossoNDVI=[0.6350, 0.0780, 0.1840];
    nero=[ 0 0 0];
    
%     fuoco=5;
%     bruciato=6;
%     for righe=1:n
%         for j=1:m
%             if stato_foresta(righe,j)==3
%                 immagine_campionata(righe,j)=fuoco;
%             elseif stato_foresta(righe,j)==4
%                 immagine_campionata(righe,j)=bruciato;
%             end
%         end
%     end
    immagine_campionata(1,1)=1;
    immagine_campionata(1,2)=2;
    immagine_campionata(1,3)=3;
    immagine_campionata(1,4)=4;
    immagine_campionata(1,5)=5;
    immagine_campionata(1,6)=6;
    
    
    colour=[verde_scuro; arancione_chiaro; verde_chiaro; rossoNDVI; rosso_fuoco; nero];
    colormap(colour);
            
    

    surf(matrice_quote,immagine_campionata);
    alpha 0.5;
    xlabel('Righe'), ylabel('Colonne');
    
    
%     colour=[0.5 0.5 0.5 ; 0 0.5 0 ; 1 0 0; 0 0 0];
%     colormap(colour);
%     surf(matrice_quote,matriceDiProva);
end