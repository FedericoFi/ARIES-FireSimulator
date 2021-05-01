function matrice_punti=splitVect2MatrixT(vettore,righe,colonne,alt_min)
    matrice_punti = zeros(righe,colonne);
    indice=1;
    for i=1:righe
        for j=1:colonne
            matrice_punti(i,j) = vettore(indice,2)-alt_min;
            indice=indice+1;
        end
    end
end