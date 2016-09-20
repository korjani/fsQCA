function Sol_impossibleCC(FileName,Table,HeaderOut,HeaderCond,NoCC,CutOffFre,ConsistencyThreshold,DontCare)
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

%% Impossible combination
% impossible combination 011
[row,col]=size(SolTable);
for i=1:8
    d3=dec2bin(i-1,3)-'0';
    SolTable{row+i,1}='0';
    SolTable{row+i,2}='1';
    SolTable{row+i,3}='1';
    if d3(1)==0
        SolTable{row+i,4}='0';
    else
        SolTable{row+i,4}='1';
    end
    if d3(2)==0
        SolTable{row+i,5}='0';
    else
        SolTable{row+i,5}='1';
    end
    if d3(3)==0
        SolTable{row+i,6}='0';
    else
        SolTable{row+i,6}='1';
    end    
    SolTable{row+i,NoCC+2}='0';
end
[row,col]=size(SolTable);
% impossible 101
for i=1:8
    d3=dec2bin(i-1,3)-'0';
    SolTable{row+i,1}='1';
    SolTable{row+i,2}='0';
    SolTable{row+i,3}='1';
    if d3(1)==0
        SolTable{row+i,4}='0';
    else
        SolTable{row+i,4}='1';
    end
    if d3(2)==0
        SolTable{row+i,5}='0';
    else
        SolTable{row+i,5}='1';
    end
    if d3(3)==0
        SolTable{row+i,6}='0';
    else
        SolTable{row+i,6}='1';
    end    
    SolTable{row+i,NoCC+2}='0';
end
[row,col]=size(SolTable);
% impossible combiantion 110
for i=1:8
    d3=dec2bin(i-1,3)-'0';
    SolTable{row+i,1}='1';
    SolTable{row+i,2}='1';
    SolTable{row+i,3}='0';
    if d3(1)==0
        SolTable{row+i,4}='0';
    else
        SolTable{row+i,4}='1';
    end
    if d3(2)==0
        SolTable{row+i,5}='0';
    else
        SolTable{row+i,5}='1';
    end
    if d3(3)==0
        SolTable{row+i,6}='0';
    else
        SolTable{row+i,6}='1';
    end    
    SolTable{row+i,NoCC+2}='0';
end
[row,col]=size(SolTable);
% impossible combination 111
for i=1:8
    d3=dec2bin(i-1,3)-'0';
    SolTable{row+i,1}='1';
    SolTable{row+i,2}='1';
    SolTable{row+i,3}='1';
    if d3(1)==0
        SolTable{row+i,4}='0';
    else
        SolTable{row+i,4}='1';
    end
    if d3(2)==0
        SolTable{row+i,5}='0';
    else
        SolTable{row+i,5}='1';
    end
    if d3(3)==0
        SolTable{row+i,6}='0';
    else
        SolTable{row+i,6}='1';
    end    
    SolTable{row+i,NoCC+2}='0';
end
[row,col]=size(SolTable);

%% vairale 2 y

% impossible combination 011
[row,col]=size(SolTable);
for i=1:8
    d3=dec2bin(i-1,3)-'0';
    SolTable{row+i,4}='0';
    SolTable{row+i,5}='1';
    SolTable{row+i,6}='1';
    if d3(1)==0
        SolTable{row+i,1}='0';
    else
        SolTable{row+i,1}='1';
    end
    if d3(2)==0
        SolTable{row+i,2}='0';
    else
        SolTable{row+i,2}='1';
    end
    if d3(3)==0
        SolTable{row+i,3}='0';
    else
        SolTable{row+i,3}='1';
    end    
    SolTable{row+i,NoCC+2}='0';
end
[row,col]=size(SolTable);
% impossible 101
for i=1:8
    d3=dec2bin(i-1,3)-'0';
    SolTable{row+i,4}='1';
    SolTable{row+i,5}='0';
    SolTable{row+i,6}='1';
    if d3(1)==0
        SolTable{row+i,1}='0';
    else
        SolTable{row+i,1}='1';
    end
    if d3(2)==0
        SolTable{row+i,2}='0';
    else
        SolTable{row+i,2}='1';
    end
    if d3(3)==0
        SolTable{row+i,3}='0';
    else
        SolTable{row+i,3}='1';
    end    
    SolTable{row+i,NoCC+2}='0';
end
[row,col]=size(SolTable);
% impossible combiantion 110
for i=1:8
    d3=dec2bin(i-1,3)-'0';
    SolTable{row+i,4}='1';
    SolTable{row+i,5}='1';
    SolTable{row+i,6}='0';
    if d3(1)==0
        SolTable{row+i,1}='0';
    else
        SolTable{row+i,1}='1';
    end
    if d3(2)==0
        SolTable{row+i,2}='0';
    else
        SolTable{row+i,2}='1';
    end
    if d3(3)==0
        SolTable{row+i,3}='0';
    else
        SolTable{row+i,3}='1';
    end    
    SolTable{row+i,NoCC+2}='0';
end
[row,col]=size(SolTable);
% impossible combination 111
for i=1:8
    d3=dec2bin(i-1,3)-'0';
    SolTable{row+i,4}='1';
    SolTable{row+i,5}='1';
    SolTable{row+i,6}='1';
    if d3(1)==0
        SolTable{row+i,1}='0';
    else
        SolTable{row+i,1}='1';
    end
    if d3(2)==0
        SolTable{row+i,2}='0';
    else
        SolTable{row+i,2}='1';
    end
    if d3(3)==0
        SolTable{row+i,3}='0';
    else
        SolTable{row+i,3}='1';
    end    
    SolTable{row+i,NoCC+2}='0';
end
[row,col]=size(SolTable);

    
    
 %%  

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