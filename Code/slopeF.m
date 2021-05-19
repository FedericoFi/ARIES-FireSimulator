function cella_vuota=slopeF(righe,colonne,alt_matrix,cell_lenght)
    matrice_zeri=zeros(3,3);
    cella_vuota_riga={};
    cella_vuota={};
    
    for col=1:colonne
        cella_vuota_riga=[cella_vuota_riga,{matrice_zeri}];
    end
    for rig=1:righe
        cella_vuota=[cella_vuota;cella_vuota_riga];
    end
    
    for r=1:righe
        for c=1:colonne
            temp_matrix=zeros(3,3);
            if r==1 || r==righe || c==1 || c==colonne
                cella_vuota{r,c}=temp_matrix;
            else
                alt_cur = alt_matrix(r,c); 
                
                nm11=(alt_cur - alt_matrix(r-1,c-1))/(cell_lenght*1.4142);
                nm12=(alt_cur - alt_matrix(r-1,c))/cell_lenght;
                nm13=(alt_cur - alt_matrix(r-1,c+1))/(cell_lenght*1.4142);
                
                nm21=(alt_cur - alt_matrix(r,c-1))/cell_lenght;
                nm22=0;
                nm23=(alt_cur - alt_matrix(r,c+1))/cell_lenght;
                
                nm31=(alt_cur - alt_matrix(r+1,c-1))/(cell_lenght*1.4142);
                nm32=(alt_cur - alt_matrix(r+1,c))/cell_lenght;
                nm33=(alt_cur - alt_matrix(r+1,c+1))/(cell_lenght*1.4142);
                
                temp_matrix(1,1)=rad2deg(atan(nm11));
                temp_matrix(1,2)=rad2deg(atan(nm12));
                temp_matrix(1,3)=rad2deg(atan(nm13));
                temp_matrix(2,1)=rad2deg(atan(nm21));
                temp_matrix(2,2)=0;
                temp_matrix(2,3)=rad2deg(atan(nm23));
                temp_matrix(3,1)=rad2deg(atan(nm31));
                temp_matrix(3,2)=rad2deg(atan(nm32));
                temp_matrix(3,3)=rad2deg(atan(nm33));
                
                cella_vuota{r,c}=temp_matrix;
            end
                
        end
    end

end