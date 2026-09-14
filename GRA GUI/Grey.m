function varargout = Grey(varargin)
%Last Modified by GUIDE v2.5 09-Aug-2020 10:59:45
%Developed by Ariunbolor Purvee, 
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Grey_OpeningFcn, ...
                   'gui_OutputFcn',  @Grey_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
% --- Executes just before Grey is made visible.
function Grey_OpeningFcn(hObject, eventdata, handles, varargin)
clc;
inputParameters=xlsread('GreyRelationalStudy.xls','Sheet1','B3:D8');
set(handles.uitable5,'data', inputParameters);
op=xlsread('GreyRelationalStudy.xls','Sheet1','E3:G20');% outputparameters from the simulated motor
outputsParameters=[round(op(:,1)) op(:,2) op(:,3)] ;
set(handles.uitable6,'data', outputsParameters);
handles.output = hObject;
guidata(hObject, handles);
handles.output = hObject;
guidata(hObject, handles);
function varargout = Grey_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function uitable5_CellEditCallback(hObject, eventdata, handles)
function uitable6_CellEditCallback(hObject, eventdata, handles)
function pushbutton1_Callback(hObject, eventdata, handles)
RPM_target=1450;Te_target=74.69;Is_target=20.8;
A=xlsread('GreyRelationalStudy.xls','Sheet1','E3:G20');
oA=load('orth18.txt'); 
ref=1;RPM=A(:,1);Te=A(:,2);Is=A(:,3);
[Sbest,NomSbest,Weighted,AbsDiff ] = GreyRealtionalStudy(RPM, Te, Is,RPM_target, Te_target, Is_target,ref);
[MaxMinAveRow,maxRowMax,minRowMin]= MaxMinAveOfRow(AbsDiff);
MaxMin=[round(max(RPM)),max(Te),max(Is),maxRowMax;round(min(RPM)),min(Te),min(Is),minRowMin]';
set(handles.uitable10,'data', MaxMin);
function pushbutton2_Callback(hObject, eventdata, handles)
RPM_target=1450;Te_target=74.69;Is_target=20.8;
A=xlsread('GreyRelationalStudy.xls','Sheet1','E3:G20');
oA=load('orth18.txt'); 
ref=1;RPM=A(:,1);Te=A(:,2);Is=A(:,3);
[Sbest,NomSbest,Weighted,AbsDiff ] = GreyRealtionalStudy(RPM, Te, Is,RPM_target, Te_target, Is_target,ref);
[MaxMinAveRow,maxRowMax,minRowMin]= MaxMinAveOfRow(AbsDiff);
AveRow=MaxMinAveRow(:,3);
Grade = GreyRelationalGrade(AveRow,maxRowMax,minRowMin);
Rank= RankGrade(Grade);
GradeRank=[AveRow,Grade,Rank];
set(handles.uitable11,'data', GradeRank);
function pushbutton13_Callback(hObject, eventdata, handles) % input parameters
clc;a=0.1;oA=load('orth18.txt'); 
inputsIs=xlsread('GreyRelationalStudy.xls','Sheet1','B4:D8'); 
Rs=inputsIs(1);Rb=inputsIs(2);Re=inputsIs(3); 
Ls=inputsIs(4);Lb=inputsIs(5);Le=inputsIs(6);
InPs = inputParameters(Rs,Rb,Re,Ls,Lb,Le,a,oA);
set(handles.uitable21,'data', InPs);
function pushbutton14_Callback(hObject, eventdata, handles) % output parameters
RPM_target=1450;Te_target=74.69;Is_target=20.8;
A=xlsread('GreyRelationalStudy.xls','Sheet1','E3:G20');
ref=1;RPM=A(:,1);Te=A(:,2);Is=A(:,3);
[Sbest,NomSbest,Weighted,AbsDiff ] = GreyRealtionalStudy(RPM, Te, Is,RPM_target, Te_target, Is_target,ref);
[MaxMinAveRow,maxRowMax,minRowMin]= MaxMinAveOfRow(AbsDiff);
AveRow=MaxMinAveRow(:,3);
Grade = GreyRelationalGrade(AveRow,maxRowMax,minRowMin);
[SN_Grade, sqSN_Grade, GM,m,SSm] = generateSmallestBest(Grade);
SNs=[SN_Grade, sqSN_Grade, m];
set(handles.uitable23,'data', SNs);
function pushbutton15_Callback(hObject, eventdata, handles)
clc;oA=load('orth18.txt'); 
Ao = OrthogonalArray(oA); 
RPM_target=1450;Te_target=74.69;Is_target=20.8;
A=xlsread('GreyRelationalStudy.xls','Sheet1','E3:G20');
ref=1;RPM=A(:,1);Te=A(:,2);Is=A(:,3);L=3; N=18; 
[Sbest,NomSbest,Weighted,AbsDiff ] = GreyRealtionalStudy(RPM, Te, Is,RPM_target, Te_target, Is_target,ref);
[MaxMinAveRow,maxRowMax,minRowMin]= MaxMinAveOfRow(AbsDiff);
AveRow=MaxMinAveRow(:,3);
Grade = GreyRelationalGrade(AveRow,maxRowMax,minRowMin);
[SN_Grade, sqSN_Grade, GM,m,SSm] = generateSmallestBest(Grade);
distA= distArray( Ao, SN_Grade);
etaSNij=  evaluatedSNratio(distA); %evaluated S/N ratio in row vector
etaSN=reshape(etaSNij,[L,N/L])' ; % table with six rows (Rs,Rb,Re,Ls,Lb,Ls) and three colunm (levels)
[DOFr, DOFt,DOFe] = CalculationDegreeOfFreedom(N,L);
[ Msqr, eMsq,  Fr, SS] =varianceSN( etaSN,SN_Grade, SSm, N,L, DOFr,DOFe ); 
result=[etaSN SS Msqr Fr];
set(handles.uitable27,'data', result);


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
clc;oA=load('orth18.txt'); 
Ao = OrthogonalArray(oA); 
RPM_target=1450;Te_target=74.69;Is_target=20.8;
A=xlsread('GreyRelationalStudy.xls','Sheet1','E3:G20');
ref=1;RPM=A(:,1);Te=A(:,2);Is=A(:,3);L=3; N=18; 
[Sbest,NomSbest,Weighted,AbsDiff ] = GreyRealtionalStudy(RPM, Te, Is,RPM_target, Te_target, Is_target,ref);
[MaxMinAveRow,maxRowMax,minRowMin]= MaxMinAveOfRow(AbsDiff);
AveRow=MaxMinAveRow(:,3);
Grade = GreyRelationalGrade(AveRow,maxRowMax,minRowMin);
[SN_Grade, sqSN_Grade, GM,m,SSm] = generateSmallestBest(Grade);
distA= distArray( Ao, SN_Grade);
etaSNij=  evaluatedSNratio(distA); %evaluated S/N ratio in row vector
etaSN=reshape(etaSNij,[L,N/L])' ; % table with six rows (Rs,Rb,Re,Ls,Lb,Ls) and three colunm (levels)
y=etaSN'; yRs=y(:,1); yRb=y(:,2); yRe=y(:,3); yLs=y(:,4); yLb=y(:,5); yLe=y(:,6);
xlim([0 60]); axis off; hold on
 x=[1 5 9]';
