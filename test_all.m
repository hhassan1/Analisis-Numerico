% Get a list of all files and folders in this folder.
files = dir('.\');
subFolders = files([files.isdir]);
A = struct2cell(subFolders);
B = A(1,~strncmpi('.',A(1,:),1));
% Print folder names to command window.
for k = 1 : length(B)
	B{k};
end