function matrice_punti=splitVect2Matrix(vettore,righe,colonne)
    matrice_punti = zeros(righe,colonne);
    indice=1;
    for i=1:righe
        for j=1:colonne
            matrice_punti(i,j) = vettore(indice,2);
            indice=indice+1;
        end
        %indice=indice+1;
    end
end