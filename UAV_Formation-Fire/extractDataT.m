function vet = leggiDati(nome_file,vector_conversion)
    vet = readtable(nome_file);
    %vet=vet*1000;
    
    if vector_conversion
        [n,m]=size(vet);
        vet2=zeros(n,m);
        for i=1:n
            vet2(i,1)=i;
            vet2(i,2)=vet{i,2};           
        end
        vet=vet2;
    end
    %vet=readmatrix(nome_file);
    
end
