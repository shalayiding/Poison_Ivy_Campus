function edgeex = edge(im)
    % break into different rgb channels 
    im_r = im(:,:,1);
    im_g = im(:,:,2);
    im_b = im(:,:,3);
    im_gray = rgb2gray(im);
    
    
%    im_g    = imfilter( im_g, fspecial('Gauss', 9, 0.9), 'same', 'repl' );
    

    im_result = edge(im_gray,'sobel');
    edgeex =im_result;
    pause(3);
end