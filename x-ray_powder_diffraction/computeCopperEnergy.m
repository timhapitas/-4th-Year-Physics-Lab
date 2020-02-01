function [copperEnergies] = computeCopperEnergy(copperWavelengths)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

copperEnergies = cell(size(copperWavelengths));
h = 6.62607004e-34; %m^2 * kg/s%
c = 299792458; %m/s%

for i = 1:min(size(copperEnergies))
    
    if i == 1
    
        for j = 1:max(size(copperEnergies))

            copperEnergies{i, j} = (h*c/copperWavelengths{1, j})/(1.602e-19);

        end
        
    else
       
        for j = 1:max(size(copperEnergies))
           
            copperEnergies{i, j} = (h*c/(copperWavelengths{1, j}^2))*copperWavelengths{i, j}/(1.602e-19);
            
        end
        
    end

end


