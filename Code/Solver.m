%% Astrodynamics 2nd Assigment | The Kepler Equaiton
% Authors: Casanovas, Marc
%          Gago, Edgar
%          Ibañez, Carlos
% Date 15/10/2020
% Subject: Astrodynamics
%
%% Core of the program
% DESCRIPTION
% Evaluates all the problem use cases
%
% Thre loops:
%     k --> evaluates the different initial conditions
%     i --> evaluates trough the dsitribution of the defined eccentricity
%     j --> evaluated trough the distribution of the mean anomaly
%

for k = 1:3
    opt = k;
    for i=1:numel(e_vect)
        e = e_vect(i);
        
        for j=1:numel(M.iter)
            
            M_ = M.iter(j);
            
            %% Euler method
            % Solver
            [E.eul(i,:,j,k),it.eul(i,j,k)] = EulerSolver(e,delta,M_,maxIter,opt);
            
            %Cleaning the data
            [~,~,e_last] = find( E.eul(i,:,j,k), 1, 'last');
            if (e_last ~=0)
                E.eulf(i,j,i) = e_last;
            end
            
            %% Newton-Rapson method
            %Solver
            [E.nr(i,:,j,k),it.nr(i,j,k)] = NRSolver(e,delta,M_,maxIter,opt);
            
            %Cleaning the data
            [~,~,e_last] = find( E.nr(i,:,j,k), 1, 'last');
            if (e_last ~=0)
                E.nrf(i,j,i) = e_last;
            end
            
        end
        
        M.eul(:,:,k) = E.eulf(:,:,k) - e_vect.*sin(E.eulf(:,:,k));
        M.nr(:,:,k) = E.nrf(:,:,k) - e_vect.*sin(E.nrf(:,:,k));
    end
end

