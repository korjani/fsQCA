function index=SelectCC(SubKnoFileName, NoCC, SelectDesiredOutcome,data,header)

[MFOut]=data(:,SelectDesiredOutcome);
HeaderCond=header(1,1:NoCC);
[MFCond]=data(:,1:NoCC);

subKno=HeaderCond;
Sol=zeros(2,NoCC);
% for j=1:NoCC
%    table=MFCond(:,j);
%    Sol(1,j)=sum(min(table,MFOut))/sum(table);
% end
% for j=1:NoCC
%    table=1-MFCond(:,j);
%    Sol(2,j)=sum(min(table,MFOut))/sum(table);
% end
for j=1:NoCC
   table=MFCond(:,j);
   Sol(1,j)=sum(table.*MFOut)/sum(table);
end
for j=1:NoCC
   table=1-MFCond(:,j);
   Sol(2,j)=sum(table.*MFOut)/sum(table);
end
Sol(3,:)=max(Sol);

[m,index]=sort(Sol(3,:),'descend');

Sol=Sol(:,index);
header(:,1:NoCC)=header(:,index);



csvwrite_with_headers(SubKnoFileName,Sol,header(:,1:NoCC))

   

end