im = im2double( imread("IMG_3108.JPG") );
im = imresize(im, [300 500]);


% break into different rgb channels 
im_r = im(:,:,1);
im_g = im(:,:,2);
im_b = im(:,:,3);
im_gray = rgb2gray(im);


% using the default level to test the image
level = graythresh(im_g);
disp(level);
bi_im = imbinarize(im_gray,level);
imshowpair(im,bi_im,'montage');
