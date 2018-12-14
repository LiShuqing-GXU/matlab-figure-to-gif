clear;
% fid=fopen('data.txt');
[a,b,c]=textread('data.txt','%f%f%f');
% [a1,b1,c1]=textread('data1.txt','%f%f%f');
figure();
scatter3(a,b,c,'.'); 
% figure();
% scatter3(a1,b1,c1,'.'); 
el=20;
 k=0;
 n=2;
 for i=1:360/n
drawnow
view([-37.5+(i-1)*n,el]);
xlabel('Longitude', 'Fontsize',13,'Rotation',30-(i-1)*n,'FontAngle','italic')
ylabel('Latitude', 'Fontsize',13,'Rotation',-30-(i-1)*n,'FontAngle','italic')
zlabel('Moho Depth ', 'Fontsize',13)
pause(0.1)
M=getframe(gcf);
nn=frame2im(M);
[nn,cm]=rgb2ind(nn,256);
 if i==1
imwrite(nn,cm,'saudimoho.gif','gif','LoopCount',inf,'DelayTime',0.2);% LoopCount only works when i=1
else
imwrite(nn,cm,'saudimoho.gif','gif','WriteMode','append','DelayTime',0.2)% 
 end
 end
