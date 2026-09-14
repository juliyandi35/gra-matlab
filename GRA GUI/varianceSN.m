function [ Msqr, eMsq,  Fr, SS] =varianceSN( etaSNij,SN_RPM, SSm, N,L, DOFr,DOFe )
SS=zeros(N/L,1); 
size_etaSNij=size(etaSNij);
for i=1:size_etaSNij(1)
        SS(i)=(N/L)*sum((etaSNij(i,:)-mean(SN_RPM)).^2); % sum of square of each six parameters/SS_S/Nij
end
 Msqr=SS/DOFr; %the ratio of the mean square value 
 eMsq=(SSm(1)-sum(SS))/DOFe; %the value of the mean square value (eMsq)
  Fr=Msqr/eMsq; % Variance 
end