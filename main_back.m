
im = im2double( imread("IMG_3127.JPG") );
% im = imresize(im, [250 300]);
im= imcrop(im,[100 100 500 600]);

% break into different rgb channels 
im_r = im(:,:,1);
im_g = im(:,:,2);
im_b = im(:,:,3);
im_gray = rgb2gray(im);

imshow(im);
exit();

%  im_g    = imfilter( im_g, fspecial('Gauss', 9, 0.9), 'same', 'repl' );
% 
% 
%     f_sobel_dIdy    = [ -1 -2 -1 ; 
%                          0  0  0 ; 
%                         +1 +2 +1 ] /8;
%     f_sobel_dIdx    = f_sobel_dIdy.';
% 
%     dIdy            = imfilter( im_g, f_sobel_dIdy, 'same', 'repl' );
%     dIdx            = imfilter( im_g, f_sobel_dIdx, 'same', 'repl' );
%     dImag           = sqrt( dIdy.^2  + dIdx.^2 );
% for c = 1:size(dImag,1)
%     for l = 1:size(dImag,2)
%         if dImag(c,l) < 0.048
%             dImag(c,l) = 0;
%         else
%             dImag(c,l) = 1;
%         end
%         
%     end
% end
% imshow(dImag);
% pause(5);


% using the default level to test the image
level = graythresh(im_g);
disp(level);
bi_im = imbinarize(im_g,level );
imshow(bi_im);




% for r = 1:size(bi_im,1)
%     for c = 1:size(bi_im,2)
% 
%         % find the min distance 
%         min_val = 20000;
%         for ir = r: r+1
%             for ic = c : c+1
%                 if ir <size(bi_im,1) &&  ic < size(bi_im,2) && dImag(ir,ic) == 1
%                     distance = abs(ir-r)+abs(ic-c);
%                     min(distance,min_val);
%                     disp(distance);
%                 else
%                     min_val = 20000
%                 end
%             end
%         end
%         if min_val == 20000
%             bi_im(r,c) = 1;
%         else 
%             bi_im(r,c) = 0;
%         end
% 
%     end
% end

% imshow(bi_im);

% bi_im = dImag;

se2 = strel("disk",5);
se3 = strel("disk",10);
bi_im = imdilate(bi_im,se2);
bi_im = imerode(bi_im,se3);

% imshow(bi_im);
% close to leaf color 



%bwboundaries return the bound and number of 
[Bound,L,n,A] = bwboundaries(bi_im); 
figure; imshow(bi_im); hold on; 

for i = 1:n 
% if it is greater than zero means it is possibly a dice 
%     if (nnz(A(:,i)) > 0) 
        DiceBound = Bound{i}; 
%         if 100<=length(DiceBound)       
        plot(DiceBound(:,2),DiceBound(:,1),"cyan","LineWidth",3); % start to plot the diceboun
%         end
%     end   
end 
    







