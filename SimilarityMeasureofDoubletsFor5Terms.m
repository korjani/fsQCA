%  hold on
% scatter(var(:,2),MF(:,6))
% scatter(var(:,2),MF(:,7))
% scatter(var(:,2),MF(:,8))
% scatter(var(:,2),MF(:,9))
% scatter(var(:,2),MF(:,10))
% hold off
% 
% L=1-data(:,(inputNo-1)*5+1);
% M=1-data(:,(inputNo-1)*5+3);
% H=1-data(:,(inputNo-1)*5+5);
% Cnew=min(min(L,M),H); 
% 
% inputNo=1;
% B=max(data(:,(inputNo-1)*5+2),data(:,(inputNo-1)*5+4));
% Jaccard(Cnew,B)


%%
inputNo=4;



L=1-data(:,(inputNo-1)*5+1);
M=1-data(:,(inputNo-1)*5+3);
H=1-data(:,(inputNo-1)*5+5);
Cnew=min(min(L,M),H); 

B=1-data(:,(inputNo-1)*5+1);
S(1,1)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+1);
S(1,2)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+2);
S(1,3)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+2);
S(1,4)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+3);
S(1,5)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+3);
S(1,6)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+4);
S(1,7)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+4);
S(1,8)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+5);
S(1,9)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+5);
S(1,10)=Jaccard(Cnew,B);


B=max(data(:,(inputNo-1)*5+2),data(:,(inputNo-1)*5+4));
S(1,11)=Jaccard(Cnew,B);

%%
L=1-data(:,(inputNo-1)*5+1);
M=1-data(:,(inputNo-1)*5+3);
H=data(:,(inputNo-1)*5+5);
Cnew=min(min(L,M),H); 

B=1-data(:,(inputNo-1)*5+1);
S(2,1)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+1);
S(2,2)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+2);
S(2,3)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+2);
S(2,4)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+3);
S(2,5)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+3);
S(2,6)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+4);
S(2,7)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+4);
S(2,8)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+5);
S(2,9)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+5);
S(2,10)=Jaccard(Cnew,B);

B=max(data(:,(inputNo-1)*5+2),data(:,(inputNo-1)*5+4));
S(2,11)=Jaccard(Cnew,B);

%%
L=data(:,(inputNo-1)*5+1);
M=1-data(:,(inputNo-1)*5+3);
H=1-data(:,(inputNo-1)*5+5);
Cnew=min(min(L,M),H); 

B=1-data(:,(inputNo-1)*5+1);
S(3,1)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+1);
S(3,2)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+2);
S(3,3)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+2);
S(3,4)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+3);
S(3,5)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+3);
S(3,6)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+4);
S(3,7)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+4);
S(3,8)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+5);
S(3,9)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+5);
S(3,10)=Jaccard(Cnew,B);

B=max(data(:,(inputNo-1)*5+2),data(:,(inputNo-1)*5+4));
S(3,11)=Jaccard(Cnew,B);

%%
L=1-data(:,(inputNo-1)*5+1);
M=data(:,(inputNo-1)*5+3);
H=1-data(:,(inputNo-1)*5+5);
Cnew=min(min(L,M),H); 

B=1-data(:,(inputNo-1)*5+1);
S(4,1)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+1);
S(4,2)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+2);
S(4,3)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+2);
S(4,4)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+3);
S(4,5)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+3);
S(4,6)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+4);
S(4,7)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+4);
S(4,8)=Jaccard(Cnew,B);

B=1-data(:,(inputNo-1)*5+5);
S(4,9)=Jaccard(Cnew,B);

B=data(:,(inputNo-1)*5+5);
S(4,10)=Jaccard(Cnew,B);

B=max(data(:,(inputNo-1)*5+2),data(:,(inputNo-1)*5+4));
S(4,11)=Jaccard(Cnew,B);

S