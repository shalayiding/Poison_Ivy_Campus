function pipline_action(fn)
    im = im2double( imread(fn) );
%     kmean_color_split(im);
%     edgeex = edge_detect(im);
    colorex = GColorExtract(im);
    
    se2 = strel("disk",5);
    se3 = strel("disk",10);
    bi_im = imdilate(colorex,se2);
    bi_im = imerode(colorex,se3);
    imshow(bi_im);
end

