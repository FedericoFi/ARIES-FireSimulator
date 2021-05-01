function [x,y]=matrix2centroid(matrice_orig,bitMap,plot_computed_centroid)
    [rows, cols] = ndgrid(1:size(matrice_orig, 1), 1:size(matrice_orig, 2));
    elemento1=matrice_orig(bitMap);
    elemento2=rows(bitMap);
    elemento3=cols(bitMap);
    x = sum(elemento2 .* elemento1) / sum(elemento1); 
    y = sum( elemento3 .* elemento1) / sum(elemento1);
    if plot_computed_centroid
        plot(y,x,'o-','MarkerFaceColor','red','MarkerEdgeColor','red');
        hold on;
    end
end