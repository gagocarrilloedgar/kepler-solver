%% Astrodynamics 2nd Assigment | The Kepler Equaiton
% Authors: Casanovas, Marc
%          Gago, Edgar
%          Ibañez, Carlos
% Date 15/10/2020
% Subject: Astrodynamics
%
%% NRSolver
% DESCRIPTION
% Solves E = M + e*sin(M) using the Newton-Rapson iterative method
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


function [E,i] = NRSolver(e,delta,M,max,opt)


i = 1;    %Variable to count the numer of iterations
t = 1;       % While initialization

E = zeros(1,max); %Size prealocation for the eccentricity anomaly for
%faster solution

E(i) = InitialCondition(M,opt,e); %Initialization

% Newton-Raphson iteration
while (abs(t) > delta)
    
    F = E(i) - e*sin(E(i)) - M; % function F(M) = E - e*sin(E) - M = 0
    dF = 1.0 - e*cos(E(i)); % derivative of F(M)
    
    if(abs(dF) < delta)
        break;
    else
        
        t = F/dF;
        E(i+1) = E(i) - t;
        i = i+1;
        
        if(i>max)
            fprintf('\n no convergence after 100 iterations for e = %f E0 = %f\n',e,M);
            E = E(1:end-1);
            break
        end
        
    end
    
end


end