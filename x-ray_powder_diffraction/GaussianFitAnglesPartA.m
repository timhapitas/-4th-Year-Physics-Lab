nameVector = ["100", "110", "111"];
NaClrawData = cell(1, length(nameVector));

global gaussianSigma;
global errorOnAngles;
global angles;

global NaCl_100_Peak_1_Error;
global NaCl_100_Peak_2_Error;
global NaCl_100_Peak_3_Error;
global NaCl_100_Peak_4_Error;
global NaCl_100_Peak_5_Error;
global NaCl_100_Peak_6_Error;
global NaCl_100_Peak_1_Angle;
global NaCl_100_Peak_2_Angle;
global NaCl_100_Peak_3_Angle;
global NaCl_100_Peak_4_Angle;
global NaCl_100_Peak_5_Angle;
global NaCl_100_Peak_6_Angle;

global NaCl_110_Peak_1_Error;
global NaCl_110_Peak_2_Error;
global NaCl_110_Peak_3_Error;
global NaCl_110_Peak_4_Error;
global NaCl_110_Peak_1_Angle;
global NaCl_110_Peak_2_Angle;
global NaCl_110_Peak_3_Angle;
global NaCl_110_Peak_4_Angle;

global NaCl_111_Peak_1_Error;
global NaCl_111_Peak_2_Error;
global NaCl_111_Peak_3_Error;
global NaCl_111_Peak_4_Error;
global NaCl_111_Peak_5_Error;
global NaCl_111_Peak_1_Angle;
global NaCl_111_Peak_2_Angle;
global NaCl_111_Peak_3_Angle;
global NaCl_111_Peak_4_Angle;
global NaCl_111_Peak_5_Angle;

NaCl_100_Angles_Data = [];
NaCl_100_Intensities_Data = [];
NaCl_110_Angles_Data = [];
NaCl_110_Intensities_Data = [];
NaCl_111_Angles_Data = [];
NaCl_111_Intensities_Data = [];

%Processes, fits, and extracts angular data for each NaCl crystal%

