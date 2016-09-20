clear
clc
%% Input
InputFileName='MF_Mackeyglass1T2C.csv';
%%
NumberofCausalCondition=4;%input('Number of causal conditions: ');% Select Causal Condition
NumberofOutput=3;%input('Number of Output: ');% Select desired outcome
SelectDesiredOutcome=6;
%% Load MFs Excel Data
[data,header]=LoadExcelData(InputFileName);
%%
NoCasesOriginal=size(data,1);
fprintf('Number of original cases in the data set is     %d\n', NoCasesOriginal);
OutputLevel=0.001; %% remove cases with output MF <= OutputLevel
[data,Ind]=OutputLevelFsQCA(data,SelectDesiredOutcome,OutputLevel);
% SELECT Cases
% fprintf('without zero-output level fsQCA\n');
fprintf('Number of cases retained after %f-output-Level fsQCA is      %d\n',OutputLevel,size(data,1));
NoCases=size(data,1);

%% Causal Conditions
SelectCausalConditions=1:NumberofCausalCondition;
NoCC=length(SelectCausalConditions);% Number of Causal Conditions
[MFCond]=data(:,SelectCausalConditions);
HeaderCond=header(1,SelectCausalConditions);

%% desired outcome
[MFOut]=data(:,SelectDesiredOutcome);
HeaderOut=header{1,SelectDesiredOutcome};


%% Creating Truth Table
[Table,CutOffFre]=TruthTableFast(InputFileName,MFCond,MFOut,NoCases,NoCC,header,HeaderOut)