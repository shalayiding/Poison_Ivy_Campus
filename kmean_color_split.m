function extract_color(im_data)
 im_in = im_data; %input image
 im_in = imresize(im_in, [300 500]);

 row = size(im_in,1);%row number of image
 col = size(im_in,2);%col number of image


 cluster = 6; % 6 clusters
 [idx] = imsegkmeans(im_in,cluster);
 plabel = reshape(idx,row,col); 
 rgb = repmat(plabel,[1 1 3]); % change pixel label to rgb label
 
%  for k = 1:cluster   % take each image out by cluster
%      color = im_in;
%      color(rgb ~= k) = 0; 
%      figure;
%      imshow(color);
%  end

 color = im_in;
 color(rgb ~= 2) = 0; 
        
 im_c = rgb2gray(color);
%     figure,imshow(im_c);
 im_c = imbinarize(im_c);
%   figure,imshow(im_c);
 se2 = strel("disk",2);
 se3 = strel("disk",2);

 bi_im = imerode(im_c,se3);
 bi_im = imdilate(im_c,se2);
 imshow(bi_im);
end

