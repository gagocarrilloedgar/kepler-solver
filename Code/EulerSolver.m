%% Astrodynamics 2nd Assigment | The Kepler Equaiton
% Authors: Casanovas, Marc
%          Gago, Edgar
%          Ibañez, Carlos
% Date 15/10/2020
% Subject: Astrodynamics
%
%% EulerSolver
% DESCRIPTION
% Solves E = M + e*sin(M) using the Euler iterative method
% INPUT:
%   e  = orbit's eccentricity
%   delta = maximum admisible error
%   M = Mean anomaly distribution
%   max = maximum number of iterations 
%   opt = controls de initial condition type [1 2 3]
%
% OUTPUT:
%   
%   i: Last iteration, recorder in order to evalutate the convergence
%   E []: Ecc anomaly, vector with the size of [1,max] 
%

function [E,i] = EulerSolver(e,delta,M,max,opt)

i = 1;    %Variable to count the numer of iterations
t = 1;       % While initialization

E = zeros(1,max); %Size prealocation for faster solution

E0 =  InitialCondition(M,opt,e);

while(t)
    
    E(i) =  M + e*sin(E0);
    if ( abs(E(i) - E0) < delta)
        t = 0;
    end
    
    E0 = E(i);
    i = i+1;
    
    if(i>max)
        fprintf('\n no convergence after 100 iterations for e = %f E0 = %f\n',e,E0);
        break
    end
end

% Post process
i = i-1;

end