classdef test_duffing < matlab.unittest.TestCase
    properties
        base_fun
        base_jac
        test_fun
        test_jac
    end
    properties (TestParameter)
        x0_1 = {0:0.05:1};
        x0_2 = {0:0.05:1};
        a = {0:0.01:1};
    end
    methods 
        function obj = test_duffing()
            global folder_base
            global folder_user
            obj = obj@matlab.unittest.TestCase();
            old_folder = cd(folder_base);
            obj.base_fun = @funcduffing;
            obj.base_jac = @jacfuncduffing;
            cd(folder_user);
            obj.test_fun = @funcduffing;
            obj.test_jac = @jacfuncduffing;
            cd(old_folder);
        end
    end
    methods (Test, ParameterCombination='exhaustive')
        function testFunction(testCase, x0_1, x0_2, a)
            x0 = [x0_1;x0_2];
            par = [a];
            expected_value = feval(testCase.base_fun, 0, x0, par);
            actual_value = feval(testCase.test_fun, 0, x0, par);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
        function testJacobian(testCase, x0_1, x0_2, a)
            x0 = [x0_1;x0_2];
            par = [a];
            expected_value = feval(testCase.base_jac, 0, x0, par);
            actual_value = feval(testCase.test_jac, 0, x0, par);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
    end
end