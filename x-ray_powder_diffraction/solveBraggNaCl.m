function [copperWavelengths] = solveBraggNaCl(braggAngles, braggAngleErrors, NaCl_Crystal_Angles)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

copperWavelengths = cell(2, 6);

NaCl_100_Angles = zeros(1, NaCl_Crystal_Angles(1)); %[Kb, Ka, Kb, Ka, Kb, Ka]
NaCl_110_Angles = zeros(1, NaCl_Crystal_Angles(2)); %[Kb, Ka, Kb, Ka]
NaCl_111_Angles = zeros(1, NaCl_Crystal_Angles(3)); %[Kb(1), Kb(2), Ka(2), Ka(3), Kb(4)]

NaCl_100_Angles_Err = zeros(1, NaCl_Crystal_Angles(1)); %[Kb, Ka, Kb, Ka, Kb, Ka]
NaCl_110_Angles_Err = zeros(1, NaCl_Crystal_Angles(2)); %[Kb, Ka, Kb, Ka]
NaCl_111_Angles_Err = zeros(1, NaCl_Crystal_Angles(3)); %[Kb(1), Kb(2), Ka(2), Ka(3), Kb(4)]

NaCl_d_vals = [282, 199.4, 325.6]*1e-12;

Ka_111 = zeros(1, 2);
Ka_110 = zeros(1, round(length(NaCl_110_Angles)/2));
Ka_100 = zeros(1, round(length(NaCl_100_Angles)/2));
Ka_111_Err = zeros(1, 2);
Ka_110_Err = zeros(1, round(length(NaCl_110_Angles_Err)/2));
Ka_100_Err = zeros(1, round(length(NaCl_100_Angles_Err)/2));

Kb_111 = zeros(1, 3);
Kb_110 = zeros(1, round(length(NaCl_110_Angles)/2));
Kb_100 = zeros(1, round(length(NaCl_100_Angles)/2));
Kb_111_Err = zeros(1, 3);
Kb_110_Err = zeros(1, round(length(NaCl_110_Angles_Err)/2));
Kb_100_Err = zeros(1, round(length(NaCl_100_Angles_Err)/2));

dummy1 = 1;
dummy2 = 1;
dummy3 = 1;
for i = 1:length(braggAngles)
    
    if (i <= NaCl_Crystal_Angles(1))
        
        NaCl_100_Angles(dummy1) = braggAngles(i);
        NaCl_100_Angles_Err(dummy1) = braggAngleErrors(i);
        dummy1 = dummy1 + 1;
        
    end
    
    if ((i > NaCl_Crystal_Angles(1)) && (i <= (NaCl_Crystal_Angles(1) + NaCl_Crystal_Angles(2))))
       
        NaCl_110_Angles(dummy2) = braggAngles(i);
        NaCl_110_Angles_Err(dummy2) = braggAngleErrors(i);
        dummy2 = dummy2 + 1;
        
    end
    
    if ((i > (NaCl_Crystal_Angles(1) + NaCl_Crystal_Angles(2))) && (i <= sum(NaCl_Crystal_Angles)))
       
        NaCl_111_Angles(dummy3) = braggAngles(i);
        NaCl_111_Angles_Err(dummy3) = braggAngleErrors(i);
        dummy3 = dummy3 + 1;
        
    end
    
end

%Separate crystal angles by specific K lines

NaCl_100_Angles_Ka = [NaCl_100_Angles(2), NaCl_100_Angles(4), NaCl_100_Angles(6)];
NaCl_100_Angles_Kb = [NaCl_100_Angles(1), NaCl_100_Angles(3), NaCl_100_Angles(5)];
NaCl_100_Angles_Ka_Err = [NaCl_100_Angles_Err(2), NaCl_100_Angles_Err(4), NaCl_100_Angles_Err(6)];
NaCl_100_Angles_Kb_Err = [NaCl_100_Angles_Err(1), NaCl_100_Angles_Err(3), NaCl_100_Angles_Err(5)];

NaCl_110_Angles_Ka = [NaCl_110_Angles(2), NaCl_110_Angles(4)];
NaCl_110_Angles_Kb = [NaCl_110_Angles(1), NaCl_110_Angles(3)];
NaCl_110_Angles_Ka_Err = [NaCl_110_Angles_Err(2), NaCl_110_Angles_Err(4)];
NaCl_110_Angles_Kb_Err = [NaCl_110_Angles_Err(1), NaCl_110_Angles_Err(3)];

NaCl_111_Angles_Ka = [NaCl_111_Angles(3), NaCl_111_Angles(4)];
NaCl_111_Angles_Kb = [NaCl_111_Angles(1), NaCl_111_Angles(2), NaCl_111_Angles(5)];
NaCl_111_Angles_Ka_Err = [NaCl_111_Angles_Err(3), NaCl_111_Angles_Err(4)];
NaCl_111_Angles_Kb_Err = [NaCl_111_Angles_Err(1), NaCl_111_Angles_Err(2), NaCl_111_Angles_Err(5)];


