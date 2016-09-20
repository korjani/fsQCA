%9/30/13
function Modified_fsQCA()

%InputFileName='MF_MPG_4C.csv';



%% LM-FCM MF
% RemoveModerateTerm = 0; % remove the middle term if it is 1  when three terms are assigned to each avariable
% Modify Number of terms when Moderate is not considered
% if (RemoveModerateTerm ==1)
%     NumberOfTerms=2;
% end
% MF_FilenName = LMFCM_MF(InputFileName,NumberOfTerms,RemoveModerateTerm);
%% find intersection of MFs of a varaible
% PossibleCausalConditions(InputFileName,NumberOfTerms)

%% Load MFs Excel Data
MF_FilenName=InputFileName;
[data,header]=LoadExcelData(MF_FilenName);

%%

result=[];
for i =1: NumberOfTerms
    [InterSolMatrix,headers]=fsQCA_main(InputFileName, NumberofCausalCondition, NumberofCausalCondition+i,data,header);
    for j=1:size(InterSolMatrix,1)
        if sum(isnan(InterSolMatrix(j,1:NumberofCausalCondition)))~=NumberofCausalCondition;
%             ruleNew=SelectHighestSimilarityBetweenCC(InterSolMatrix,data,NumberofCausalCondition/NumberofOutput,NumberofOutput);
%             InterSolMatrix=ruleNew;
            a=InterSolMatrix(j,1:NumberofCausalCondition+3);% 3=output+consistentcy+coverage
            a(:,NumberofCausalCondition+1)=i;%*ones(size(InterSolMatrix,1),1); % show output term number
            result=[result; a];
        end
    end
end

TotalSolution=strcat('Rules','_',InputFileName);
TotalSolution=fullfile(InputFileName(1:end-4),TotalSolution);
headers{1,NumberofCausalCondition+1}=InputFileName(1,1:end-4);
csvwrite_with_headers(TotalSolution,result,headers(1,1:NumberofCausalCondition+3))


