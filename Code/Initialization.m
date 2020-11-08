%% Astrodynamics 2nd Assigment | The Kepler Equaiton
% Authors: Casanovas, Marc
%          Gago, Edgar
%          Ibañez, Carlos
% Date 15/10/2020
% Subject: Astrodynamics

%% Initialization
% DESCRIPTION
% 
% Pre allocates de structues M, E & it to improve the codes performance
% and generates the vector e using a uniform distribution
%
% INPUT:
%
%   N = Number of the distribution nodes
%   max = maximum number of iterations 
%
% OUTPUT:
%   e  = orbit's eccentricity distribution
%   E: Last iteration, recorder in order to evalutate the convergence
%   M []: Ecc anomaly, vector with the size of [1,max] 
%   it: Struct
%       .nr [N,M_,K]: number of iterations for the Newton-Rapson Algorithm
%       .eul[N,N_,K]: number of iterations for the Eeulor Algorithm
%   E: Struct
%       .nrf [N,M_,K]:Records the solution of the 
%                     Ecc An. for the Newton-Rapson Algorithm
%       .eulf[N,M_,K]:Records the solution of the 
%                     Ecc An. for the Euler Algorithm
%       .nr [N,max,M_,K]: Records the iteration process of the 
%                     Ecc An. for the Newton-Rapson Algorithm
%       .eul[N,max,M_,K]: Records the iteration process of the 
%                     Ecc An. for the Euler Algorithm
%   M: Struct
%       .nr [N,M_,K]: Records the solution of the 
%                     Mean An. for the Newton-Rapson Algorithm
%       .eul[N,M_,K]: Records the solution of the 
%                     Mean An. for the Euler Algorithm
%       .init[N,M_,K]: Mean An. distribution 
%

function [e,E,it,M] = Initialization(N,max)

e = linspace(0.8,1,N); % Orbit's eccentricity
E0 = linspace(260,360,N); % Initial conditions

% pass from Degrees to Rad in order to be abel to operate with the 
% Kepler's equations
E0 = deg2rad(E0);

M_ = numel(E0);
K = 3; % Number of initial conditions

% Space allocation: improved code performace
E_ = zeros(N,max,M_,K); 
it_ = zeros(N,M_,K); 
E_fin = zeros(N,M_,K); 


% Struct allocation for a cleaner code
E = struct("nr",E_,"eul",E_,"eulf",E_fin,"nrf",E_fin);
it = struct("nr",it_,"eul",it_);
M = struct("iter",E0,"nr",E_fin,"eul",E_fin);


end