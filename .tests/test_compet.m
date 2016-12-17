classdef test_compet < unittestfunction
    methods 
        function obj = test_compet(user_path, base_path)
            obj = obj@unittestfunction(user_path, base_path);
            obj.function_name = 'funccompet';
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,2),2)
        par = num2cell(unifrnd(0,repmat([1,1,1,1,1,0.01],10,1)),2)
    end
end