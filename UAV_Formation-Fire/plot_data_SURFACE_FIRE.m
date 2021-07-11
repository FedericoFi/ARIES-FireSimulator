clc;
wp_ok=1;
plot_surface=1;


[n,m]=size(out.livello_tensore.signals.values);
piano_tensore=out.livello_tensore.signals.values(n,1);


righe=ct;
colonne=rt;
nome_file_NDVI='NDVI_factor.csv';
nome_file_colori='colori4classi.txt';
cluster_NDVI=4;
plot_NDVI=0;
[matriceNDVI,minNDVI,maxNDVI,matriceNDVI_classi,colori] = letturaNDVI(nome_file_NDVI,nome_file_colori,1,...
                                                                      righe,colonne,cluster_NDVI,matrice_punti,plot_NDVI);
                                                                  
                                                                                                                              
[n,m]=size(out.Position.signals.values);
formation_initial_point=2000;

traj_wid=2;

figure(1);
UAV1=plot3(out.Position.signals.values(:,1),out.Position.signals.values(:,2),out.Position.signals.values(:,3),'linewidth',traj_wid);
hold on;
UAV2=plot3(out.Position1.signals.values(:,1),out.Position1.signals.values(:,2),out.Position1.signals.values(:,3),'linewidth',traj_wid);
hold on;
UAV3=plot3(out.Position2.signals.values(:,1),out.Position2.signals.values(:,2),out.Position2.signals.values(:,3),'linewidth',traj_wid);
hold on;

posizioni_UAV1=out.Position.signals.values;
posizioni_UAV2=out.Position1.signals.values;
posizioni_UAV3=out.Position2.signals.values;
[p1,p2,p3,p11,p22,p33,p1_init,p2_init,p3_init]=take_pts(posizioni_UAV1,posizioni_UAV2,posizioni_UAV3,n,formation_initial_point);


pts1=[p1;p2];
pts2=[p2;p3];
pts3=[p3;p1];

pts11=[p11;p22];
pts22=[p22;p33];
pts33=[p33;p11];

%COLOR SETTINGS
cs = 'b' ;
cs1='m';
wid = 1.4 ;

linea_finale=line(pts11(:,1), pts11(:,2), pts11(:,3),'color',cs1,'linewidth',wid,'Marker','.','MarkerSize',30);
line(pts22(:,1), pts22(:,2), pts22(:,3),'color',cs1,'linewidth',wid,'Marker','.','MarkerSize',30);
line(pts33(:,1), pts33(:,2), pts33(:,3),'color',cs1,'linewidth',wid,'Marker','.','MarkerSize',30);



if plot_surface
    righe=ct;
    colonne=rt;
    matrice_punti_x=zeros(righe,colonne);
    matrice_punti_y=zeros(righe,colonne);
    vettore1=([1:10:righe*10]-1)';
    vettore2=([1:10:colonne*10]-1);
    matriceX=vettore1;
    matriceY=vettore2;
    
    for j=2:colonne
        matriceX=horzcat(matriceX,vettore1);
    end

    for i=2:righe
        matriceY=vertcat(matriceY,vettore2);
    end    
    
    imSeg=matriceNDVI_classi;
    plotNDVI_vegetationState(matrice_punti',imSeg',tensore,piano_tensore,colori); 
    grid on;
    hold on;
end

if wp_ok
    print_wps(centroidi2,tolleranzaXY)
end
hold on;


%UAV heading
print_heading_SINGLE(p1,p11,out.yaw.signals.values,n);
print_heading_SINGLE(p2,p22,out.yaw1.signals.values,n);
print_heading_SINGLE(p3,p33,out.yaw2.signals.values,n);
set(0,'DefaultFigurePaperPositionMode','auto');

