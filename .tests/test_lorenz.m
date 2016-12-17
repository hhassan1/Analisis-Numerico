classdef test_lorenz < unittestfunction
    methods 
        function obj = test_lorenz(user_path, base_path)
            obj = obj@unittestfunction(user_path, base_path);
            obj.function_name = 'funclorenz';
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,3),2)
        par = num2cell(unifrnd(0,repmat([10,100,1],10,1)),2)
    end
end