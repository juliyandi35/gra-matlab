function distA= distArray( A, SN_RPM)
distA=zeros(length(A):length(A));
for i=1:length(A)
    for j=1:length(A)
        if A(i,j)==1
        distA(i,j)=SN_RPM(i);
        elseif A(i,j)==2
             distA(i,j)=SN_RPM(i);
        elseif  A(i,j)==3
             distA(i,j)=SN_RPM(i);
        end
    end
end


