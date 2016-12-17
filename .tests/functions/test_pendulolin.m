classdef test_pendulolin < unittestfunction
    properties (Constant)
        function_name = 'funcpendulolin';
    end
    methods
        function obj = test_pendulolin(u,b)
            obj = obj@unittestfunction(u,b);
        end
    end
    methods (Static)
        function args = testing_arguments()
            args = java.util.LinkedList();
            aux = java.util.Hashtable;
            aux.put('x0',unifrnd(-pi,pi,2,1));
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',100);
            aux.put('par',[1,9.8,0]);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',unifrnd(-pi,pi,2,1));
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',400);
            aux.put('par',[1,9.8,0.25]);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',unifrnd(-pi,pi,2,1));
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',1000);
            aux.put('par',[1,9.8,1/2]);

            args.add(aux);
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,2),2)
        par = num2cell(unifrnd(repmat([0,1,0,0],10,1),repmat([10,11,10,1],10,1)),2)
    end
end