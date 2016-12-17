classdef test_corazon < unittestfunction
    methods 
        function obj = test_corazon(user_path, base_path)
            obj = obj@unittestfunction(user_path, base_path);
            obj.function_name = 'funccorazon';
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,repmat([1,2],10,1)),2)
        par = num2cell(unifrnd(0,ones(10,1)),2)
    end
end