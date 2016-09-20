function Sol2(FileName,Table,HeaderOut,HeaderCond,NoCC,CutOffFre,ConsistencyThreshold,DontCare)
%% this function perfomr quine mccluskey method on  the truth table base on the dont cares combinations

dummy1=0;
dummy2=0;
%% causal combinations
for i=1:size(Table,1)
    if (Table(i,NoCC+1) >=CutOffFre)
        for j=1:NoCC
            if Table(i,j)==1
                SolTable{i,j}='1';
                
            elseif Table(i,j)==0
                SolTable{i,j}='0';
            else
                SolTable{i,j}='X';
            end
        end  
        if (Table(i,NoCC+2) >=ConsistencyThreshold)
            SolTable{i,NoCC+2}='1';
            dummy1=1;
        else
            SolTable{i,NoCC+2}='0';
            dummy2=1;
        end
    end
end

if dummy2 ==1 && dummy1==1
    writeTabFile(SolTable,NoCC,DontCare);
    %QM
    system('bf1x.exe <output.tab> result.txt');
    solutionTable=ReadQMresultText();
else
    solutionTable=NaN(1,NoCC);
end
solutionTable(:,NoCC+1)=ones(size(solutionTable,1),1);
Headers=[HeaderCond,HeaderOut];
csvwrite_with_headers(FileName,solutionTable,Headers);


end