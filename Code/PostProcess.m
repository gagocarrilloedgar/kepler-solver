
%% Astrodynamics 2nd Assigment | The Kepler Equaiton
% Authors: Casanovas, Marc
%          Gago, Edgar
%          Ibañez, Carlos
% Date 15/10/2020
% Subject: Astrodynamics

%% PostProcess
% DESCRIPTION
% 
% Generates the project's plots
%

for i=1:3
    plotColorMap(it.eul(:,:,i));
    plotColorMap(it.nr(:,:,i));
end


function plotColorMap(M)
figure;
heatmap(M');
grid off;
colormap(jet);
end


