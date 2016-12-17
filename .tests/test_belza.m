classdef test_belza < unittestfunction
    methods 
        function obj = test_belza(user_path, base_path)
            obj = obj@unittestfunction(user_path, base_path);
            obj.function_name = 'funbelza';
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,3),2)
        par = num2cell(unifrnd(0,repmat([2e4,8e-4,5e3,1],10,1)),2)
    end
end