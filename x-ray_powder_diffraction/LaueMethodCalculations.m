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
