function writeTabFile(SolTable,NoCC,DontCare)

InputLine = '# inputs' ;
FileName = 'output.tab';

fid = fopen(FileName,'w');
if fid>=0
        fprintf(fid, '%s\n', InputLine);
end

for i=(NoCC-1):-1:0
    a=strcat('A',num2str(i),' high');
    if fid>=0
        fprintf(fid, '%s\n', a);
    end
end
str1 = '# outputs';
str2 = 'B high 1';
str3 = '# flags';
str4 = '0';
str5 = '1';
str6 = '0';
str7 = '0';
str8 = '# table;';
str9= 'X';
for i=1:NoCC-1
    str9 = strcat(str9,'X');
end
str9 = strcat(str9,' X');

if fid>=0
    fprintf(fid, '%s\n', str1);
    fprintf(fid, '%s\n', str2);
    fprintf(fid, '%s\n', str3);
    fprintf(fid, '%s\n', str4);
    fprintf(fid, '%s\n', str5);
    fprintf(fid, '%s\n', str6);
    fprintf(fid, '%s\n', str7);
    fprintf(fid, '%s\n', str8);
    if DontCare == 1
       fprintf(fid, '%s\n', str9);
    end
end

for i=1:size(SolTable,1)
    a=[];
    for j=1:NoCC
        a=strcat(a,SolTable{i,j});
    end
    a=[a,' ',SolTable{i,NoCC+2}];
    if fid>=0
        fprintf(fid, '%s\n', a);
    end
end

fclose(fid);

end