% im = im2double(imread("IMG_3108.JPG")) ;
% im = im2double( imread("IMG_3108.JPG") );


 im_in =imread("IMG_3212.JPG"); %input image
 row = size(im_in,1);%row number of image
 col = size(im_in,2);%col number of image
 
 cluster = 6; % 6 clusters
 [idx] = imsegkmeans(im_in,cluster);
 plabel = reshape(idx,row,col); 
 rgb = repmat(plabel,[1 1 3]); % change pixel label to rgb label
 
 for k = 1:cluster   % take each image out by cluster
     color = im_in;
     color(rgb ~= k) = 0; 
     figure;
     imshow(color);
 end



% im_gray = rgb2gray(im);
% im = adapthisteq(im_gray);
%
%  im = imsharpen(im,'Radius',15,'Amount',20);
%  figure,imshow(im);
% im = imbinarize(im);
% 
% se3 = strel("disk",1);
% %se3 = strel("disk",10);
% % bi_im = imdilate(im,se2);
% bi_im = imdilate(im,se3);
%  figure,imshow(bi_im);
% 
% 
% % im_edge = edge(im,'sobel');
% % 
% % figure,imshow(im_edge);
% %
% % im_edge = edge(im_gray,'canny',0.1,'nothinning'); %set efdge to 0.15
% % im_r = im(:,:,1);
% % im_g = im(:,:,2);
% % im_b = im(:,:,3);
% im_g    = imfilter( im, fspecial('Gauss', 9, 0.9), 'same', 'repl' );