classdef test_lorenz < matlab.unittest.TestCase
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
        sigma = {0:0.5:10};
        ro = {0:5:100};
        b = {0:0.05:1};
    end
    methods 
        function obj = test_lorenz()
            global folder_base
            global folder_user
            obj = obj@matlab.unittest.TestCase();
            old_folder = cd(folder_base);
            obj.base_fun = @funclorenz;
            obj.base_jac = @jacfunclorenz;
            cd(folder_user);
            obj.test_fun = @funclorenz;
            obj.test_jac = @jacfunclorenz;
            cd(old_folder);
        end
    end
    methods (Test, ParameterCombination='exhaustive')
        function testFunction(testCase, x0_1, x0_2, x0_3, sigma, ro, b)
            x0 = [x0_1;x0_2;x0_3];
            par = [sigma,ro,b];
            expected_value = feval(testCase.base_fun, 0, x0, par);
            actual_value = feval(testCase.test_fun, 0, x0, par);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
        function testJacobian(testCase, x0_1, x0_2, x0_3, sigma, ro, b)
            x0 = [x0_1;x0_2;x0_3];
            par = [sigma,ro,b];
            expected_value = feval(testCase.base_jac, 0, x0, par);
            actual_value = feval(testCase.test_jac, 0, x0, par);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
    end
end