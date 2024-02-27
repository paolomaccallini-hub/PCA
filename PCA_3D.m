% file name = PCA_3D
%
close all
clear all
pkg load statistics
%
% Set means, standard deviations, and correlations
%
mu=[1.5;1.7;1]; % means
sigma=[2.2,3.5,3.2]; % standard deviations
rho=[0,0.45,0.8;0,0,0.3;0,0,0]; % correlation
rho(2,1)=rho(1,2);
rho(3,1)=rho(1,3);
rho(3,2)=rho(2,3);
%
n=300 % number of values generated
[vectorX,C] = NrandomGen(mu,sigma,rho,n);
%
% Calculate eigenvalues and eigenvectors of the covariance matrix
%
[P,lambda]=eig(C); % lambda is the diagonal matrix of C such that P*lambda*transpose(P)=C
%
% Plot data and principal axes with respect to original axes
%
Plot_X(vectorX,P,lambda,mu)
%
% Plot data with respect to principal planes
%
Plot_Y(vectorX,P,lambda,mu)
