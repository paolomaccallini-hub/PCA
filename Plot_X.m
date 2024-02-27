% file name = Plot_X
% date of creation = 26/02/2024
%
%-------------------------------------------------------------------------------
% Plot 3D data and principal axes with respect to original axes
%-------------------------------------------------------------------------------
%
function Plot_X(vectorX,P,lambda,mu,f)
subplot(2,2,1)
tilted_ellipsoid(lambda,P,mu) # plot the ellipsoid
hold on
plot3(vectorX(1,:),vectorX(2,:),vectorX(3,:),'o','markersize',3,
'markerfacecolor','b','markeredgecolor','k'); #plot the data
title('Normal Random Vector with 3 dimensions','fontsize',15);
xlabel('X_{1}','fontsize',15);
ylabel('X_{2}','fontsize',15);
zlabel('X_{3}','fontsize',15);
maxL=sqrt(max(max(lambda)));
%
% plot the Y1,Y2,Y3 axes (principal components)
%
V(1)=P(1,1)*2.5*maxL;
V(2)=P(2,1)*2.5*maxL;
V(3)=P(3,1)*2.5*maxL;
plot3([mu(1),(mu(1)+V(1))],[mu(2),(mu(2)+V(2))],[mu(3),(mu(3)+V(3))],"-k","linewidth",2)
plot3([mu(1),(mu(1)-V(1))],[mu(2),(mu(2)-V(2))],[mu(3),(mu(3)-V(3))],"-k","linewidth",2)
%
W(1)=P(1,2)*2.5*maxL;
W(2)=P(2,2)*2.5*maxL;
W(3)=P(3,2)*2.5*maxL;
plot3([mu(1),(mu(1)+W(1))],[mu(2),(mu(2)+W(2))],[mu(3),(mu(3)+W(3))],"-k","linewidth",2)
plot3([mu(1),(mu(1)-W(1))],[mu(2),(mu(2)-W(2))],[mu(3),(mu(3)-W(3))],"-k","linewidth",2)
%
VV(1)=P(1,3)*2.5*maxL;
VV(2)=P(2,3)*2.5*maxL;
VV(3)=P(3,3)*2.5*maxL;
plot3([mu(1),(mu(1)+VV(1))],[mu(2),(mu(2)+VV(2))],[mu(3),(mu(3)+VV(3))],"-k","linewidth",2)
plot3([mu(1),(mu(1)-VV(1))],[mu(2),(mu(2)-VV(2))],[mu(3),(mu(3)-VV(3))],"-k","linewidth",2)
%
text((mu(1)+V(1))*1.1,(mu(2)+V(2))*1.1,(mu(3)+V(3))*1.1,"Y_{1}",'fontsize',15,
"fontweight","bold","color","k")
text((mu(1)+W(1))*1.1,(mu(2)+W(2))*1.1,(mu(3)+W(3))*1.1,"Y_{2}",'fontsize',15,
"fontweight","bold","color","k")
text((mu(1)+VV(1))*1.1,(mu(2)+VV(2))*1.1,(mu(3)+VV(3))*1.1,"Y_{3}",'fontsize',15,
"fontweight","bold","color","k")
%
% plot the X1,X2,X3 axes (original axes)
%
plot3([-2.5*maxL,2.5*maxL],[0,0],[0,0],"-r","linewidth",2)
plot3([0,0],[-2.5*maxL,2.5*maxL],[0,0],"-r","linewidth",2)
plot3([0,0],[0,0],[-2.5*maxL,2.5*maxL],"-r","linewidth",2)
%
text(2.5*maxL*1.1,0,0,"X_{1}",'fontsize',15,"fontweight","bold","color","r")
text(0,2.5*maxL*1.1,0,"X_{2}",'fontsize',15,"fontweight","bold","color","r")
text(0,0,2.5*maxL*1.1,"X_{3}",'fontsize',15,"fontweight","bold","color","r")
%
% define the limits of the window
%
minimoX=min([(mu(1)+V(1)),(mu(1)-V(1)),(mu(1)+W(1)),(mu(1)-W(1)),vectorX(1,:)]);
minimoX=minimoX-abs(minimoX/3);
massimoX=max([(mu(1)+V(1)),(mu(1)-V(1)),(mu(1)+W(1)),(mu(1)-W(1)),vectorX(1,:)]);
massimoX=massimoX+abs(massimoX/3);
%
minimoY=min([(mu(2)+V(2)),(mu(2)-V(2)),(mu(2)+W(2)),(mu(2)-W(2)),vectorX(2,:)]);
minimoY=minimoY-abs(minimoY/3);
massimoY=max([(mu(2)+V(2)),(mu(2)-V(2)),(mu(2)+W(2)),(mu(2)-W(2)),vectorX(2,:)]);
massimoY=massimoY+abs(massimoY/3);
%
minimoZ=min([(mu(3)+VV(3)),(mu(3)-VV(3)),vectorX(3,:)]);
minimoZ=minimoZ-abs(minimoZ/3);
massimoZ=max([(mu(3)+VV(3)),(mu(3)-VV(3)),vectorX(3,:)]);
massimoZ=massimoZ+abs(massimoZ/3);
%
axis([minimoX,massimoX,minimoY,massimoY,minimoZ,massimoZ],"equal")
endfunction
