classdef unittestfunction < matlab.unittest.TestCase
    properties (Access = protected)
        user_path
        base_path
        function_name
    end
    methods 
        function obj = unittestfunction(user_path, base_path)
            obj = obj@matlab.unittest.TestCase();
            obj.user_path = user_path;
            obj.base_path = base_path;
        end
    end
    methods (Test, ParameterCombination='sequential')
        function testFunction(testCase, t, x, par)
            old = cd(testCase.user_path);
            expected_value = feval(testCase.function_name, t, x, par);
            cd(testCase.base_path);
            actual_value = feval(testCase.function_name, t, x, par);
            cd(old);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
        function testJacobian(testCase, t, x, par)
            old = cd(testCase.user_path);
            expected_value = feval(['jac' testCase.function_name], t, x, par);
            cd(testCase.base_path);
            actual_value = feval(['jac' testCase.function_name], t, x, par);
            cd(old);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
    end
end