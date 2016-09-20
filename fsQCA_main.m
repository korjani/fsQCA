%% fSQCA 
% Mehdi Korjani,
% this fsQCA is based on the Logic Friday which is a software to perform QM
% method up to 16 causal condittions. 
%% for more information read following papers
% J. M. Mendel and M. M. Korjani, ?Charles Ragin's Fuzzy Set Qualitative Comparative Analysis (fsQCA) used for linguistic summarizations,? Information Sciences, Vol. 202, pp. 1-23, 2012
% J. M. Mendel and M. M. Korjani, ?Theoretical aspects of fuzzy set qualitative comparative analysis (fsQCA),? Information Sciences, vol. 237, pp. 137-161, 2013.
% M. M. Korjani and J. M., Mendel, ?Fuzzy set Qualitative Comparative Analysis (fsQCA): Challenges and applications,? Fuzzy Information Processing Society (NAFIPS), 2012.
% J. M. Mendel and M. M. Korjani, ?On establishing nonlinear combinations of variables from small to big data for use in later processing,? Information Sciences, vol. 280, no. 0, pp. 98?110, 2014.
% M. M. Korjani and J. M., Mendel, ?Validation of Fuzzy set Qualitative Comparative Analysis (fsQCA): Granular Description of a Function,? Fuzzy Information Processing Society (NAFIPS), 2012.

%% Input
InputFileName='BoD5CausalConditions.csv';
%%
NumberofCausalCondition=4;%input('Number of causal conditions: ');% Select Causal Condition
SelectDesiredOutcome=5; %input('Number of Output: ');% Select desired outcome

%% Load MFs Excel Data
[data,header]=LoadExcelData(InputFileName);

%%  Create Results File Name & directory
CreateFolder(InputFileName);
[ParSolFileName,ComSolFileName,SubKnoFileName,IntSolFileName,BelSimIntSolFileName]=CreateFileNames(InputFileName,header{1,SelectDesiredOutcome});


%% Zero Output Level ( Adaptive Case Selection) to select cases
% OutputLevel=input('Output level(for regurlar fsQCA = -1): ');
NoCasesOriginal=size(data,1);
fprintf('Number of original cases in the data set is     %d\n', NoCasesOriginal);
OutputLevel= -0.01; %% remove cases with output MF <= OutputLevel, select negative number to have all cases
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
Table=TruthTableFast(InputFileName,MFCond,MFOut,NoCases,NoCC,header,HeaderOut);
CutOffFre=1;
ConsistencyThreshold=0.8;
fprintf('Consistency threshold: %f\n',ConsistencyThreshold)

%% Complex Solution 
% dont Care must be zero
Sol2(ComSolFileName,Table,HeaderOut,HeaderCond,NoCC,CutOffFre,ConsistencyThreshold,0);%function QMSol(FileName,Table,HeaderCond,NoCC,CutOffFre,ConsistencyThreshold,DontCare)

% calculate consistency and coverage for solutions
ComputeConCov(ComSolFileName,NoCases,NoCC,MFCond,MFOut);

%% Parsimonious Solution
% dont Care must be one
Sol2(ParSolFileName,Table,HeaderOut,HeaderCond,NoCC,CutOffFre,ConsistencyThreshold,1);% calculate consistency and coverage for solutions
ComputeConCov(ParSolFileName,NoCases,NoCC,MFCond,MFOut);

%% Compute Data-base Substantive Knowledge
DBSubKno=SubstantiveKnowldge(SubKnoFileName,MFCond,MFOut,NoCC,HeaderCond,ConsistencyThreshold);

%% Intermediate Solution
[Par,headers]=LoadExcelData(ParSolFileName);
[Com,headers]=LoadExcelData(ComSolFileName);

InterSol(IntSolFileName,Par,Com,DBSubKno,NoCC,HeaderCond,HeaderOut);
%% beleivable simplifies intermediate solution
ComputeConCov(IntSolFileName,NoCases,NoCC,MFCond,MFOut);
RemoveLowConInt(IntSolFileName,BelSimIntSolFileName,ConsistencyThreshold,NoCC)

[con,cov]=SolutionConCov(BelSimIntSolFileName,NoCases,NoCC,MFCond,MFOut);

%%Compute the best instances for each rule 
BestInstances(BelSimIntSolFileName,MFCond,MFOut,NoCC,NoCases,Ind);% ind is mapping from adaptive fsQCA case number to  number of case in the original dataset
[InterSolMatrix,headers]=LoadExcelData(BelSimIntSolFileName);

