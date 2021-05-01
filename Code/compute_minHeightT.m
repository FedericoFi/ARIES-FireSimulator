function [minimo,vector_index] = compute_minHeightT(vettore)
    [n,m]=size(vettore);
    minimo=0;
    vector_index=0;
    for i=1:n
        if i==1
            minimo=vettore(1,2);
            vector_index=1;
            
        elseif vettore(i,2)<minimo
            minimo=vettore(i,2);
            vector_inidex=i;
        end
    end
end