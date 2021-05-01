function [matrice_delle_classi]=classificaNDVI(matrice_valore_NDVI,delta,vettore_soglie_classi,righe,colonne,cluster,minimoNDVI)
    matrice_delle_classi=zeros(righe,colonne);

    for r=1:righe
        for c=1:colonne
            elemento=matrice_valore_NDVI(r,c);
            for i=1:cluster-1
                if i==1
                    if (elemento >= minimoNDVI) && (elemento < vettore_soglie_classi(i))
                        matrice_delle_classi(r,c)=i;
                        break;
                    end
                elseif (elemento >= vettore_soglie_classi(i-1)) && (elemento < vettore_soglie_classi(i))
                    matrice_delle_classi(r,c)=i;
                    break;
                end
                matrice_delle_classi(r,c)=cluster;
            end
        end
    end
end