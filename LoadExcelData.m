function [data,headers]=LoadExcelData(filename)

fileToRead=filename;
HEADERLINES = 200000;

%% Import the file
rawData = importdata(fileToRead, ',', HEADERLINES);

%% read headers,
headers=rawData(1);
headers=headers{1,1};
aa=strfind(headers(1,:),',');

header{1}=headers(1:aa(1)-1);
for j=2:length(aa)
     header{j}=headers(aa(j-1)+1:aa(j)-1);
end
header{j+1}=headers(aa(j)+1:end);
headers=header;
%% read data
rawData=rawData(2:end);
[m,n]=size(rawData);
for i=1:m
    a=strfind(rawData(i,:),',');
    data(i,1)=str2double(rawData{i,1}(1:a{1,1}(1)-1));
    for j=2:length(a{1,1})
        data(i,j)=str2double(rawData{i,1}(a{1,1}(j-1)+1:a{1,1}(j)-1));
    end
    data(i,j+1)=str2double(rawData{i,1}(a{1,1}(j)+1:end));
end

end
