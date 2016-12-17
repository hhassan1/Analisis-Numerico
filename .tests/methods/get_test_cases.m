function test = get_test_cases( method_name )
    old = cd('..\functions');
    tests = dir(['.\test_*' method_name(5:end) '.m'] ); tests = struct2cell(tests); tests = tests(1,:);
    for i = 1:length(tests)
        if ( eval([tests{i}(1:end-2) '.function_name']) == method_name)
            test = eval([tests{i}(1:end-2) '.testing_arguments()']);
            cd(old);
            return
        end
    end
    cd(old);
end

