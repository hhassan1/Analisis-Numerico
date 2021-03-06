classdef test_methods < matlab.unittest.TestCase
    properties (Access = protected)
        user_path
        base_path
        figure_state
    end
    methods 
        function obj = test_methods(user_path, base_path)
            obj = obj@matlab.unittest.TestCase();
            obj.user_path = user_path;
            obj.base_path = base_path;
        end
    end
    methods (TestMethodSetup)
        function disableFigures(testCase)
            testCase.figure_state = get(groot,'defaultFigureVisible');
            set(groot,'defaultFigureVisible','off')
        end
    end
    methods (TestMethodTeardown)
        function teardownFigures(testCase)
            set(groot,'defaultFigureVisible',testCase.figure_state)
        end
    end
    properties (TestParameter)
        method = {'funbelza';'funccompet';'funcdeppresa'; 'funcduffing'; 
                  'funcecdif'; 'funclorenz'; 'funcpendulo'; 'funcpendulolin';
                  'funcvanderpol'; 'funrigida'};
        test_name = {'testmiab4';'testmiab4am3';'testmieuler'; 'testmieulertr'; 
                  'testmimilne'; 'testmimilsimp'; 'testmirk4';
                  'testmitrap'};
    end
    methods (Test)
        function testMethod(testCase, method, test_name)
            par = [];
            itmax = 100;
            old = cd(testCase.user_path);
            user_fun = str2func(method);
            user_jac = str2func(['jac' method]);
            cd(testCase.base_path);
            base_fun = str2func(method);
            base_jac = str2func(['jac' method]);
            cd(old);
            a1 = get_test_cases(method);
            cd(old);
            iterator = a1.iterator();
            while iterator.hasNext()
                arguments = iterator.next();
                it = arguments.entrySet().iterator();
                while it.hasNext()
                    arg = it.next();
                    assignin('base', arg.getKey(), arg.getValue());
                end
                fun = base_fun;
                jac = base_jac;
                run([testCase.base_path '\' test_name])
                expected_value = [t; u];
                clear t;
                clear u;
                fun = user_fun;
                jac = user_jac;
                run([testCase.user_path '\' test_name])
                actual_value = [t; u];
                clear t;
                clear u;
                testCase.verifyEqual(actual_value, expected_value, 'RelTol', eps);
            end
        end
    end
end
