function [matrice_NDVI,minimo,massimo,matrice_classificata,colori]=letturaNDVI(nome_file,nome_file_colori,vector_conversion,righe,colonne,cluster,matrice_punti,plot_NDVI)
     vettore_dati= extractDataT(nome_file, vector_conversion);
     
     [minimo,massimo,i_min,i_max]=compute_NDVI_Limit(vettore_dati);
     
     max_delta=abs(minimo)+abs(massimo);
     
     delta_steps=max_delta/cluster;
     
     colori = leggiColori(nome_file_colori,cluster);
     colori = colori/256;
     
     
     vettore_soglie_classi=zeros(cluster,1);
     for c=1:cluster
         vettore_soglie_classi(c)= minimo + (c*delta_steps);
     end
     
     matrice_NDVI=splitVect2MatrixT_NDVI(vettore_dati,righe,colonne);
     
     matrice_classificata = classificaNDVI(matrice_NDVI,delta_steps,vettore_soglie_classi,righe,colonne,cluster,minimo);
     
     
    if plot_NDVI
        figure(1);
        colormap(colori);
        surf(matrice_punti',matrice_classificata');
        title('NDVI data')
        hold on;
    end
     
end