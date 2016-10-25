function nh4pixels = get4nhpixels(blob,sizeR,sizeC)

% blob is a list of pixelInds
% nh4 is the list of all 4neighborhood pixels in blob
% blob can also contain multiple blobs. Then the method returns all
% 4nhpixels for all the blobs
% contains only the pixels between the original image boundaries

[r,c] = ind2sub([sizeR,sizeC],blob);

nh1 = [r-1,c];
nh2 = [r+1,c];
nh3 = [r,c-1];
nh4 = [r,c+1];

nh4pixels = filterImagePixelsRC([nh1;nh2;nh3;nh4],sizeR,sizeC);

