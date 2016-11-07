function growCCdir()
inputDir = '/home/thanuja/RESULTS/isbi2012/RFC/train/20161014/bw';
outputDir = '/home/thanuja/RESULTS/isbi2012/RFC/train/20161014/bw_thin';
inds = 0;
px = 2;
fmt = 'png';
% for all rgb images in the inputDir, grow their connected components by 1 pix
% in a 4nh and write back to outputDir.
% if inds==1, the output will contain index images. Else it will be binary
% px - number of times (=pixels) the CCs have to be grown

inputFileList = dir(fullfile(inputDir,strcat('*.',fmt)));

for i=1:length(inputFileList)
    imIn = double(imread(fullfile(inputDir,inputFileList(i).name)));
    % imIn = rgb2gray(imIn);   
    for j=1:px
        imIn = im2bw(imIn,0);
        imIn = growCCs(imIn,inds);
    end
    outFileName = fullfile(outputDir,inputFileList(i).name);
    imwrite(imIn,outFileName);
    
end

