function CreateFolder(InputFileName)

parentdir=pwd;
if ~isdir(fullfile(parentdir,InputFileName(1:end-4)))
    mkdir(parentdir,InputFileName(1:end-4));    
end
des=fullfile(parentdir,InputFileName(1:end-4));
copyfile(InputFileName,des);

end
