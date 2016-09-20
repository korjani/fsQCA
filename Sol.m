function Sol(FileName,Table,HeaderOut,HeaderCond,NoCC,CutOffFre,ConsistencyThreshold,DontCare)
%% this function perfomr quine mccluskey method on  the truth table base on the dont cares combinations


%% causal combinations
NoCCom=2^NoCC;
dummy=0;
for i=1:NoCCom
    a=dec2binvec(i-1,NoCC);
    for j=1:NoCC
        if a(j)==1
            SolTable{i,j}='1';
        else
            SolTable{i,j}='0';
        end
    end
    if DontCare ==1
        SolTable{i,NoCC+2}='X';
    else
        SolTable{i,NoCC+2}='0';
    end
end


for i=1:size(Table,1)
    if (Table(i,NoCC+1) >=CutOffFre)
        if (Table(i,NoCC+2) >=ConsistencyThreshold)
            SolTable{binvec2dec(Table(i,1:NoCC))+1,NoCC+2}='1';
            dummy=1;
        else
            SolTable{binvec2dec(Table(i,1:NoCC))+1,NoCC+2}='0';
        end
    end
end


if dummy ==0
    error('X2 is empty: there is no causal combination to exclude then complex solution =BSIS');
end

writeTabFile(SolTable,NoCC);

% QM 
system('bf1.exe <output.tab> result.txt');

solutionTable=ReadQMresultText();
solutionTable(:,NoCC+1)=ones(size(solutionTable,1),1);
Headers=[HeaderCond,HeaderOut];
csvwrite_with_headers(FileName,solutionTable,Headers);
end