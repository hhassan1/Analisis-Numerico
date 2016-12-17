classdef test_deppresa < unittestfunction
    properties (Constant)
        function_name = 'funcdeppresa';
    end
    methods
        function obj = test_deppresa(u,b)
            obj = obj@unittestfunction(u,b);
        end
    end
    methods (Static)
        function args = testing_arguments()
            args = java.util.LinkedList();
            aux = java.util.Hashtable;
            aux.put('x0',unifrnd(eps,10000,2,1));
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',100);
            aux.put('par',[1,1,1,2]);
            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',unifrnd(eps,10000,2,1));
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',100);
            aux.put('par',[3,0.2,0.6,5]);
            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[30, 50]);
            aux.put('t0',0);
            aux.put('tfin',100);
            aux.put('N',400);
            aux.put('par',[0.4,0.01,0.3,0.005]);
            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[100, 5000]);
            aux.put('t0',0);
            aux.put('tfin',100);
            aux.put('N',1000);
            aux.put('par',[0.4,0.01,0.3,0.005]);
            args.add(aux);
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(repmat([30,50],10,1),repmat([300,5000],10,1)),2)
        par = num2cell(unifrnd(0,repmat([3,1,1,5],10,1)),2)
    end
end