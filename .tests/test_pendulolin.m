classdef test_pendulolin < unittestfunction
    methods 
        function obj = test_pendulolin(user_path, base_path)
            obj = obj@unittestfunction(user_path, base_path);
            obj.function_name = 'funcpendulolin';
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,2),2)
        par = num2cell(unifrnd(repmat([0,1,0,0],10,1),repmat([10,11,10,1],10,1)),2)
    end
end