% file name = NrandomGen
% date of creation = 24/02/2024
%
%-------------------------------------------------------------------------------
% Generate a normal random vector with N components and n elements
%-------------------------------------------------------------------------------
%
function [random_vector,C] = NrandomGen(mu,sigma,rho,n)
%
N=length(mu);
for i=1:N
  C(i,i)=sigma(i)^2;
endfor
%
for i=1:N
  for j=(i+1):N
    C(i,j)=sigma(i)*sigma(j)*rho(i,j);
  endfor
endfor
%
for i=1:N
  for j=1:(i-1)
    C(i,j)=sigma(i)*sigma(j)*rho(i,j);
  endfor
endfor
%
random_vector = mvnrnd(mu,C,n)';
%
endfunction
