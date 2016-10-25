function filteredPix = filterImagePixelsRC(rcvec,sizeR,sizeC)

% remove all the pixels that have indices beyond the image margins
% [0,0,sizeR,sizeC]
% output is a list of pixelInds

% Inputs:
% rcvec: col1 r, col2 c

r = rcvec(:,1);
c = rcvec(:,2);

% pick the rows that have 0<r<=sizeR && 0<c<=sizeC
rdIndsIn = (r>0) & (c>0) & (r<=sizeR) & (c<=sizeC);

filteredPix = sub2ind([sizeR sizeC],r(rdIndsIn),c(rdIndsIn));