plot(x, yRs,'s-', 10+x, yRb,'sq-',20+x, yRe,'sq-',30+x, yLs,'sq-',40+x, yLb,'sq-', 50+x, yLe,'sq-');
 text(x(1),yRs(1),'  Rs1'); text(x(2),yRs(2),'  Rs2');text(x(3),yRs(3),'  Rs3');
 text(10+x(1),yRb(1),'  Rb1'); text(10+x(2),yRb(2),'  Rb2');text(10+x(3),yRb(3),'Rb3');
 text(20+x(1),yRe(1),'  Re1'); text(20+x(2),yRe(2),'  Re2');text(20+x(3),yRe(3),'  Re3');
 text(30+x(1),yLs(1),'  Ls1'); text(30+x(2),yLs(2),'  Ls2');text(30+x(3),yLs(3),'  Ls3');
 text(40+x(1),yLb(1),'  Lb1'); text(40+x(2),yLb(2),'  Lb2');text(40+x(3),yLb(3),'  Lb3');
 text(50+x(1),yLe(1),'  Le1'); text(50+x(2),yLe(2),'  Le2');text(50+x(3),yLe(3),'  Le3');
 set(handles.axes7,'visible', 'off');

function pushbutton17_Callback(hObject, eventdata, handles)
L=3; assignin('base','L',L); % experimental level
N=18; assignin('base','N',N); % number of experimens
DOFj=L-1; sumDOFj=DOFj*6;DOFt=N-1;DOFe=DOFt-sumDOFj;
DOF=[DOFj sumDOFj DOFt DOFe]';
set(handles.uitable25,'data', DOF);
