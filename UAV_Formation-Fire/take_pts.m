
function [p1,p2,p3,p11,p22,p33,p1_init,p2_init,p3_init]=take_pts(pos1,pos2,pos3,n,point)
p1=[pos1(point,1),pos1(point,2),pos1(point,3)];
p2=[pos2(point,1),pos2(point,2),pos2(point,3)];
p3=[pos3(point,1),pos3(point,2),pos3(point,3)];

p11=[pos1(n,1),pos1(n,2),pos1(n,3)];
p22=[pos2(n,1),pos2(n,2),pos2(n,3)];
p33=[pos3(n,1),pos3(n,2),pos3(n,3)];

p1_init=[pos1(1,1),pos1(1,2),pos1(1,3)];
p2_init=[pos2(1,1),pos2(1,2),pos2(1,3)];
p3_init=[pos3(1,1),pos3(1,2),pos3(1,3)];

