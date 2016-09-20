function [Table,CutOffFre]=TruthTable(InputFileName,MFCond,MFOut,NoCases,NoCC,header,HeaderOut)

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
CC=[];
Table=[];
for i =0: (2^k-1)
    if (length(find(CausalCond == i)) > 0) %% cut-off frequency
        B=dec2binvec(i,k);
        table=ones(NoCases,1);
        for j=1:k
            if( B(j) ==0)
                BB=1-MFCond(:,j); %1-MF
            else
                BB=MFCond(:,j); % MF
            end
            table=min(table,BB);
        end 
        CC=[CC,i];
        firing = [firing,table];
        Table=[Table;B,length(find(CausalCond == i))];
    end
end
Firing=firing;
for i=1:length(CC)
    SS(i)=sum(min(firing(:,i),MFOut))/sum(firing(:,i));
end
Table=[Table,SS'];

[m,n]=sort(Table(:,end-1),'descend');
Table=Table(n,:);

sumCombinations=sum(Table(:,NoCC+1));
sumCombinations80Per=ceil(0.8*sumCombinations);
sumf=Table(1,NoCC+1);
for i=2:size(Table,1)
    sumf=sumf+Table(i,NoCC+1);
    if sumf >= sumCombinations80Per
        CutOffFre=Table(i,NoCC+1);
        break;
    end
end


Headers=header(1:NoCC);
Headers{1,end+1}='Frequency';
Headers{1,end+1}='Consistency';

address=pwd;
address=fullfile(address,InputFileName(1:end-4));
address=fullfile(address,strcat('TruthTable','_',HeaderOut,'.csv'));
csvwrite_with_headers(address,Table,Headers)
end