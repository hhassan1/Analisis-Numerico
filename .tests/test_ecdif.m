classdef test_ecdif < unittestfunction
    methods 
        function obj = test_ecdif(user_path, base_path)
            obj = obj@unittestfunction(user_path, base_path);
            obj.function_name = 'funcecdif';
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,2),2)
        par = num2cell(unifrnd(0,0,10,1),2)
    end
end