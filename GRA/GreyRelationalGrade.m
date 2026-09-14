function Grade = GreyRelationalGrade(AveRow,maxRowMax,minRowMin)
xsi=1; %the distinguishing coefficient, xsi? [0,1]
Grade=(minRowMin+xsi*maxRowMax)./(AveRow+xsi*maxRowMax);
end

