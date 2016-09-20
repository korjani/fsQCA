function [data,Ind]=OutputLevelFsQCA(data,SelectDesiredOutcome,OutputLevel)

a=find(data(:,SelectDesiredOutcome) > OutputLevel);
dataNew=data(a,:);
data=dataNew;
Ind=a;
end