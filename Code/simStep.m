function [foresta,accensione,spegnimento]=simStep(righe,colonne,old_foresta,vegetazione,...
                                                                fittume,pendenza,vento,prob_cont_burn,...
                                                                accensione,spegnimento,iterazione,probability_vector_veg,...
                                                                probability_vector_den,p_h,a)
    
    foresta = ones(righe,colonne);
    for r=2:righe-1
        for c=2:colonne-1
            if old_foresta(r,c)==1 || old_foresta(r,c)==4
                foresta(r,c)=old_foresta(r,c);
            end
            
            if old_foresta(r,c)==3
                prob = rand;
                if prob < prob_cont_burn
                    foresta(r,c)=3;                    
                else
                    foresta(r,c)=4;
                    if spegnimento(r,c)==0
                        spegnimento(r,c)=iterazione;
                    end
                end
            end
            
            if old_foresta(r,c)==2
                vicini=old_foresta(r-1:r+1,c-1:c+1);
                foresta(r,c)=checkFire(r,c,vicini,vegetazione,fittume,pendenza,vento,probability_vector_veg,probability_vector_den,p_h,a);
                if foresta(r,c)==3           
                    if accensione(r,c)==0
                        accensione(r,c)=iterazione;
                    end
                end
                
            end
            
        end
    end
end