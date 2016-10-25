function growCCdir(inputDir,outputDir,inds,fmt)
% for all rgb images in the inputDir, grow their connected components by 1 pix
% in a 4nh and write back to outputDir.
% if inds==1, the output will contain index images. Else it will be binary

inputFileList = dir(fullfile(inputDir,strcat('*.',fmt)));

for i=1:length(inputFileList)
    imIn = double(imread(fullfile(inputDir,inputFileList(i).name)));
    imIn = rgb2gray(imIn);
    imIn = im2bw(imIn,0);
    imOut = growCCs(imIn,inds);
    outFileName = fullfile(outputDir,inputFileList(i).name);
    imwrite(imOut,outFileName);
    
end

