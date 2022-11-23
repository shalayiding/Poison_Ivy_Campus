function edgeex = edge(im)
%     im_in = im2double(imread("IMG_3108.JPG"));
    im_in = im2double(imread(im));
    im_g = im_in(:,:,2);

    im_g = imresize(im_g,[2000 3000]);
    flag = centerCropWindow2d(size(im_g),[1500 2000])
    im_g = imcrop(im_g,flag);


    im_gray = rgb2gray(im_in);
    im_g    = imfilter( im_g, fspecial('Gauss', 9, 0.9), 'same', 'repl' );


    f_sobel_dIdy    = [ -1 -2 -1 ; 
                         0  0  0 ; 
                        +1 +2 +1 ] /4;
    f_sobel_dIdx    = f_sobel_dIdy.';

    dIdy            = imfilter( im_g, f_sobel_dIdy, 'same', 'repl' );
    dIdx            = imfilter( im_g, f_sobel_dIdx, 'same', 'repl' );
    dImag           = sqrt( dIdy.^2  + dIdx.^2 );
for c = 1:size(dImag,1)
    for l = 1:size(dImag,2)
        if dImag(c,l) < 0.05
            dImag(c,l) = 0;
        else
            dImag(c,l) = 1;
        end

    end
end
edgeex = dImag;
   
end

