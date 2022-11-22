function show_all_files_in_dir( )
 % Find all files that match this regular expression:
 file_list = dir('*.jpg');
 for counter = 1 : length( file_list )
     fn = file_list(counter).name;
     pipline(fn); % run main function and get graphs.
     fprintf('file %3d = %s\n', counter, fn );
 end
end