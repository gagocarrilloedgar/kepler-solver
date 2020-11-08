
%% Astrodynamics 2nd Assigment | The Kepler Equaiton
% Authors: Casanovas, Marc
%          Gago, Edgar
%          Ibañez, Carlos
% Date 15/10/2020
% Subject: Astrodynamics
%
%% EulerSolver
% DESCRIPTION
% Definition of the 3 three different ways evaluted that starts the 
% iterative process
%
% INPUT:
%   e  = orbit's eccentricity
%   M = Mean anomaly distribution
%   opt = controls de initial condition type
%
% OUTPUT:
%   
%   E0: value of the Ecc. An. using the selected initial condition
%

function E0 = InitialCondition(M,opt,e)

% Definition of the diferent initial condition in order to start the 
% Iteration process

switch opt
    
    case 1
        E0 = M;
        
    case 2
        E0 = pi;
        
    case 3
        E0 = M + e*cos(M);   
end


end