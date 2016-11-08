function slicesPerImage = getNumSlicesPerImage(inputDir,startInd,endInd,imType)

fileList = dir(fullfile(inputDir,strcat('*.',imType)));

numFiles = length(fileList);

slicesPerImage = zeros(numel(startInd:endInd),1);
k = 0;
for i=startInd:endInd
    fileName = fullfile(inputDir,fileList(i).name);
    imIn = double(imread(fileName));
    imIn = im2bw(imIn,0);
    cc = bwconncomp(imIn);
    k = k+1;
    slicesPerImage(k) = length(cc.PixelIdxList);
end

