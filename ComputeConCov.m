function ComputeConCov(FileName,NoCases,NoCC,MFCond,MFOut)

[Sol,header]=LoadExcelData(FileName);

for i=1:size(Sol,1)
    table=ones(NoCases,1);
    for j=1:NoCC
        if( Sol(i,j) ==0)
            BB=1-MFCond(:,j); %1-MF
        elseif ( Sol(i,j) ==1)
            BB=MFCond(:,j); % MF
        else
            BB=ones(NoCases,1);            
        end
        table=min(table,BB);
    end
    Sol(i,NoCC+2)=sum(min(table,MFOut))/sum(table);
    Sol(i,NoCC+3)=sum(min(table,MFOut))/sum(MFOut);
end

Headers=header(1:NoCC+1);
Headers{1,end+1}='Consistency';
Headers{1,end+1}='Coverage';

csvwrite_with_headers(FileName,Sol,Headers)

end
