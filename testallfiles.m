function show_all_files_in_dir( )
 % Find all files that match this regular expression:
 file_list = dir('*.jpg');
 posion_image_number = 0;
 for counter = 1 : length( file_list )
     fn = file_list(counter).name;
     possible = pipline_action(fn); % run main function and get graphs.
     fprintf('file %3d = %s\n', counter, fn );
     if possible >= 3 
         posion_image_number = posion_image_number+1;
     end
 end
 fprintf ("The number of images that contain posion IVY is : %d \n",posion_image_number);


end


function posion_leaf = pipline_action(fn)
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


    se3 = strel("rectangle",[32 32]);
    disjoinMask = imerode(disjoinMask,se3);
%     se2 = strel("rectangle",[13 13]);
%     disjoinMask = imdilate(disjoinMask,se2);
    


    [Bound,L,n,A] = bwboundaries(disjoinMask);
    imshow(disjoinMask); hold on;
    count_leaf = 0;
    for i=1 :n
        if nnz(A(:,i))>0
            disbound= Bound {i};
            [sbound,skip] = size(disbound);
            minx = min(disbound(:,2));
            maxx = max(disbound(:,2));

            miny = min(disbound(:,1));
            maxy = max(disbound(:,1));
            leaf_size_min = abs(maxy-miny)+abs(maxx-minx) >= 600;
            leaf_size_max = abs(maxy-miny)+abs(maxx-minx) <= 3500;
            leaf_max = max([abs(maxx-minx),abs(maxy-miny)]);
            leaf_min = min([abs(maxx-minx),abs(maxy-miny)]);
            leaf_propotion = 1.2 <= leaf_max/leaf_min


            area_size = sbound > 700;
            if  area_size && leaf_size_min && leaf_propotion
                plot(disbound(:,2),disbound(:,1),"cyan","lineWidth",3);
                count_leaf = count_leaf +1;
            end
            
        end
    end
    fprintf("number of leaf is : %d \n",count_leaf);
    posion_leaf = count_leaf;
%     imshow(disjoinMask);
end

