function [Con,Cov]=SolutionConCov(FileName,NoCases,NoCC,MFCond,MFOut)

[Sol,header]=LoadExcelData(FileName);
table=ones(NoCases,size(Sol,1));
for i=1:size(Sol,1)
    for j=1:NoCC
        if( Sol(i,j) ==0)
            BB=1-MFCond(:,j); %1-MF
        elseif ( Sol(i,j) ==1)
            BB=MFCond(:,j); % MF
        else
            BB=ones(NoCases,1);            
        end
        table(:,i)=min(table(:,i),BB);
    end
   
end
Con=sum(min(max(table,[],2),MFOut))/sum(max(table,[],2));
Cov=sum(min(max(table,[],2),MFOut))/sum(MFOut);
Sol(i+1,1)=Con;
Sol(i+1,2)=Cov;


Headers=header(1:NoCC+1);
Headers{1,end+1}='Consistency';
Headers{1,end+1}='Coverage';


csvwrite_with_headers(FileName,Sol,Headers);

end
