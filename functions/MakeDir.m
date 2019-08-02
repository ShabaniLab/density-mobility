function MakeDir(dirname)
    if ~exist(dirname, 'dir')
        mkdir(dirname);
    end
end