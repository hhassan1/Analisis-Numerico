classdef test_deppresa < matlab.unittest.TestCase
    properties
        base_fun
        base_jac
        test_fun
        test_jac
    end
    properties (TestParameter)
        x0_1 = {30:300};
        x0_2 = {50:10:5000};
        a = {0:0.05:3};
        b = {0:0.05:1};
        c = {0:0.05:1};
        d = {0:0.05:5};
    end
    methods 
        function obj = test_deppresa()
            global folder_base
            global folder_user
            obj = obj@matlab.unittest.TestCase();
            old_folder = cd(folder_base);
            obj.base_fun = @funcdeppresa;
            obj.base_jac = @jacfuncdeppresa;
            cd(folder_user);
            obj.test_fun = @funcdeppresa;
            obj.test_jac = @jacfuncdeppresa;
            cd(old_folder);
        end
    end
    methods (Test, ParameterCombination='exhaustive')
        function testFunction(testCase, x0_1, x0_2, a, b, c, d)
            x0 = [x0_1;x0_2];
            par = [a,b,c,d];
            expected_value = feval(testCase.base_fun, 0, x0, par);
            actual_value = feval(testCase.test_fun, 0, x0, par);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
        function testJacobian(testCase, x0_1, x0_2, a, b, c, d)
            x0 = [x0_1;x0_2];
            par = [a,b,c,d];
            expected_value = feval(testCase.base_jac, 0, x0, par);
            actual_value = feval(testCase.test_jac, 0, x0, par);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
    end
end