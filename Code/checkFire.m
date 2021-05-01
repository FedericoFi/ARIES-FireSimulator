function stato = checkFire(riga,colonna,vicini,vegetazione,fittume,pendenza,vento,probability_vector_veg,probability_vector_den,p_h,a)
    NDVI_class=vegetazione(riga,colonna);
    p_veg=probability_vector_veg(NDVI_class);
    
    density=fittume(riga,colonna);
    p_den=probability_vector_den(density);
 
    for r=1:3
        for c=1:3
            if vicini(r,c)==3
                slope=pendenza{riga,colonna}(r,c);
                p_slope=exp(a*slope);
                p_wind=vento(r,c);
                p_burn=p_h*(1+p_veg)*(1+p_den)*p_wind*p_slope;
                if p_burn > rand
                    stato=3;                    
                    return;
                end
            end
        end
    end
    stato=2;
end