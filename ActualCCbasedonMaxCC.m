clear
clc
%% Input
InputFileName='MF_Mackeyglass2T3C.csv';
%%
NumberofCausalCondition=8;%input('Number of causal conditions: ');% Select Causal Condition
NumberofOutput=3;%input('Number of Output: ');% Select desired outcome
SelectDesiredOutcome=9;
%% Load MFs Excel Data
[data,header]=LoadExcelData(InputFileName);
%%

%% Causal Conditions
SelectCausalConditions=1:NumberofCausalCondition;
NoCC=length(SelectCausalConditions);% Number of Causal Conditions
[MFCond]=data(:,SelectCausalConditions);
HeaderCond=header(1,SelectCausalConditions);

%% desired outcome
[MFOut]=data(:,SelectDesiredOutcome);
HeaderOut=header{1,SelectDesiredOutcome};
NoCases=size(MFCond,1);

%% Creating Truth Table
k=NoCC;
MFCond=[MFCond(:,1:k), 1-MFCond(:,1:k)];

for i=1:NoCases
    for j=1:k
        if ( MFCond(i,j) >= MFCond(i,j+k) )
            condition(i,j) = 1;
        else
            condition(i,j) = 0;
        end
    end
end
for i=1:NoCases
    CausalCond(i,1)=binvec2dec(condition(i,:)); % must read left 2 right 
end

firing=[];
Table=[];

while size(CausalCond,2)>0 && size(CausalCond,1)>0
    CausalFre=find(CausalCond==CausalCond(1));
    B=dec2binvec(CausalCond(1),k);
    CausalCond(CausalFre)=[];
    table=ones(NoCases,1);
    for j=1:k
        if( B(j) ==0)
            BB=1-MFCond(:,j); %1-MF
        else
            BB=MFCond(:,j); % MF
        end
        table=min(table,BB);
    end 
    firing = [firing,table];
    Table=[Table;B,size(CausalFre,1)];
end
for i=1:size(firing,2)
    SS(i)=sum(min(firing(:,i),data(:,NumberofCausalCondition+1)))/sum(firing(:,i));
end
Table=[Table,SS'];
for i=1:size(firing,2)
    SS(i)=sum(min(firing(:,i),data(:,NumberofCausalCondition+2)))/sum(firing(:,i));
end
Table=[Table,SS'];
for i=1:size(firing,2)
    SS(i)=sum(min(firing(:,i),data(:,NumberofCausalCondition+3)))/sum(firing(:,i));
end
Table=[Table,SS'];
