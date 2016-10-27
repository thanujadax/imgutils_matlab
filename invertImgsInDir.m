function invertImgsInDir(inputDir,outputDir,fmt)

inputFileList = dir(fullfile(inputDir,strcat('*.',fmt)));

for i=1:length(inputFileList)
    imIn = double(imread(fullfile(inputDir,inputFileList(i).name)));
    imOut = invertImage(imIn);
    outputFileName = fullfile(outputDir,inputFileList(i).name);
    imwrite(imOut,outputFileName);
end