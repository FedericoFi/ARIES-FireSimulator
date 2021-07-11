function []=print_heading_SINGLE(p1,p11,y1,n)
yaw_final_1=y1(n,1);
spessore=0.2;
punta=1;
len=10;

%plot final heading
mArrow3([p11(1,1),p11(1,2),p11(1,3)],[p11(1,1)+len*cos(yaw_final_1),p11(1,2)+len*sin(yaw_final_1),p11(1,3)],'color','red','stemWidth',spessore,'facealpha',0.5,'tipWidth',punta);
hold on;



end