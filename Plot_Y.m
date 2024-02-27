% file name = Plot_Y
% date of creation = 26/02/2024
%
%-------------------------------------------------------------------------------
% Plot data with respect to principal planes
%-------------------------------------------------------------------------------
%
function Plot_Y(vectorX,P,lambda,mu)
%
% Coordinates Y of the data
%
for i=1:length(vectorX(1,:))
  vectorY(:,i)=P'*(vectorX(:,i)-mu);
endfor
%
% Components Y of the original axes
%
e1=P'*[1,0,0]';
e2=P'*[0,1,0]';
e3=P'*[0,0,1]';
%
% Plot projections on the three principal axes
%
proj=[1,2;1,3;2,3];
for i=1:3
  h=proj(i,1);
  k=proj(i,2);
  subplot(2,2,i+1)
  plot(vectorY(h,:),vectorY(k,:),'o','markersize',3,'markerfacecolor','b',
  'markeredgecolor','k'); #plot the data
  hold on
  ellipse(lambda,P,mu,h,k) % plot the ellipse
  hold on
  tot_var=(sqrt(lambda(h,h))+sqrt(lambda(k,k)))/(sqrt(lambda(1,1))+sqrt(lambda(2,2))+sqrt(lambda(3,3)));
  title(strcat("variance/total variance =",num2str(tot_var)),'fontsize',15);
  str=num2str(h);
  xlabel(str,'fontsize',15);
  str=num2str(k);
  ylabel(str,'fontsize',15);
  %
  % plot the projection of the original axes
  %
  maxL=2*sqrt(max(lambda(h,h),lambda(k,k)));
  plot3([-mu(h),-mu(h)+e1(h)*maxL],[-mu(k),-mu(k)+e1(k)*maxL],"-r","linewidth",2)
  text(-mu(h)+e1(h)*maxL*1.1,-mu(k)+e1(k)*maxL*1.1,"X_{1}",'fontsize',15,"fontweight","bold","color","r")
  plot3([-mu(h),-mu(h)+e2(h)*maxL],[-mu(k),-mu(k)+e2(k)*maxL],"-r","linewidth",2)
  text(-mu(h)+e2(h)*maxL*1.1,-mu(k)+e2(k)*maxL*1.1,"X_{2}",'fontsize',15,"fontweight","bold","color","r")
  plot3([-mu(h),-mu(h)+e3(h)*maxL],[-mu(k),-mu(k)+e3(k)*maxL],"-r","linewidth",2)
  text(-mu(h)+e3(h)*maxL*1.1,-mu(k)+e3(k)*maxL*1.1,"X_{3}",'fontsize',15,"fontweight","bold","color","r")
  axis("equal")
endfor
endfunction
