classdef test_lorenz < unittestfunction
    properties (Constant)
        function_name = 'funclorenz';
    end
    methods
        function obj = test_lorenz(u,b)
            obj = obj@unittestfunction(u,b);
        end
    end
    methods (Static)
        function args = testing_arguments()
            args = java.util.LinkedList();
            aux = java.util.Hashtable;
            aux.put('x0',[0;5;75]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',100);
            aux.put('par',[0.1,10,8/3]);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[0;5;75]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',400);
            aux.put('par',[13.962,10,8/3]);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[0;5;75]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',1000);
            aux.put('par',[100,10,8/3]);

            args.add(aux);
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,3),2)
        par = num2cell(unifrnd(0,repmat([10,100,1],10,1)),2)
    end
end