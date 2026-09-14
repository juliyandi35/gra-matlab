function [SN_Grade, sqSN_Grade, GM,m,SSm] = generateSmallestBest(Grade)
SN_Grade=-10*log10(Grade);%S/N ratios
sqSN_Grade=SN_Grade.^2; %Squares of S/N ratio  
GM=sum(sqSN_Grade); %grand total sum of squares 
m=(SN_Grade-mean(SN_Grade)).^2; %Squares to mean 
SSm=sum(m);%sum of squares due to mean
end

