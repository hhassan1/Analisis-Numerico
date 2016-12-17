function results = run_tests( name )
    old = cd;
    cd('.\.tests');
    tests = dir('.\test_*.m'); tests = struct2cell(tests); tests = tests(1,:);
    for i = 1:length(tests)
        B = tests{i};
        tests{i} = B(1:end-2);
    end
    results = [];
    %results = mat2cell(zeros(1,length(tests)));
    for i = 1:length(tests)
        X = [tests{i} '(''' [old '\' name] ''',''' [old '\.base'] ''')'];
        ts = eval(X);
        AUX = ts.run();
        results = [results AUX];
    end
    cd(old) 
end