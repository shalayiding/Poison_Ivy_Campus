im = im2double( imread("IMG_3127.JPG") );
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


%bwboundaries return the bound and number of 
[Bound,L,n,A] = bwboundaries(bi_im); 
figure; imshow(bi_im); hold on; 

        for i = 1:n 
        % if it is greater than zero means it is possibly a dice 
            if (nnz(A(:,i)) > 0) 
                DiceBound = Bound{i}; 
                if 400<=length(DiceBound)
                
                plot(DiceBound(:,2),DiceBound(:,1),"cyan","LineWidth",3); % start to plot the diceboun
                end
            end   
        end 
    







