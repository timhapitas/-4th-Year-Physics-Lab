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

gaussianSigma = zeros(1, 15);
errorOnAngles = zeros(1,15);
angles = zeros(1, 15);

measurementRes = 0.1; %degrees%

gaussianSigma(1) = NaCl_100_Peak_1_Error;
gaussianSigma(2) = NaCl_100_Peak_2_Error;
gaussianSigma(3) = NaCl_100_Peak_3_Error;
gaussianSigma(4) = NaCl_100_Peak_4_Error;
gaussianSigma(5) = NaCl_100_Peak_5_Error;
gaussianSigma(6) = NaCl_100_Peak_6_Error;
gaussianSigma(7) = NaCl_110_Peak_1_Error;
gaussianSigma(8) = NaCl_110_Peak_2_Error;
gaussianSigma(9) = NaCl_110_Peak_3_Error;
gaussianSigma(10) = NaCl_110_Peak_4_Error;
gaussianSigma(11) = NaCl_111_Peak_1_Error;
gaussianSigma(12) = NaCl_111_Peak_2_Error;
gaussianSigma(13) = NaCl_111_Peak_3_Error;
gaussianSigma(14) = NaCl_111_Peak_4_Error;
gaussianSigma(15) = NaCl_111_Peak_5_Error;

angles(1) = NaCl_100_Peak_1_Angle;
angles(2) = NaCl_100_Peak_2_Angle;
angles(3) = NaCl_100_Peak_3_Angle;
angles(4) = NaCl_100_Peak_4_Angle;
angles(5) = NaCl_100_Peak_5_Angle;
angles(6) = NaCl_100_Peak_6_Angle;
angles(7) = NaCl_110_Peak_1_Angle;
angles(8) = NaCl_110_Peak_2_Angle;
angles(9) = NaCl_110_Peak_3_Angle;
angles(10) = NaCl_110_Peak_4_Angle;
angles(11) = NaCl_111_Peak_1_Angle;
angles(12) = NaCl_111_Peak_2_Angle;
angles(13) = NaCl_111_Peak_3_Angle;
angles(14) = NaCl_111_Peak_4_Angle;
angles(15) = NaCl_111_Peak_5_Angle;

for i = 1:length(gaussianSigma)
    
    if (gaussianSigma(i) <= measurementRes)
        
        errorOnAngles(i) = measurementRes;
    
    else
        
        errorOnAngles(i) = gaussianSigma(i);
        
    end
    
    
    
end

