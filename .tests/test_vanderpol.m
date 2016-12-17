classdef test_vanderpol < unittestfunction
    methods 
        function obj = test_vanderpol(user_path, base_path)
            obj = obj@unittestfunction(user_path, base_path);
            obj.function_name = 'funcvanderpol';
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,2),2)
        par = num2cell(unifrnd(repmat([1,-1],10,1),repmat([10,1],10,1)),2)
    end
end