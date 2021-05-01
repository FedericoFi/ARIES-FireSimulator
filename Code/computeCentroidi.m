function [centroidi,mat_pBurn] = computeCentroidi(righe,colonne,horizontal_cell,vertical_cell,...
                                                imSeg,matrice_densita,matrice_punti,...
                                                plot_single_cell,plot_bitmap_total,plot_bitmap_total_centroid,plot_bitmap_total_line,plot_heatMap,...
                                                colori,...
                                                cluster,probability_vector_veg,probability_vector_den,pendenza,vento,p_h,a)

    
    [righeT,colonneT]=size(imSeg');
    mat_pBurn=zeros(righeT,colonneT);
    for r=2:righeT-1
        for c=2:colonneT-1
            mat_pBurn(r,c)= compute_pBurn(r,c,pendenza,vento,imSeg',...
                                          matrice_densita,probability_vector_veg,probability_vector_den,p_h,a);
        end
    end
    
    mat_pBurn = mat_pBurn';
    
    offset_vert = rem(colonne,vertical_cell);
    offset_hor = rem(righe,horizontal_cell);
    
    colonne=colonne-offset_vert;
    righe=righe-offset_hor;
    
    mat_pBurn = mat_pBurn(:,1:end- offset_vert);
    mat_pBurn = mat_pBurn(1:end - offset_hor,:);
    
    vertical_element=colonne/vertical_cell;
    horizontal_element=righe/horizontal_cell;

    plotArea2(imSeg,colori,cluster);
    hold on;

    
    N1=horizontal_element*ones(1,horizontal_cell);
    N2=vertical_element*ones(1,vertical_cell);
    B = mat2cell(mat_pBurn,N1,N2);

    centroidi=[0,0];

    add_quote_col=0;
    add_quote_row=0;
    
    [n,m]=size(B);
    immagine=6;
    
    
    matrix_soglie=zeros(horizontal_cell,vertical_cell);
    
    for i=1:n
        for j=1:m
            B1=B{i,j};
            add_quote_col=(j-1)*(colonne/vertical_cell);
            add_quote_row=(i-1)*(righe/horizontal_cell);
            soglia = compute_threshold(B1);
            
            matrix_soglie(i,j)=soglia;
        end
    end
    
    [a,b]=size(matrix_soglie);
    th=0;
    for i=1:a
        for j=1:b
            th=th+matrix_soglie(a,b);
        end
    end
    
    th=th/(a*b);
    
    in=0;
    for i=1:n
        for j=1:m
            in=in+1;
            B1=B{i,j};
            add_quote_col=(j-1)*(colonne/vertical_cell);
            add_quote_row=(i-1)*(righe/horizontal_cell);
            matrice_orig = B1;
            bitMap = B1 > th;
           
            [cenx,ceny]=matrix2centroid(matrice_orig,bitMap,0);
            
            if plot_single_cell
                figure(immagine);
                imagesc(bitMap);
                hold on;
                plot(ceny,cenx,'o-','MarkerSize',10,'MarkerFaceColor','red');
                title('Area ', num2str(in))
            end
            
            if i==1 && j==1
                centroidi(1,1)=cenx;
                centroidi(1,2)=ceny;
            else
                centroidi=vertcat(centroidi,[cenx+add_quote_row,ceny+add_quote_col]);
            end

            figure(3);
            plot(ceny+add_quote_col,cenx+add_quote_row,'o-','MarkerSize',10,'MarkerFaceColor','black','MarkerEdgeColor','red');
            hold on;
            immagine=immagine+1;
            
            if j==1
                bit_map_vert=bitMap;
            else
                bit_map_vert=horzcat(bit_map_vert,bitMap);
            end
        end
        
        if i==1
            bit_map_horz=bit_map_vert;
        else
            bit_map_horz=vertcat(bit_map_horz,bit_map_vert);
        end
    end
    
    [VX,VY] = voronoi(centroidi(:,2),centroidi(:,1));
    plot(VX,VY,'-k','linewidth',2); 
    title('Voronoi partition')
    
    if plot_bitmap_total
        figure(immagine);
        set(gca, 'Visible', 'off');
        imagesc(bit_map_horz);      
        
        hold on;
        
        if plot_bitmap_total_centroid
            [num_cen,~]=size(centroidi);
            for i=1:num_cen
                cenx=centroidi(i,1);
                ceny=centroidi(i,2);
                set(gca, 'Visible', 'off');
                plot(ceny,cenx,'o-','MarkerSize',10,'MarkerFaceColor','red');
                title('Total bitMap');
            end
        end
        
        if plot_bitmap_total_line
            for i=1:vertical_cell-1
                x = [i*vertical_element, i*vertical_element];
                y = [0 righe];
                set(gca, 'Visible', 'off');
                line(x,y,'Color','red','LineStyle','--','LineWidth',2.5);
                title('Total bitMap');
            end
            
            for i=1:horizontal_cell-1
                x = [i*horizontal_element, i*horizontal_element];
                y = [0 colonne];
                set(gca, 'Visible', 'off');
                line(y,x,'Color','red','LineStyle','--','LineWidth',2.5);
                title('Total bitMap');
            end
            
        end
        set(gca, 'Visible', 'on');
        title('Total bitMap');
        hold off;
    end
    
    if plot_heatMap
        figure(immagine);
        colormap turbo;
        imagesc(mat_pBurn);
        title('HeatMap')
    end

end