function []=print_wps(WP,tol)
    [n,wp_N]=size(WP);
    for waypoint=1:wp_N
        plot3(WP(1,waypoint),WP(2,waypoint),-WP(3,waypoint),'Marker','.','MarkerSize',25);
        hold on;
        if tol 
            plotCircle3D([WP(1,waypoint),WP(2,waypoint),-WP(3,waypoint)],[0,0,0],5)
        end
    end
    
end
