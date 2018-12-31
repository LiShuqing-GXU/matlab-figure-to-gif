clear;
%% read data
[a,b,c]=textread('data.txt','%f%f%f');
figure();
scatter3(a,b,c,'.'); 

%% rotate figure and save as gif
% el is elevation
% n is division of azimuth
el=20;
% k=0;
 n=2;
 for i=1:360/n
drawnow
view([-37.5+(i-1)*n,el]);
xlabel('X', 'Fontsize',13,'Rotation',30-(i-1)*n,'FontAngle','italic')
ylabel('Y', 'Fontsize',13,'Rotation',-30-(i-1)*n,'FontAngle','italic')
zlabel('Z', 'Fontsize',13)
pause(0.1)
M=getframe(gcf);
nn=frame2im(M);
[nn,cm]=rgb2ind(nn,256);
 if i==1
imwrite(nn,cm,'rotation.gif','gif','LoopCount',inf,'DelayTime',0.2);% LoopCount only works when i=1
else
imwrite(nn,cm,'rotation.gif','gif','WriteMode','append','DelayTime',0.2)% 
 end
 end
