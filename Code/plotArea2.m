function [] = plotArea2(immagine_originale,colori,cluster)

    immagine=immagine_originale;
    for i=1:cluster
        immagine(1,i)=i;
    end

    figure(3);
    colormap(colori);
    imagesc(immagine,'AlphaData', .65);
    
end