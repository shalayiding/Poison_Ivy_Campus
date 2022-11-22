im = im2double(imread("IMG_3108.JPG")) ;
% im = im2double( imread("IMG_3108.JPG") );
im_gray = rgb2gray(im);
im = adapthisteq(im_gray);
 
 im = imsharpen(im,'Radius',15,'Amount',20);
 figure,imshow(im);
im = imbinarize(im);

se3 = strel("disk",1);
%se3 = strel("disk",10);
% bi_im = imdilate(im,se2);
bi_im = imdilate(im,se3);
 figure,imshow(bi_im);


% im_edge = edge(im,'sobel');
% 
% figure,imshow(im_edge);
%    
% im_edge = edge(im_gray,'canny',0.1,'nothinning'); %set efdge to 0.15
% im_r = im(:,:,1);
% im_g = im(:,:,2);
% im_b = im(:,:,3);
im_g    = imfilter( im, fspecial('Gauss', 9, 0.9), 'same', 'repl' );