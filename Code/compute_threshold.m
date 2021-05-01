function accumulatore=compute_threshold(imm)
    [n,m]=size(imm);
    
    iterazioni=0;
    accumulatore=0;
    
    for i=1:n
        for j=1:m
            valore=imm(i,j);
            iterazioni=iterazioni+1;
            accumulatore=accumulatore+valore;
        end

    end
    %disp(accumulatore);
    accumulatore=accumulatore/iterazioni;
end