classdef test_deppresa < unittestfunction
    methods 
        function obj = test_deppresa(user_path, base_path)
            obj = obj@unittestfunction(user_path, base_path);
            obj.function_name = 'funcdeppresa';
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(repmat([30,50],10,1),repmat([300,5000],10,1)),2)
        par = num2cell(unifrnd(0,repmat([3,1,1,5],10,1)),2)
    end
end