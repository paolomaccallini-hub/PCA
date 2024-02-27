% file name = tilted_ellipsoid
% date of creation = 24/02/2024
%
%-------------------------------------------------------------------------------
% Plot the central ellipsoid
%-------------------------------------------------------------------------------
%
function tilted_ellipsoid(lambda,P,mu)
%
theta = linspace(0,2*pi,50); % polar coordinate
phi = linspace(0,pi,50); % polar coordinate
[theta,phi] = meshgrid(theta,phi);
A_ell = sqrt(lambda(1,1))*sin(phi).*cos(theta);
B_ell = sqrt(lambda(2,2))*sin(phi).*sin(theta);
C_ell = sqrt(lambda(3,3))*cos(phi);
ellipsoid = P*[A_ell(:)';B_ell(:)';C_ell(:)'];
X_ell = reshape(ellipsoid(1,:),size(A_ell));
Y_ell = reshape(ellipsoid(2,:),size(B_ell));
Z_ell = reshape(ellipsoid(3,:),size(C_ell));
X_ell = mu(1) + X_ell;
Y_ell = mu(2) + Y_ell;
Z_ell = mu(3) + Z_ell;
surf(X_ell,Y_ell,Z_ell)
%
endfunction
