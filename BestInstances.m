function BestInstances(SimBelInSoFileName,MFCond,MFOut,NoCC,NoCases,Ind)

[data,headers]=LoadExcelData(SimBelInSoFileName);

 Firing=ones(NoCases,size(data,1)-1);
for i=1:size(data,1)-1
    for j=1:NoCC
        if data(i,j)==1
            MF=MFCond(:,j);
        elseif data(i,j)==0
            MF=1-MFCond(:,j);
        else
            MF=ones(NoCases,1);
        end
        Firing(:,i)=min(Firing(:,i),MF);
    end
end
cov=[];
for j=1:NoCases
    maxFiring=max(Firing(j,:));
    indexMax=find(maxFiring==Firing(j,:));
    for i=1:length(indexMax)
        if (MFOut(j,1)>.5 ) && (MFOut(j,1)>Firing(j,indexMax(i))-.05) && (Firing(j,indexMax(i))>.5)
            [mm,nn]=find(data(indexMax(i),NoCC+4:end)==0);
            if isempty(mm)
                data(indexMax(i),size(data,2)+1)=Ind(j); 
            else
                data(indexMax(i),NoCC+3+nn(1))=Ind(j); 
            end
        end
    end
end

    

for i=NoCC+4:size(data,2)
    headers{1,i}='BeIn';
end
csvwrite_with_headers(SimBelInSoFileName,data,headers);



end
