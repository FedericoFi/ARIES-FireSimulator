clear all;

%LOAD fire simulation File
file_tensor=1;
additive_noise=0;
monitoring_critical_threshold=15; 

fire_simulation_file='SimulationRecord/fire_simulation_tensor';

load(fire_simulation_file);

%Quadcopter parameters
g = 9.81;  
Ix = 0.093;   
Iy = 0.092;
Iz = 0.0151;
m = 1.300;    
l = 0.275;    
d=4.406*10^-7;
b=1.1064*10^(-5);
param=[m;Ix;Iy;Iz;l;g];

%Quadcopters initial conditions
x0 = 10;
y0 = 10;
phi0 = 0;
theta0 = 0;
psi0 = pi/2;
vx0 = 0;
vy0 = 0;
vz0 = 0;
p0 = 0;
q0 = 0;
r0 = 0;
x02=10;
y02=50;
x03=10;
y03=30;

z0=-round(matrice_punti(x0+1,y0+1))-3;
z2=-round(matrice_punti(x02+1,y02+1))-3;
z3=-round(matrice_punti(x03+1,y03+1))-3;

initialCondition = [x0 vx0 y0 vy0 z0 vz0 phi0 p0 theta0 q0 psi0 r0];
initialCondition2 = [x02 vx0 y02 vy0 z2 vz0 phi0 p0 theta0 q0 psi0 r0];
initialCondition3 = [x03 vx0 y03 vy0 z3 vz0 phi0 p0 theta0 q0 psi0 r0];

init_psi=psi0;

%Waypoint tolerance
tolleranzaXY=2;
tolleranzaZ=2;


%FORMATION parameters
kp_formation=0.05;
kp_smoothing=0.1;

safety_region_control_gain=0.1;
safety_region_exp_scaler_beta=2;
safety_region=1;
collision_avoidance_activation_time=2;

quota_volo_iniziale=-200;

delta1=[0,5,10;
        0,5,0;
        0,0,0];
    
delta2=[-5,0,5;
        -5,0,-5;
        0,0,0];
    
delta3=[-10,-5,0;
        0,5,0;
        0,0,0];
    
integral_init1=[x0;y0;0];
integral_init2=[x02;y02;0];
integral_init3=[x03;y03;0];


%Control points setting
[centroidi2,row,col,numero_centroidi,numero_wp]=adj_cen(centroidi,matrice_punti);
[rt,ct,pt]=size(tensore);

%Fire record analysis parameters
time_burn_meter=20;
time_burn_cell = cell_lenght*time_burn_meter;
[matrice_classi_centroidi,elementi_classe] = assign2centroid(centroidi,ct,rt);
plotCentroid(centroidi,matrice_punti',matrice_classi_centroidi',0);
hold on;
disp("Parameters Initialization COMPLETE!");
