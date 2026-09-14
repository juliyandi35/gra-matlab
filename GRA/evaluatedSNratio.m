function etaSNij=  evaluatedSNratio(distA )
sumA=zeros(1,length(distA));
count=zeros(1,length(distA));
etaSNij=zeros(1,length(distA));
for i= 1: length(distA)
    sumA(i)=sum(distA(:,i));
    count(i)=sum(distA(:,i)~=0);
    etaSNij(i)=sumA(i)/count(i);
end
end
%etaSN=reshape(etaSNij,[L,N/L])';
