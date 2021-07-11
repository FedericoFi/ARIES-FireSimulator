function [cen,row,col,numero_centroidi,numero_wp]=adj_cen(cen_input,mat_points)
    centroidi2=cen_input';
    [row,col]=size(centroidi2);
    vet_add = zeros(1,col);
    for i=1:col
        pos_x=round(centroidi2(1,i));
        pos_y=round(centroidi2(2,i));
        vet_add(i)=-50-mat_points(pos_x,pos_y);
    end
    cen=vertcat(centroidi2,vet_add);
    numero_centroidi=col;
    numero_wp=col;
end