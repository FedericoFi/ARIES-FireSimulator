function sum = compute_pBurn(row,col,pendenza,vento,...
                                vegetazione,matrice_densita,...
                                probability_vector_veg,probability_vector_den,...
                                p_h,a)

    NDVI_class=vegetazione(row,col);
    p_veg=probability_vector_veg(NDVI_class);
    
    density=matrice_densita(row,col);
    p_den=probability_vector_den(density);
    
    sum=0;
    for r=1:3
        for c=1:3
            slope=pendenza{row,col}(r,c);
            p_slope=exp(a*slope);
            p_wind=vento(r,c);
            pBurn=p_h*(1+p_veg)*(1+p_den)*p_wind*p_slope;
            %disp(pBurn);
            sum=sum+pBurn;
        end
    end
    sum=sum/8;
end