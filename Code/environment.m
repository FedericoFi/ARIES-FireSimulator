function [vettore_dati,minima_altitudine,matrice_punti]=environment(nome_file,vector_conversion,righe,colonne)
    vettore_dati = extractDataT(nome_file, vector_conversion);                      %Read CSV file 
    [minima_altitudine,~] = compute_minHeightT(vettore_dati);                       %Compute minimum altitude for scale model
    matrice_punti=splitVect2MatrixT(vettore_dati,righe,colonne,minima_altitudine);  
end
