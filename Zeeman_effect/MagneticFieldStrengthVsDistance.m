distance = [48.2 48.7 49.2 49.7 50.2 50.7 51.2 51.7 52.2 52.7 53.2 53.7 54.2 54.7 55.0];
Bfield = [0.473 0.417 0.392 0.359 0.344 0.321 0.306 0.285 0.277 0.258 0.248 0.236 0.225 0.217 0.211];

[xData, yData] = prepareCurveData( distance, Bfield );
ft = fittype( 'poly3' );
[fitresult, gof] = fit( xData, yData, ft );

modelfunc = @(b, x) b(1)*(x.^3) + b(2)*(x.^2) + b(3)*x + b(4);
model = fitnlm(distance, Bfield, modelfunc, coeffvalues(fitresult));

fittedFunc = @(x) model.Coefficients{1,1}*(x.^3) + model.Coefficients{2,1}*(x.^2) + model.Coefficients{3,1}*x + model.Coefficients{4,1};
cf = model.Coefficients;

plot(distance, Bfield, 'r.');
title('Magnetic Field Strength versus Magnet Separation');
xlabel('Magnet Separation (mm)');
ylabel('Magnetic Field Strength (T)');
grid on;
hold on;
fplot(fittedFunc, 'b');
axis([48 55.5 0.2 0.5]);
hold off;


term1 = ((3*cf{1,1}.*(distance.^2)) + (2*cf{2,1}.*distance) + (cf{3,1}).^2).*()

