function NIRx_ChangeFileName(pathRootFolder,newFileName)
% Renameing the NIRS file recorded by NIRx
% pathRootFolder : path to the data folder 
% newFileName    : new file name.
% Author: Majid (majidkhalili89@aim.com)

% Loading the Input File
    
    % check if the path is empty get the new path
    if ~exist('pathRootFolder', 'var') || ~exist(pathRootFolder, 'dir')
        pathRootFolder = uigetdir;
    end
    
    configFile = '';
    allFiles = dir(pathRootFolder);
    
    for i = 1 : numel(allFiles)
        if contains(allFiles(i).name, '_config.txt') 
            configFile = allFiles(i).name;
        end
    end
    
    % if the input path does not include any config file
    if isempty(configFile)
        error('The selected folder does not contain any NIRS config file.');
        return;
    end
% Getting new file name
    if ~exist('newFileName', 'var')
        newFileName = string(inputdlg('New File Name:'));
        if isempty(newFileName)
            newFileName = 'NewFileName' ;
        end
    end
    
    pathNewFiles = strcat(pathRootFolder, filesep, newFileName);
    
    try
        if ~exist(pathNewFiles, 'dir')
           mkdir(pathNewFiles);
        end
    catch
        error('You dont have permision to creat folders. Run your Matlab as an administrator and try again.');
        return;
    end

% Writing new files
    oldFileName = extractBefore(configFile, '_config.txt');
    for i = 1 : numel(allFiles)
        tmpNewFile = {};
        linenumber = 0;
        if allFiles(i).isdir == 0

            tmpnewfilename = strrep(allFiles(i).name, oldFileName, newFileName);

            % Check if it is not mat file read it line by line
            if ~contains(allFiles(i).name, '.mat')
                fid = fopen(fullfile(allFiles(i).folder, allFiles(i).name));
                tline  = fgetl(fid);
                ntline = strrep(tline, oldFileName, newFileName);
                linenumber = linenumber + 1;
                tmpNewFile{linenumber} = ntline;

                while ischar(tline)
                    tline = fgetl(fid);
                    ntline = strrep(tline, oldFileName, newFileName);
                    linenumber = linenumber + 1;
                    tmpNewFile{linenumber} = ntline;
                end
                fclose(fid);

                % Write to new file
                fid = fopen(fullfile(pathNewFiles, tmpnewfilename), 'wt');
                fprintf(fid, '%s\n', tmpNewFile{:});
                fclose(fid);
            else
                disp(allFiles(i).name);
            end
        end
    end

end