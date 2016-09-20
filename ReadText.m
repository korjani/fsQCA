clc
clear

system('bf1x.exe <large64.tab> demo2.txt')
 
fid = fopen('demo.txt');
words = textscan(fid, '%s');
 
startTable=find(strcmp(words{1,1},'Table')==1);
endTable=size(words{1,1},1);

k=1;
for j=(startTable+1):2:endTable
    for i=1:size(words{1,1}{j,1},2)
        M(k,i)=str2double(words{1,1}{j,1}(1,i)); 
    end
    k=k+1;
end

