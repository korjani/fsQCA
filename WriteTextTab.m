
InputLine = '# inputs' ;
strIn(2,1:7)  = 'A1 high' ;

NoCC=64;
% M truthtable

FunName = 'output.txt';
fid = fopen(FunName,'w');
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

if fid>=0
    fprintf(fid, '%s\n', str1);
    fprintf(fid, '%s\n', str2);
    fprintf(fid, '%s\n', str3);
    fprintf(fid, '%s\n', str4);
    fprintf(fid, '%s\n', str5);
    fprintf(fid, '%s\n', str6);
    fprintf(fid, '%s\n', str7);
    fprintf(fid, '%s\n', str8);
end

for i=1:size(M,1)
    a=[];
    for j=1:size(M,2)
        if isnan(M(i,j))==1
            a=strcat(a,'X');
        else
            a=strcat(a,num2str(M(i,j)));
        end
    end
    if fid>=0
        fprintf(fid, '%s\n', a);
    end
end


fclose(fid)