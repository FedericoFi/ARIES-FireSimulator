function [minimo,massimo,vector_index_min,vector_index_max] = compute_NDVI_Limit(vettore)
    [n,m]=size(vettore);
    %il vettore passato ha due colonne e n righe, in base al numero dei
    %punti estratti dal GIS
    minimo=0;
    massimo=0;
    vector_index_min=0;
    vector_index_max=0;
    
    for i=1:n
        if i==1
            minimo=vettore(1,2);
            massimo=vettore(1,2);
            vector_index_max=1;
            vector_index_min=1;
            
        elseif vettore(i,2)<minimo
            minimo=vettore(i,2);
            vector_index_min=i;
            
        elseif vettore(i,2)>massimo
            massimo=vettore(i,2);
            vector_index_max=i;
        end
    end
end

