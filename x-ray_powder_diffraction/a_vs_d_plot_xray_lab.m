millerIndices = [1 0 0; 1 1 0; 1 1 1; 2 0 0; 2 1 0; 2 1 1; 2 2 0; 2 2 1; 3 1 0; 3 1 1; 2 2 2; 3 2 0; 3 2 1];
scaleFactor = 1e-10;
legendVec = strings(1, max(size(millerIndices)));

figure;
hold on;
grid on;
title('Lattice Constant vs Interplanar Spacing for Different Miller Indices');
xlabel('Interplanar Spacing (m) (1 A^{o} = 10^{-10} m)');
ylabel('Lattice Constant (m)');
axis([0 7*scaleFactor 0 7*scaleFactor]);

for i = 1:max(size(millerIndices))
    
    millerFactor = 0;
    for j = 1:min(size(millerIndices))
       
        millerFactor = millerFactor + (millerIndices(i, j))^2;
        
    end
    millerFactor = (millerFactor^(1/2));
    
    a_vs_d = @(d) d*millerFactor;
    
    fplot(a_vs_d);
    legendVec(i) = string(millerIndices(i, 1)) + string(millerIndices(i, 2)) + string(millerIndices(i, 3));
    
end

legend(legendVec);
hold off;