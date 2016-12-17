files = dir('.\');
subFolders = files([files.isdir]);
A = struct2cell(subFolders);
B = A(1,~strncmpi('.',A(1,:),1));
for k = 1 : length(B)
    results = run_tests(B{k}, 'functions');
    table(results)
    results = run_tests(B{k}, 'methods');
    table(results);
end