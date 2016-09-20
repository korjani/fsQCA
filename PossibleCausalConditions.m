function x = PossibleCausalConditions(InputFileName,NoInTerms)

%% Load Data
[data,header]=LoadExcelData(InputFileName);

% create MF file name
MF_InputFileName=strcat('MF','_',InputFileName);
[MF,MF_header]=LoadExcelData(MF_InputFileName);

x=[];
for i=1: size(data,2)-1
    %% two terms per varialbe 
    if (NoInTerms == 2)
        % Intersection of the first term x1
        [pL,qL]=sort(abs(MF(:,2*i-1)-0.5)); % first term
        if (pL(1) == 0)
            x1= data(i,qL);
        else
            j=2;
            while sign((MF(qL(1),2*i-1)-0.5)) == sign((MF(qL(j),2*i-1)-0.5))
                j=j+1;
            end
            x1 = (data(qL(1),i)-data(qL(j),i))/(MF(qL(1),2*i-1)-MF(qL(j),2*i-1))*(0.5-MF(qL(j),2*i-1))+data(qL(j),i);
        end
        % Intersection of second term High: x2
        [pL,qL]=sort(abs(MF(:,2*i)-0.5)); %% second term 
        if (pL(1) == 0)
            x2= data(i,qL);
        else
            j=2;
            while sign((MF(qL(1),2*i)-0.5)) == sign((MF(qL(j),2*i)-0.5))
                j=j+1;
            end
            x2 = (data(qL(1),i)-data(qL(j),i))/(MF(qL(1),2*i)-MF(qL(j),2*i))*(0.5-MF(qL(j),2*i))+data(qL(j),i);
        end
        x=[x,x1,x2];
    end
    
    %% 3 term per variable
    if (NoInTerms ==3)
        % Intersection of the first term x1
        [pL,qL]=sort(abs(MF(:,3*i-2)-0.5)); % Low
        if (pL(1) == 0)
            x1= data(i,qL);
        else
            j=2;
            while sign((MF(qL(1),3*i-2)-0.5)) == sign((MF(qL(j),3*i-2)-0.5))
                j=j+1;
            end
            x1 = (data(qL(1),i)-data(qL(j),i))/(MF(qL(1),3*i-2)-MF(qL(j),3*i-2))*(0.5-MF(qL(j),3*i-2))+data(qL(j),i);
        end
        % Intersection of third term High: x2
        [pL,qL]=sort(abs(MF(:,3*i)-0.5)); %High 
        if (pL(1) == 0)
            x2= data(i,qL);
        else
            j=2;
            while sign((MF(qL(1),3*i)-0.5)) == sign((MF(qL(j),3*i)-0.5))
                j=j+1;
            end
            x2 = (data(qL(1),i)-data(qL(j),i))/(MF(qL(1),3*i)-MF(qL(j),3*i))*(0.5-MF(qL(j),3*i))+data(qL(j),i);
        end
        % Intersection of second term Moderate: x3 and x4
        m = find(MF(:,3*i-1) == 1);
        indexDataLeft=find(data(:,i) < data(m(1),i));
        indexDataRight=find(data(:,i) >= data(m(1),i));
        % x3
        [pL,qL]=sort(abs(MF(indexDataLeft,3*i-1)-0.5)); %Moderate x3
        if (pL(1) == 0)
            x3= data(i,indexDataLeft(qL));
        else
            j=2;
            while sign((MF(indexDataLeft(qL(1)),3*i-1)-0.5)) == sign((MF(indexDataLeft(qL(j)),3*i-1)-0.5))
                j=j+1;
            end
           x3 = (data(indexDataLeft(qL(1)),i)-data(indexDataLeft(qL(j)),i))/(MF(indexDataLeft(qL(1)),3*i-1)-MF(indexDataLeft(qL(j)),3*i-1))*(0.5-MF(indexDataLeft(qL(j)),3*i-1))+data(indexDataLeft(qL(j)),i);
        end
        % find x4
        [pL,qL]=sort(abs(MF(indexDataRight,3*i-1)-0.5)); %Moderate x4
        if (pL(1) == 0)
            x4= data(i,indexDataRight(qL));
        else
            j=2;
            while sign((MF(indexDataRight(qL(1)),3*i-1)-0.5)) == sign((MF(indexDataRight(qL(j)),3*i-1)-0.5))
                j=j+1;
            end
            x4 = (data(indexDataRight(qL(1)),i)-data(indexDataRight(qL(j)),i))/(MF(indexDataRight(qL(1)),3*i-1)-MF(indexDataRight(qL(j)),3*i-1))*(0.5-MF(indexDataRight(qL(j)),3*i-1))+data(indexDataRight(qL(j)),i);
        end
        
       x=[x,x1,x2,x3,x4]; 
    end
end

end