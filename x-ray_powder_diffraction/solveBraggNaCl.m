function [copperWavelengths] = solveBraggNaCl(braggAngles, braggAngleErrors, NaCl_Crystal_Angles)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

NaCl_100_Angles = zeros(1, NaCl_Crystal_Angles(1));
NaCl_110_Angles = zeros(1, NaCl_Crystal_Angles(2));
NaCl_111_Angles = zeros(1, NaCl_Crystal_Angles(3));

NaCl_d_vals = [282, 199.4, 325.6]*1e-12;

Ka_111 = zeros(1, round(length(NaCl_111_Angles)/2));
Ka_110 = zeros(1, round(length(NaCl_110_Angles)/2));
Ka_100 = zeros(2, round(length(NaCl_100_Angles)/2));

dummy1 = 1;
dummy2 = 1;
dummy3 = 1;
for i = 1:length(braggAngles)
    
    if (i <= NaCl_Crystal_Angles(1))
        
        NaCl_100_Angles(dummy1) = braggAngles(i);
        dummy1 = dummy1 + 1;
        
    end
    
    if ((i > NaCl_Crystal_Angles(1)) && (i <= (NaCl_Crystal_Angles(1) + NaCl_Crystal_Angles(2))))
       
        NaCl_110_Angles(dummy2) = braggAngles(i);
        dummy2 = dummy2 + 1;
        
    end
    
    if ((i > (NaCl_Crystal_Angles(1) + NaCl_Crystal_Angles(2))) && (i <= sum(NaCl_Crystal_Angles)))
       
        NaCl_111_Angles(dummy3) = braggAngles(i);
        dummy3 = dummy3 + 1;
        
    end
    
end

%100%

for n = 1:length(round(length(NaCl_100_Angles)/2))
   
    
    
end
disp("end of braggOnly");