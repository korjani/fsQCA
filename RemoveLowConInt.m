function RemoveLowConInt(SimInSolFileName,BelSimInSolFileName,consistencyThreshold,NoCC)

[data,headers]=LoadExcelData(SimInSolFileName);
Int=[];
for i=1:size(data,1)
    if data(i,NoCC+2) >= consistencyThreshold
        Int=[Int;data(i,:)];
    end
end
if size(Int,1)==0
    Int(1,1:NoCC+3)=NaN;
end

csvwrite_with_headers(BelSimInSolFileName,Int,headers);

end
