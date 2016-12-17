classdef test_belza < matlab.unittest.TestCase
    properties
        base_fun
        base_jac
        test_fun
        test_jac
    end
    properties (TestParameter)
        x0_1 = {0:0.05:1};
        x0_2 = {0:0.05:1};
        x0_3 = {0:0.05:1};
        a = {2e4};
        b = {8e-4};
        g = {5e3};
        d = {0.75};
    end
    methods 
        function obj = test_belza()
            global folder_base
            global folder_user
            obj = obj@matlab.unittest.TestCase();
            old_folder = cd(folder_base);
            obj.base_fun = @funbelza;
            obj.base_jac = @jacfunbelza;
            cd(folder_user);
            obj.test_fun = @funbelza;
            obj.test_jac = @jacfunbelza;
            cd(old_folder);
        end
    end
    methods (Test, ParameterCombination='exhaustive')
        function testFunction(testCase, x0_1, x0_2, x0_3, a, b, g, d)
            x0 = [x0_1;x0_2;x0_3];
            par = [a,b,g,d];
            expected_value = feval(testCase.base_fun, 0, x0, par);
            actual_value = feval(testCase.test_fun, 0, x0, par);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
        function testJacobian(testCase, x0_1, x0_2, x0_3, a, b, g, d)
            x0 = [x0_1;x0_2;x0_3];
            par = [a,b,g,d];
            expected_value = feval(testCase.base_jac, 0, x0, par);
            actual_value = feval(testCase.test_jac, 0, x0, par);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
    end
end