InputFileName='MF_MPG_4C.csv';
[data,header]=LoadExcelData(InputFileName);

inputNo=5;
Cnew=min(1-data(:,(inputNo-1)*3+1),1-data(:,(inputNo-1)*3+3)); %lh
% Cnew=min(1-data(:,(inputNo-1)*3+1),data(:,(inputNo-1)*3+3)); %lH
% Cnew=min(data(:,(inputNo-1)*3+1),1-data(:,(inputNo-1)*3+3)); %Lh

B=1-data(:,(inputNo-1)*3+1);
S(1)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*3+1);
S(2)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*3+2);
S(3)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*3+2);
S(4)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*3+3);
S(5)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*3+3);
S(6)=Jaccard(Cnew,B);

S