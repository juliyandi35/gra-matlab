function [DOFr, DOFt,DOFe] = CalculationDegreeOfFreedom(N,L)
DOFr=L-1;%degrees of Freedom
DOFt=N-1; % total number of experiments
DOFe=DOFt-6*DOFr; %error in degrees of freedom; 6 is number of input parameters of experimental
end

