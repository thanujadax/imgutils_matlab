function slicesPerImage = getNumSlicesPerImage(inputDir,startInd,endInd,imType)

fileList = dir(fullfile(inputdir,strcat('*.',imType)));

numFiles = length(fileList);

slicesPerImage = zeros(numFiles,1);

for i=startInd:endInd
    fileName = fullfile(inputDir,fileList(i).name);
    imIn = double(imread(fileName));
    imIn = im2bw(imIn,0);
    cc = bwconncomp(imIn);
    slicesPerImage(i) = length(cc.PixelIdxList);
end

