function mappa_colori = leggiColori(nome_file,cluster)
    M=readmatrix(nome_file);
    mappa_colori=zeros(cluster,3);
    
    for i=1:cluster
        mappa_colori(i,:) = [M(i,2), M(i,3), M(i,4)];
    end
    
end