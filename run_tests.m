function results = run_tests( name, type)
    old = cd;
    cd(['.\.tests\' type]);
    tests = dir(['.\test_*.m']); tests = struct2cell(tests); tests = tests(1,:);
    results = [];
    if(strcmp(type,'functions'))
        for i = 1:length(tests)
            ts = feval(tests{i}(1:end-2),[old '\' name], [old '\.base']);
            results = [results ts.run()];
        end
    elseif(strcmp(type,'methods'))
        for i = 1:length(tests)
            ts = feval(tests{i}(1:end-2),[old '\' name], [old '\.base']);
            results = [results ts.run()];
        end
    end
    cd(old); 
end