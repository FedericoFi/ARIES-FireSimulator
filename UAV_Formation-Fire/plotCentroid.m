function[]=plotCentroid(centroidi,matrice_punti,matrice_classi,plot_cen)    
    colormap(hsv);
    surf(matrice_punti,matrice_classi);
    if plot_cen
        hold on;
        [n,wp_N]=size(centroidi);
        for waypoint=1:n
                quota=matrice_punti(round(centroidi(waypoint,2)),round(centroidi(waypoint,1)));
                plot3(centroidi(waypoint,1),centroidi(waypoint,2),quota+5,'black','Marker','.','MarkerSize',45);
            hold on;
        end
    end
    
end