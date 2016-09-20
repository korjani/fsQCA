function InterSol(FileName,Par,Com,DBSubKno,NoCC,HeaderCond,HeaderOut)


Intermediate=[];
for i=1:size(Par,1)
    a=find(Par(i,1:NoCC)==1);
    b=find(Par(i,1:NoCC)==0);
    for j=1:size(Com,1)
        aa=Par(i,a)==Com(j,a);
        bb=Par(i,b)==Com(j,b);
        if (length(aa)==sum(aa) && length(bb)==sum(bb))% rule 1
            for k=1:NoCC
                if (DBSubKno(k)==-1 )% rule 2
                    Int(k)=Com(j,k);
                end
                if (DBSubKno(k)==Com(j,k))% rule 3
                    Int(k)=Com(j,k);
                end
                if ( isnan(Com(j,k)))% rule 4
                    Int(k)=NaN;
                end
                if (DBSubKno(k)==1 && Par(i,k)==0 && Com(j,k)==0)
                    Int(k)=0;
                end
                if (DBSubKno(k)==0 && Par(i,k)==1 && Com(j,k)==1)
                    Int(k)=1;
                end
                if (DBSubKno(k)==1 && Com(j,k)==0 && isnan(Par(i,k)))%% complex solution changes
                    Int(k)=NaN;
                end
                if (DBSubKno(k)==0 && Com(j,k)==1 && isnan(Par(i,k)))%% complex solution changes
                    Int(k)=NaN;
                end
            end
            Intermediate=[Intermediate;Int];
        end
    end
end
IntermediateSolution=Intermediate;

% SolTable = HeaderCond;
% SolTable{1,NoCC+1}=HeaderOut;
% headers=SolTable;

for i=1:size(Intermediate,1)
    for j=1:NoCC
        if Intermediate(i,j)==1
            SolTable{i,j}='1';
        elseif Intermediate(i,j)==0
            SolTable{i,j}='0';
        else
            SolTable{i,j}='X';
        end
    end  
    SolTable{i,NoCC+2}='1';
end

DontCare=0;
writeTabFile(SolTable,NoCC,DontCare);
system('bf1x.exe <output.tab> result.txt');

solutionTable=ReadQMresultText();
solutionTable(:,NoCC+1)=ones(size(solutionTable,1),1);
Headers=[HeaderCond,HeaderOut];
csvwrite_with_headers(FileName,solutionTable,Headers);


end