% ------- Calculate wavelengths for each measured angle ------ %

%100%
for n = 1:length(Ka_100)
   
    Ka_100(n) = (2*NaCl_d_vals(1)*sind(NaCl_100_Angles_Ka(n)))/n;
    Kb_100(n) = (2*NaCl_d_vals(1)*sind(NaCl_100_Angles_Kb(n)))/n;
    
    Ka_100_Err(n) = ((2*NaCl_d_vals(1)*cosd(NaCl_100_Angles_Ka(n)))/n)*NaCl_100_Angles_Ka_Err(n);
    Kb_100_Err(n) = ((2*NaCl_d_vals(1)*cosd(NaCl_100_Angles_Kb(n)))/n)*NaCl_100_Angles_Kb_Err(n);
    
end

%110%
for n = 1:length(Ka_110)
   
    Ka_110(n) = (2*NaCl_d_vals(2)*sind(NaCl_110_Angles_Ka(n)))/n;
    Kb_110(n) = (2*NaCl_d_vals(2)*sind(NaCl_110_Angles_Kb(n)))/n;
    
    Ka_110_Err(n) = ((2*NaCl_d_vals(2)*cosd(NaCl_110_Angles_Ka(n)))/n)*NaCl_110_Angles_Ka_Err(n);
    Kb_110_Err(n) = ((2*NaCl_d_vals(2)*cosd(NaCl_110_Angles_Kb(n)))/n)*NaCl_110_Angles_Kb_Err(n);
    
end

%111%
for n = 2:3
    
    Ka_111(n-1) = (2*NaCl_d_vals(3)*sind(NaCl_111_Angles_Ka(n-1)))/n;
    Ka_111_Err(n-1) = ((2*NaCl_d_vals(3)*cosd(NaCl_111_Angles_Ka(n-1)))/n)*NaCl_111_Angles_Ka_Err(n-1);
    
end

for n = 1:2
    
   Kb_111(n) = (2*NaCl_d_vals(3)*sind(NaCl_111_Angles_Kb(n)))/n;
   Kb_111_Err(n) = ((2*NaCl_d_vals(3)*cosd(NaCl_111_Angles_Kb(n)))/n)*NaCl_111_Angles_Kb_Err(n);
    
end

Kb_111(3) = (2*NaCl_d_vals(3)*sind(NaCl_111_Angles_Kb(3)))/4;
Kb_111_Err(3) = ((2*NaCl_d_vals(3)*cosd(NaCl_111_Angles_Kb(3)))/4)*NaCl_111_Angles_Kb_Err(3);

% ------ Compute Average Final Wavelength for Each Salt Sample ------ %

CuKa_100 = sum(Ka_100)/length(Ka_100);
CuKa_100_Err = sqrt(((1/3)^2)*(Ka_100_Err(1)^2) + ((1/3)^2)*(Ka_100_Err(2)^2) + ((1/3)^2)*(Ka_100_Err(3)^2));
CuKa_110 = sum(Ka_110)/length(Ka_110);
CuKa_110_Err = sqrt(((1/2)^2)*(Ka_110_Err(1)^2) + ((1/2)^2)*(Ka_110_Err(2)^2));
CuKa_111 = sum(Ka_111)/length(Ka_111);
CuKa_111_Err = sqrt(((1/2)^2)*(Ka_111_Err(1)^2) + ((1/2)^2)*(Ka_111_Err(2)^2));

CuKb_100 = sum(Kb_100)/length(Kb_100);
CuKb_100_Err = sqrt(((1/3)^2)*(Kb_100_Err(1)^2) + ((1/3)^2)*(Kb_100_Err(2)^2) + ((1/3)^2)*(Kb_100_Err(3)^2));
CuKb_110 = sum(Kb_110)/length(Kb_110);
CuKb_110_Err = sqrt(((1/2)^2)*(Kb_110_Err(1)^2) + ((1/2)^2)*(Kb_110_Err(2)^2));
CuKb_111 = sum(Kb_111)/length(Kb_111);
CuKb_111_Err = sqrt(((1/3)^2)*(Kb_111_Err(1)^2) + ((1/3)^2)*(Kb_111_Err(2)^2) + ((1/3)^2)*(Kb_111_Err(3)^2)); 

copperWavelengths{1, 1} = CuKa_100;
copperWavelengths{1, 2} = CuKa_110;
copperWavelengths{1, 3} = CuKa_111;
copperWavelengths{1, 4} = CuKb_100;
copperWavelengths{1, 5} = CuKb_110;
copperWavelengths{1, 6} = CuKb_111;
copperWavelengths{2, 1} = CuKa_100_Err;
copperWavelengths{2, 2} = CuKa_110_Err;
copperWavelengths{2, 3} = CuKa_111_Err;
copperWavelengths{2, 4} = CuKb_100_Err;
copperWavelengths{2, 5} = CuKb_110_Err;
copperWavelengths{2, 6} = CuKb_111_Err;

disp("end of braggOnly");