function [matrice_classi_centroidi,elementi_perClasse] =  assign2centroid(centroidi,righe,colonne)
    matrice_classi_centroidi = zeros(righe,colonne);
    [numero_centroidi,~]=size(centroidi);
    elementi_perClasse=zeros(1,numero_centroidi);
    
    for i=1:righe
        for j=1:colonne
            
            punto_matrice1 = 0.5 + (i-1);
            punto_matrice2 = 0.5 + (j-1);
            punto_matrice=[punto_matrice1,punto_matrice2];
            
            distanza=0;
            classe=0;
            
            for c = 1:numero_centroidi
                X = [punto_matrice;centroidi(c,1),centroidi(c,2)];
                d = pdist(X,'euclidean');
                
                if c==1
                    distanza = d;
                    classe=1;
                elseif d < distanza
                    distanza = d;
                    classe = c;
                end
            end
            matrice_classi_centroidi(i,j)=classe;
            elementi_perClasse(classe) = elementi_perClasse(classe) + 1;
        end
    end
    
end