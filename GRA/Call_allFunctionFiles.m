clc;clear;
%% Step 1
RPM_target=1450;Te_target=73.69;Is_target=20.8;
A=xlsread('Grey.xls','Grey','AC4:AE21');
oA=load('orth18.txt'); N=length(oA); L=3;
ref=1;RPM=A(:,1);Te=A(:,2);Is=A(:,3);
[Sbest,NomSbest,Weighted,AbsDiff ] = GreyRealtionalStudy(RPM, Te, Is,RPM_target, Te_target, Is_target,ref);
[MaxMinAveRow,maxRowMax,minRowMin]= MaxMinAveOfRow(AbsDiff);
AveRow=MaxMinAveRow(:,3);
Grade = GreyRelationalGrade(AveRow,maxRowMax,minRowMin);
Ranks= RankGrade(Grade);
%% Step 2
Ao = OrthogonalArray(oA); 
[SN_Grade, sqSN_Grade, GM,m,SSm] = generateSmallestBest(Grade);
distA= distArray( Ao, SN_Grade);
display(distA);
%% Step 3
etaSNij=  evaluatedSNratio(distA); %evaluated S/N ratio in row vector
etaSN=reshape(etaSNij,[L,N/L])' ; % table with six rows (Rs,Rb,Re,Ls,Lb,Ls) and three colunm (levels)
[DOFr, DOFt,DOFe] = CalculationDegreeOfFreedom(N,L);
[ Msqr, eMsq,  Fr, SS] =varianceSN( etaSN,SN_Grade, SSm, N,L, DOFr,DOFe ); 
result=[etaSN SS Msqr Fr]; display(result);
%% Step 4
GreyPlot( etaSN)
