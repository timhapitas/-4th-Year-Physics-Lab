pxl_to_mm = 0.0212; %mm/pixel%
pxl_to_mm_err = 1.18e-5; %mm/pixel%

inches_to_mm = 25.4; %mm/inch%

D_total = 2.0625*inches_to_mm; %mm%
D_total_err = (7.8125e-3)*inches_to_mm; %mm%
D_aperture = 16.2; %mm%
D_aperture_err = 0.01; %mm%

x_o = ones(1,5)*448.8;
x_o_err = ones(1, 5)*212.3;

y_o = ones(1, 5)*1068;
y_o_err = ones(1, 5)*509.9;

x_1 = [2589, 1520, 2057, 993.6, 1340];
x_1_err = [118.5, 25.41, 42.56, 24.01, 17.83];

y_1 = [1023, 689.2, 209.5, 464.6, 93.90];
y_1_err = [46.49, 40.02, 37.14, 28.04, 24.36];

%Compute coordinates of Laue points%

x = abs(x_1 - x_o);
x_err = sqrt((x_1_err.^2) + (x_o_err.^2));

y = abs(y_1 - y_o);
y_err = sqrt((y_1_err.^2) + (y_o_err.^2));

%Compute distances of points from central beam axis%

L = sqrt(x.^2 + y.^2);
L_err = sqrt((((x.^2).*(x_err.^2)) + ((y.^2).*(y_err.^2)))./((x.^2) + (y.^2)));

%Convert point distances from pixels to mm%

L_m = L*pxl_to_mm;
L_m_err = sqrt(((pxl_to_mm^2)*(L_err.^2)) + ((L.^2)*(pxl_to_mm_err^2)));

%Now calculate distance of sample to film using measured distances obtained
%in the laboratory

D = D_total - D_aperture;
D_err = sqrt((D_total_err^2) + (D_aperture_err^2));

%computation of experimental glancing angles
Angle_exp = (1/2)*atand(L_m./D); %Degrees%
Angle_exp_err = sqrt((((1./(2.*(D + ((L_m.^2)./D)))).^2).*(L_m_err.^2)) + ((L_m./(2.*((D.^2) + ((L_m.^2)))).^2).*(D_err.^2)));

millerIndices_base = [1 0 0; 1 1 0; 1 1 1; 2 0 0; 2 1 0; 2 1 1; 2 2 0; 2 2 1; 3 1 0; 3 1 1; 2 2 2; 3 2 0; 3 2 1; 4 0 0; 4 1 0; 3 2 2; 4 1 1; 3 3 0; 3 3 1; 4 2 0; 4 2 1; 3 3 2; 4 2 2; 5 0 0; 4 3 0; 5 1 0; 4 3 1; 5 1 1; 3 3 3; 5 2 0; 4 3 2; 5 2 1; 4 4 0; 5 2 2; 4 4 1; 5 3 0; 4 3 3; 5 3 1; 6 0 0; 4 4 2; 6 1 0; 6 1 1; 5 3 2];
millerIndices_int = cat(1, millerIndices_base, circshift(millerIndices_base, 1, 2));
millerIndices_base = circshift(millerIndices_base, 1, 2);
millerIndices_final = cat(1, millerIndices_int, circshift(millerIndices_base, 1, 2));
Angle_calc = zeros(1, 3*max(size(millerIndices_base)));

count1 = 1;
count2 = 1;
count3 = 1;
for i = 1:3*max(size(millerIndices_base))
    
   Angle_calc(i) = asind(millerIndices_final(i, 1)/sqrt((millerIndices_final(i, 1)^2) + (millerIndices_final(i, 2)^2) + (millerIndices_final(i, 3)^2)));
   count1 = count1 + 1;
        
    
    
end

hl_ratios = zeros(1, max(size(millerIndices_final)));
for i = 1:max(size(millerIndices_final))
   
    hl_ratios(i) = millerIndices_final(i, 2)/millerIndices_final(i, 3);
    
end

constraint_indices = zeros(1, length(x));
for i = 1:length(x)
   
    [diff, constraint_indices(i)] = min(abs((y(i)/x(i)) - hl_ratios));
    
end

constraints = hl_ratios(constraint_indices);

Angle_match_indices = zeros(1, length(Angle_exp));
for i = 1:length(Angle_exp)
   
    for j = 1:length(hl_ratios)
        
        [diff, index] = min(abs(Angle_exp(i) - Angle_calc));
        
        if (hl_ratios(j) == constraints(i))
           
            Angle_match_indices(i) = index;
        else
            Angle_calc(index) = [];
        end
        
    end
    
end

% Angle_matches = Angle_calc(Angle_match_indices);
% Angle_matches_diffs = abs(Angle_matches - Angle_exp);
% 
% confirmedMillerIndices = millerIndices_final(Angle_match_indices, :);