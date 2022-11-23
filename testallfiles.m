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
    im_in =  imread(fn) ;
    im_in = imresize(im_in,[2000 3000]);
    flag = centerCropWindow2d(size(im_in),[1500 2000])
    im = imcrop(im_in,flag);
%     im = imcrop(im_in,[recx recy recx recy]);
%       im = imread(fn);
%     kmean_color_split(im);

    colorex = GColorExtract(im);
    [gc,skip] = extract_green(im);
%       kmeancolor = kmean_extract(im);
%     

    disjoinMask = colorex & gc;
%     edgeex = edge_detect(fn);


%     se3 = strel("disk",25);
%     disjoinMask = imerode(disjoinMask,se3);
%         se2 = strel("disk",15);
%     disjoinMask = imdilate(disjoinMask,se2);
    


    [Bound,L,n,A] = bwboundaries(disjoinMask);
    imshow(disjoinMask); hold on;
    for i=1 :n
        if nnz(A(:,i))>0
            disbound= Bound {i};
            
            plot(disbound(:,2),disbound(:,1),"cyan","lineWidth",3);
        end
    end



%     imshow(disjoinMask);
    pause(3);
end

