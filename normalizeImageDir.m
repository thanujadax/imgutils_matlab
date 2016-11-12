function normalizeImageDir()
% normalize output from gala which needs to be reduced to 1 and 0 labels
inputDir = '/home/thanuja/RESULTS/isbi2012/GALA/cnn_20161111';
outputDir = '/home/thanuja/RESULTS/isbi2012/GALA/cnn_bw';
type = 'png';

fileList = dir(fullfile(inputDir,strcat('*.',type)));
numFiles = length(fileList);

for i=1:numFiles
    str1 = sprintf('Processing image %d',i);
    disp(str1)
    imIn = double(imread(fullfile(inputDir,fileList(i).name)));
    indices = unique(imIn);
    % gala might have assigned more than 2 indices by mistake!
    % check, report and correct it here
    while(numel(indices)>2)
        numInd = numel(indices);
        str1 = sprintf('Number of indices found = %d',numInd);
        disp(str1)
        freq = zeros(numInd,1);
        for j=1:numInd
            freq(j) = sum(sum(imIn==indices(j)));
        end
        % replace the one with min freq with the next higher
        minF = min(freq);
        minj = find(freq==minF);
        if(numel(minj)>1)
            minj = minj(1);
        end
        otherjs = setdiff(indices,indices(minj));
        replacementInd = otherjs(1);    
        imIn(imIn==indices(minj)) = replacementInd;
        indices = unique(imIn);
    end
    imIn = imIn - min(min(imIn));
    imOut = uint8(imIn./max(max(imIn))).*255;
    % imBW = im2bw(imOut);
    % outFileName = fullfile(outputDir,sprintf('%03d.tif',i));
    outFileName = fullfile(outputDir,fileList(i).name);
    imwrite(imOut,outFileName,type);
end