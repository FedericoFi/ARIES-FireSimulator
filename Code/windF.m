function matrice_vento=windF(wind_a,wind_v,c1,c2)
    matrice_vento=zeros(3,3);
    infl_mat=[  45,0,-45;
            90,0,-90;
            135,180,-135];

    theta=infl_mat-wind_a;

    [n,m]=size(theta);
    if n>3 || m>3
        start_row=fix(n/2)+1;
        start_col=fix(m/2)+1;
        sub_matrix=theta([start_row-1:start_row+1],[start_col-1:start_col+1]);
        theta=sub_matrix;
    end
    
    v=wind_v;
    
    for r=1:3
        for c=1:3
            angolo_rad=deg2rad(theta(r,c));
            num=exp(v*c2*(cos(angolo_rad)-1));
            num2=exp(c1*v)*num;
            matrice_vento(r,c)=num2;
        end
    end
    matrice_vento(2,2)=0;
end