function DBSubKno=SubstantiveKnowldge(FileName,MFCond,MFOut,NoCC,HeaderCond,ConsistencyThreshold)
%This DAta based substantive knowledge is based on subsethood! 
% if Consistency is greater than .8 then cc or its complement is selected
% as DBSK
%%

subKno=HeaderCond;
DBSubKno=zeros(1,NoCC);
Sol=zeros(2,NoCC);
for j=1:NoCC
   table=MFCond(:,j);
   Sol(1,j)=sum(min(table,MFOut))/sum(table);
end
for j=1:NoCC
   table=1-MFCond(:,j);
   Sol(2,j)=sum(min(table,MFOut))/sum(table);
end


% fprintf(' Substantive Knowledge Treshold = % f\n',ConsistencyThreshold);
for i =1:NoCC
    if ( Sol(1,i) >= ConsistencyThreshold)
        subKno{2,i}='1'; 
        DBSubKno(i)=1;
   elseif (Sol(2,i) >= ConsistencyThreshold)
        subKno{2,i}='0';
        DBSubKno(i)=0;
    else 
        subKno{2,i}='X';
        DBSubKno(i)=-1;
    end
    subKno{3,i}=Sol(1,i);
    subKno{4,i}=Sol(2,i);
end

cellwrite(FileName, subKno)

   

end