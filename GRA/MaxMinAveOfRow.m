function [MaxMinAveRow,maxRowMax,minRowMin]= MaxMinAveOfRow(AbsDiff)
n=length(AbsDiff);
maxRow=zeros(n,1);
minRow=zeros(n,1);
aveRow=zeros(n,1);
sum=0;
for i=1:n
    maxRow(i)=sum+max(AbsDiff(i,:));% max of row 
    minRow(i)=sum+min(AbsDiff(i,:));% min of row
    aveRow(i)=sum+mean(AbsDiff(i,:));% average of row
end
MaxMinAveRow=[ maxRow,minRow, aveRow ];
maxRowMax=max(maxRow);
minRowMin=min(minRow);
end

