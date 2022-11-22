

function kmeancolor = kmean_extract_f(im)
  
%     im_r = im(:,:,1);
%     im_g = im(:,:,2);
%     im_b = im(:,:,3);
%     im_gray = rgb2gray(im);
    row = size(im,1);%row number of image
    col = size(im,2);%col number of image
    cluster = 6; % 6 clusters
    [idx] = imsegkmeans(im,cluster);
    plabel = reshape(idx,row,col); 
    rgb = repmat(plabel,[1 1 3]); % change pixel label to rgb label
    color = im;
    color(rgb ~= 2) = 0;
    im = rgb2gray(color);
    im = imbinarize(im);
    imshow(im);
    kmeancolor = im;
end