for i = 1:length(nameVector)
    
    fileName = strcat("NaCl - ", nameVector(i), ".txt");
    
    NaClrawData{1, i} = importdata(fileName);
    NaCl_Angles = NaClrawData{1, i}.data(:,1);
    NaCl_Intensities = NaClrawData{1, i}.data(:,2);

    cutoffIndex = find(NaCl_Angles == 10.0);
    NaCl_Angles(NaCl_Angles <= 10.0) = [];
    NaCl_Intensities(1:cutoffIndex) = [];
    
    figure;
    plot(NaCl_Angles, NaCl_Intensities, 'r');
    grid on;
    xlabel('Difraction Angle (Degrees)');
    ylabel('Intensity (Imp/s)');
    
    if nameVector(i) == "100"
        NaCl_100_Angles_Data = NaCl_Angles;
        NaCl_100_Intensities_Data = NaCl_Intensities;
        
        [NaCl_100_Peak_1_fitresult, NaCl_100_Peak_1_gof] = NaCl_100_Peak_1_Fit(NaCl_100_Angles_Data, NaCl_100_Intensities_Data);
        [NaCl_100_Peak_2_fitresult, NaCl_100_Peak_2_gof] = NaCl_100_Peak_2_Fit(NaCl_100_Angles_Data, NaCl_100_Intensities_Data);
        [NaCl_100_Peak_3_fitresult, NaCl_100_Peak_3_gof] = NaCl_100_Peak_3_Fit(NaCl_100_Angles_Data, NaCl_100_Intensities_Data);
        [NaCl_100_Peak_4_fitresult, NaCl_100_Peak_4_gof] = NaCl_100_Peak_4_Fit(NaCl_100_Angles_Data, NaCl_100_Intensities_Data);
        [NaCl_100_Peak_5_fitresult, NaCl_100_Peak_5_gof] = NaCl_100_Peak_5_Fit(NaCl_100_Angles_Data, NaCl_100_Intensities_Data);
        [NaCl_100_Peak_6_fitresult, NaCl_100_Peak_6_gof] = NaCl_100_Peak_6_Fit(NaCl_100_Angles_Data, NaCl_100_Intensities_Data);
        
        NaCl_100_Peak_1_coeffs = coeffvalues(NaCl_100_Peak_1_fitresult);
        NaCl_100_Peak_2_coeffs = coeffvalues(NaCl_100_Peak_2_fitresult);
        NaCl_100_Peak_3_coeffs = coeffvalues(NaCl_100_Peak_3_fitresult);
        NaCl_100_Peak_4_coeffs = coeffvalues(NaCl_100_Peak_4_fitresult);
        NaCl_100_Peak_5_coeffs = coeffvalues(NaCl_100_Peak_5_fitresult);
        NaCl_100_Peak_6_coeffs = coeffvalues(NaCl_100_Peak_6_fitresult);
        
        NaCl_100_Peak_1_Error = NaCl_100_Peak_1_coeffs(3)/sqrt(2);
        NaCl_100_Peak_2_Error = NaCl_100_Peak_2_coeffs(3)/sqrt(2);
        NaCl_100_Peak_3_Error = NaCl_100_Peak_3_coeffs(3)/sqrt(2);
        NaCl_100_Peak_4_Error = NaCl_100_Peak_4_coeffs(3)/sqrt(2);
        NaCl_100_Peak_5_Error = NaCl_100_Peak_5_coeffs(3)/sqrt(2);
        NaCl_100_Peak_6_Error = NaCl_100_Peak_6_coeffs(3)/sqrt(2);
        
        NaCl_100_Peak_1_Angle = NaCl_100_Peak_1_coeffs(2);
        NaCl_100_Peak_2_Angle = NaCl_100_Peak_2_coeffs(2);
        NaCl_100_Peak_3_Angle = NaCl_100_Peak_3_coeffs(2);
        NaCl_100_Peak_4_Angle = NaCl_100_Peak_4_coeffs(2);
        NaCl_100_Peak_5_Angle = NaCl_100_Peak_5_coeffs(2);
        NaCl_100_Peak_6_Angle = NaCl_100_Peak_6_coeffs(2);
           
    elseif nameVector(i) == "110"
        NaCl_110_Angles_Data = NaCl_Angles;
        NaCl_110_Intensities_Data = NaCl_Intensities;
        
        [NaCl_110_Peak_1_fitresult, NaCl_110_Peak_1_gof] = NaCl_110_Peak_1_Fit(NaCl_110_Angles_Data, NaCl_110_Intensities_Data);
        [NaCl_110_Peak_2_fitresult, NaCl_110_Peak_2_gof] = NaCl_110_Peak_2_Fit(NaCl_110_Angles_Data, NaCl_110_Intensities_Data);
        [NaCl_110_Peak_3_fitresult, NaCl_110_Peak_3_gof] = NaCl_110_Peak_3_Fit(NaCl_110_Angles_Data, NaCl_110_Intensities_Data);
        [NaCl_110_Peak_4_fitresult, NaCl_110_Peak_4_gof] = NaCl_110_Peak_4_Fit(NaCl_110_Angles_Data, NaCl_110_Intensities_Data);
        
        NaCl_110_Peak_1_coeffs = coeffvalues(NaCl_110_Peak_1_fitresult);
        NaCl_110_Peak_2_coeffs = coeffvalues(NaCl_110_Peak_2_fitresult);
        NaCl_110_Peak_3_coeffs = coeffvalues(NaCl_110_Peak_3_fitresult);
        NaCl_110_Peak_4_coeffs = coeffvalues(NaCl_110_Peak_4_fitresult);
    
        NaCl_110_Peak_1_Error = NaCl_110_Peak_1_coeffs(3)/sqrt(2);
        NaCl_110_Peak_2_Error = NaCl_110_Peak_2_coeffs(3)/sqrt(2);
        NaCl_110_Peak_3_Error = NaCl_110_Peak_3_coeffs(3)/sqrt(2);
        NaCl_110_Peak_4_Error = NaCl_110_Peak_4_coeffs(3)/sqrt(2);
        
        NaCl_110_Peak_1_Angle = NaCl_110_Peak_1_coeffs(2);
        NaCl_110_Peak_2_Angle = NaCl_110_Peak_2_coeffs(2);
        NaCl_110_Peak_3_Angle = NaCl_110_Peak_3_coeffs(2);
        NaCl_110_Peak_4_Angle = NaCl_110_Peak_4_coeffs(2);
        
    elseif nameVector(i) == "111"
        NaCl_111_Angles_Data = NaCl_Angles;
        NaCl_111_Intensities_Data = NaCl_Intensities;
        
        [NaCl_111_Peak_1_fitresult, NaCl_111_Peak_1_gof] = NaCl_111_Peak_1_Fit(NaCl_111_Angles_Data, NaCl_111_Intensities_Data);
        [NaCl_111_Peak_2_fitresult, NaCl_111_Peak_2_gof] = NaCl_111_Peak_2_Fit(NaCl_111_Angles_Data, NaCl_111_Intensities_Data);
        [NaCl_111_Peak_3_fitresult, NaCl_111_Peak_3_gof] = NaCl_111_Peak_3_Fit(NaCl_111_Angles_Data, NaCl_111_Intensities_Data);
        [NaCl_111_Peak_4_fitresult, NaCl_111_Peak_4_gof] = NaCl_111_Peak_4_Fit(NaCl_111_Angles_Data, NaCl_111_Intensities_Data);
        [NaCl_111_Peak_5_fitresult, NaCl_111_Peak_5_gof] = NaCl_111_Peak_5_Fit(NaCl_111_Angles_Data, NaCl_111_Intensities_Data);
        
        NaCl_111_Peak_1_coeffs = coeffvalues(NaCl_111_Peak_1_fitresult);
        NaCl_111_Peak_2_coeffs = coeffvalues(NaCl_111_Peak_2_fitresult);
        NaCl_111_Peak_3_coeffs = coeffvalues(NaCl_111_Peak_3_fitresult);
        NaCl_111_Peak_4_coeffs = coeffvalues(NaCl_111_Peak_4_fitresult);
        NaCl_111_Peak_5_coeffs = coeffvalues(NaCl_111_Peak_5_fitresult);
        
        NaCl_111_Peak_1_Error = NaCl_111_Peak_1_coeffs(3)/sqrt(2);
        NaCl_111_Peak_2_Error = NaCl_111_Peak_2_coeffs(3)/sqrt(2);
        NaCl_111_Peak_3_Error = NaCl_111_Peak_3_coeffs(3)/sqrt(2);
        NaCl_111_Peak_4_Error = NaCl_111_Peak_4_coeffs(3)/sqrt(2);
        NaCl_111_Peak_5_Error = NaCl_111_Peak_5_coeffs(3)/sqrt(2);
        
        NaCl_111_Peak_1_Angle = NaCl_111_Peak_1_coeffs(2);
        NaCl_111_Peak_2_Angle = NaCl_111_Peak_2_coeffs(2);
        NaCl_111_Peak_3_Angle = NaCl_111_Peak_3_coeffs(2);
        NaCl_111_Peak_4_Angle = NaCl_111_Peak_4_coeffs(2);
        NaCl_111_Peak_5_Angle = NaCl_111_Peak_5_coeffs(2);
       
    else
        continue;
    end
    
end

%Return all angles and associated errors in global vectors%
getAngleAndErrors;

braggAngles = angles;
braggAngleErrors = errorOnAngles;

%solves the bragg equation for the characteristic x-ray wavelengths of copper, for all NaCl crystals%
copperWavelengths = solveBraggNaCl(braggAngles, braggAngleErrors, [6, 4, 5]);

