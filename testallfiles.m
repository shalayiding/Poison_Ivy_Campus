function show_all_files_in_dir( )
 % Find all files that match this regular expression:
 file_list = dir('*.jpg');
 for counter = 1 : length( file_list )
     fn = file_list(counter).name;
     pipline_action(fn); % run main function and get graphs.
     fprintf('file %3d = %s\n', counter, fn );
 end
end


function pipline_action(fn)
    im =  imread(fn) ;
%       im = imread(fn);
%     kmean_color_split(im);

    colorex = GColorExtract(im);
    [gc,skip] = extract_green(im);
%       kmeancolor = kmean_extract(im);
%     
%     se2 = strel("disk",3);
%     se3 = strel("disk",2);
%     bi_im = imdilate(colorex,se2);
%     bi_im = imerode(colorex,se3);
    disjoinMask = colorex & gc;
%     edgeex = edge_detect(disjoinMask);
    imshow(disjoinMask);
    pause(3);
end

