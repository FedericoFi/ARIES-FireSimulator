clear all;
close all;
clc;

%===========    File section     ===========
name_file='Data/terrain_altitude.csv';
name_file_NDVI='Data/NDVI_factor.csv';
name_file_colors='Data/colors.txt';
name_file_output='fire_simulation.mat';
name_file_output_tensor='fire_simulation_tensor.mat';


save_file=0;                    %save simulation file
allocate_tensor=1;              %store simulation iterations


cluster_NDVI=4;                 %Cluster of NDVI classification
cluster_density=1;              %Cluster of density classification


rows=104;                       %ROWS of model
cols=132;                       %COLS of model

%===========    Variables for plots ===========
DPlot=1;
plotCen3D=0;
plot_wind=1;
plot_macro_cell=0;              %plot macro cell M in centroid calculation function
plot_bitmap_total=0;            %plot entire bitmap
plot_bitmap_total_centroid=1;   %plot centroids on total bitmap
plot_bitmap_total_line=1;       %plot line division in total bitmap
plot_NDVI=0;                    %plot NDVI surface
plot_voronoi=1;                 %plot Voronoi diagram
plot_simulation=1;


iterazioni=50;                   %Simulation iterations


vector_conversion=1;

cell_lenght=10;                 %Real side cell lenght (meters)

horizontal_division=2;          %Environment horizontal division
vertical_division=4;            %Envitonment vertical division


%===========  Wind characteristics ===========
wind_angle=90;                  %Degrees 
wind_vel=10;                    %m/s


%===========  Model parameters ===========
p_h=0.58;
a=0.078;   
c1=0.045;
c2=0.131;

prop_continous_burn=0.4;


%===========  Probability vectors ===========
probability_vector_veg=[-0.9,0.4,0.1,-0.3];
probability_vector_den=0;




%===========    ! Fire ignition point !   =========== 
burning_col=4;
burning_row=125;
%====================================================



%===========  Wind Arrow parameters ===========
width=0.5;
tip=1;
len=20;



%===========    Data reading section    =========== 
[vettore_dati,minima_altitudine,matrice_punti]=environment(name_file,vector_conversion,rows,cols);
[matriceNDVI,minNDVI,maxNDVI,matriceNDVI_classi,colors] = letturaNDVI(name_file_NDVI,name_file_colors,1,rows,cols,cluster_NDVI,matrice_punti,plot_NDVI);



temp=rows;
rows=cols;
cols=temp;  
vegetazione=matriceNDVI_classi';

density=denF(rows,cols);
matrice_vento=windF(wind_angle,wind_vel,c1,c2);


nuova_foresta=make_macF(rows,cols,vegetazione);
nuova_foresta(burning_row,burning_col)=3;
matrice_slope=slopeF(rows,cols,matrice_punti',cell_lenght);


startF=zeros(rows,cols);                    %Matrix for sign ignition iteration
stopF=zeros(rows,cols);                     %Matrix for sign shutdown iteration
startF(burning_row,burning_col)=1;
%===========    TENSOR for simulation record    =========== 
if allocate_tensor
    tensore=zeros(rows,cols,iterazioni);
    tensore(:,:,1)=nuova_foresta;
end



%============================= Simulation iterations =============================
for i=2:iterazioni
    [nuova_foresta,startF,stopF]=simStep(rows,cols,nuova_foresta,...
                                            vegetazione,density,matrice_slope,matrice_vento,...
                                            prop_continous_burn,startF,stopF,i,...
                                            probability_vector_veg,probability_vector_den,p_h,a);
    if plot_simulation
        figure(2);
        plot_surf(matrice_punti',matriceNDVI_classi',nuova_foresta,colors);
        view(250,35);
        set(gcf, 'WindowState', 'maximized');
        title('Simulation')
        hold on;
    end
   
    if allocate_tensor
        tensore(:,:,i)=nuova_foresta;
    end
end


if plot_wind
    mArrow3([80,60,350],[80+len*sin(deg2rad(wind_angle)),60+len*cos(deg2rad(wind_angle)),350],...
        'color','black','stemWidth',width,'facealpha',0.5,'tipWidth',tip);
end
hold off;


centroidi = computeCentroidi(cols,rows,horizontal_division,vertical_division,...
                                    matriceNDVI_classi,density,matrice_punti,...
                                    plot_macro_cell,plot_bitmap_total,plot_bitmap_total_centroid,plot_bitmap_total_line,...
                                    colors,cluster_NDVI,probability_vector_veg,...
                                    probability_vector_den,matrice_slope,matrice_vento,p_h,a);

                                
if plotCen3D
    [n,m]=size(centroidi);
    for i=1:n
        quota=matrice_punti(round(centroidi(i,1)),round(centroidi(i,2)));
        figure(1);
        plot3(centroidi(i,1),centroidi(i,2),quota+5,'Marker','.','MarkerSize',50,'Color','black');
        hold on;
    end
    hold off;
end


if save_file
    if allocate_tensor
        save(name_file_output_tensor,'tensore','centroidi','startF','stopF','matrice_punti','matriceNDVI_classi','cell_lenght','suddivisione_verticale','suddivisione_orizzontale','wind_angle','wind_vel');
    else
        save(name_file_output,'centroidi','startF','stopF','matrice_punti','matriceNDVI_classi','cell_lenght','suddivisione_verticale','suddivisione_orizzontale','wind_angle','wind_vel');
    end
end


