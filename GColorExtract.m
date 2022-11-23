function colorex = color_extract(im)
    
    im_r = im(:,:,1);
    im_g = im(:,:,2);
    im_b = im(:,:,3);
    im_gray = rgb2gray(im);
    % using the default level to test the image
    level = graythresh(im_g);
    disp(level);
    bi_im = imbinarize(im_g,level);
    colorex = bi_im;
    

end