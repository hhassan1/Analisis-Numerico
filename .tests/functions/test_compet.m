classdef test_compet < unittestfunction
    properties (Constant)
        function_name = 'funccompet';
    end
    methods
        function obj = test_compet(u,b)
            obj = obj@unittestfunction(u,b);
        end
    end
    methods (Static)
        function args = testing_arguments()
            args = java.util.LinkedList;
            aux = java.util.Hashtable;
            aux.put('x0',unifrnd(0,100,2,1));
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',100);
            aux.put('par',[1,1,1,0.2,0.4,0.0001]);
            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',unifrnd(0,100,2,1));
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',400);
            aux.put('par',[1,1,1,0.2,0.4,0.0001]);
            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',unifrnd(0,100,2,1));
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',1000);
            aux.put('par',[1,1,1,0.2,0.4,0.0001]);
            args.add(aux);
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,2),2)
        par = num2cell(unifrnd(0,repmat([1,1,1,1,1,0.01],10,1)),2)
    end
end