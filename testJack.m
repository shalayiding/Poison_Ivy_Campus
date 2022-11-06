im = im2double(imread("IMG_3127.JPG")) ;
% im = im2double( imread("IMG_3108.JPG") );
im = imresize(im, [300 500]);

im_r = im(:,:,1);
im_g = im(:,:,2);
im_b = im(:,:,3);
    im_g    = imfilter( im_g, fspecial('Gauss', 9, 0.9), 'same', 'repl' );


    f_sobel_dIdy    = [ -1 -2 -1 ; 
                         0  0  0 ; 
                        +1 +2 +1 ] /8;
    f_sobel_dIdx    = f_sobel_dIdy.';

    dIdy            = imfilter( im_g, f_sobel_dIdy, 'same', 'repl' );
    dIdx            = imfilter( im_g, f_sobel_dIdx, 'same', 'repl' );
    dImag           = sqrt( dIdy.^2  + dIdx.^2 );
figure,imshow(dImag);

figure,histogram(dImag);

for c = 1:size(dImag,1)
    for n = 1:size(dImag,2)
        if dImag(c,n) < 0.048
            dImag(c,n) = 0;
        else
            dImag(c,n) = 1;
        end

    end
end
imshow(dImag);
i = histogram(dImg);

% 
% figure,imshow(bi_im);

% 
% 
% im_gray = rgb2gray(im);
% 
% 
% 
% 
% %bwboundaries return the bound and number of 
[Bound,L,n,A] = bwboundaries(dImag); 
figure; imshow(dImag); hold on; 

        for i = 1:n 
        % if it is greater than zero means it is possibly a dice 
            if (nnz(A(:,i)) > 0) 
                DiceBound = Bound{i}; 
                if 400<=length(DiceBound)

                plot(DiceBound(:,2),DiceBound(:,1),"cyan","LineWidth",3); % start to plot the diceboun
                end
            end
        end