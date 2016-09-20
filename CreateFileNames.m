function [ParSolFileName,ComSolFileName,SubKnoFileName,IntSolFileName,BelSimIntSolFileName]=CreateFileNames(InputFileName, outputName)
ParSolFileName=strcat('PS','_',outputName,'.csv');
ParSolFileName=fullfile(InputFileName(1:end-4),ParSolFileName);

ComSolFileName=strcat('CS','_',outputName,'.csv');
ComSolFileName=fullfile(InputFileName(1:end-4),ComSolFileName);

SubKnoFileName=strcat('SK','_',outputName,'.csv');
SubKnoFileName=fullfile(InputFileName(1:end-4),SubKnoFileName);

IntSolFileName=strcat('IS','_',outputName,'.csv');
IntSolFileName=fullfile(InputFileName(1:end-4),IntSolFileName);

BelSimIntSolFileName=strcat('BSIS','_',outputName,'.csv');
BelSimIntSolFileName=fullfile(InputFileName(1:end-4),BelSimIntSolFileName);

end
