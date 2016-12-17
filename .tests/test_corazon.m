classdef test_corazon < matlab.unittest.TestCase
    properties
        base_fun
        base_jac
        test_fun
        test_jac
    end
    properties (TestParameter)
        t = {0:0.1:10}
        x0_1 = {0:0.05:1}
        x0_2 = {0:0.1:2}
    end
    methods 
        function obj = test_corazon()
            global folder_base
            global folder_user
            obj = obj@matlab.unittest.TestCase();
            old_folder = cd(folder_base);
            obj.base_fun = @funccorazon;
            obj.base_jac = @jacfunccorazon;
            cd(folder_user);
            obj.test_fun = @funccorazon;
            obj.test_jac = @jacfunccorazon;
            cd(old_folder);
        end
    end
    methods (Test, ParameterCombination='exhaustive')
        function testFunction(testCase, t, x0_1, x0_2)
            x0 = [x0_1;x0_2];
            expected_value = feval(testCase.base_fun, t, x0, []);
            actual_value = feval(testCase.test_fun, t, x0, []);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
        function testJacobian(testCase, t, x0_1, x0_2)
            x0 = [x0_1;x0_2];
            expected_value = feval(testCase.base_jac, t, x0, []);
            actual_value = feval(testCase.test_jac, t, x0, []);
            testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps)
        end
    end
end