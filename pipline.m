function pipline_action(fn)
    im =  imread(fn) ;
%       im = imread(fn);
%     kmean_color_split(im);
%     edgeex = edge_detect(im);
    colorex = GColorExtract(im);
    [gc,skip] = extract_green(im);
%       kmeancolor = kmean_extract(im);
%     
%     se2 = strel("disk",3);
%     se3 = strel("disk",2);
%     bi_im = imdilate(colorex,se2);
%     bi_im = imerode(colorex,se3);
    disjoinMask = colorex & gc;
    imshow(disjoinMask);
    pause(3);
end

