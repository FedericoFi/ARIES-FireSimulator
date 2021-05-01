function[]=plotCentroid(centroidi,matrice_punti,matrice_classi,plotta_anche_centroidi)    
    giallo=[1 1 0];
    magenta=[1 0 1];
    ciano=[0 1 1];
    rosso_fuoco=[1,0,0];
    verde_chiaro=[0,1,0];
    blu=[0 0 1];
    bianco=[1 1 1];
    arancione_chiaro=[0.9290,0.6940,0.1250];
    
    colour=[giallo;magenta;ciano;rosso_fuoco;verde_chiaro;blu;bianco;arancione_chiaro];
    colormap(colour);
            
    
    surf(matrice_punti,matrice_classi);
    if plotta_anche_centroidi
        hold on;
        [n,wp_N]=size(centroidi);
        for waypoint=1:n
                quota=matrice_punti(round(centroidi(waypoint,2)),round(centroidi(waypoint,1)));
                plot3(centroidi(waypoint,1),centroidi(waypoint,2),quota+5,'black','Marker','.','MarkerSize',45);
            hold on;
        end
    end
    
end