classdef test_duffing < unittestfunction
    properties (Constant)
        function_name = 'funcduffing';
    end
    methods
        function obj = test_duffing(u,b)
            obj = obj@unittestfunction(u,b);
        end
    end
    methods (Static)
        function args = testing_arguments()
            args = java.util.LinkedList();
            aux = java.util.Hashtable;
            aux.put('x0',[1,0]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',100);
            aux.put('par',[0]);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[0,0]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',100);
            aux.put('par',[0]);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[-1,0]);
            aux.put('t0',0);
            aux.put('tfin',100);
            aux.put('N',100);
            aux.put('par',[0]);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[1,0]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',100);
            aux.put('par',[1]);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[0,0]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',100);
            aux.put('par',[1]);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[-1,0]);
            aux.put('t0',0);
            aux.put('tfin',100);
            aux.put('N',100);
            aux.put('par',[1]);

            args.add(aux);
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,2),2)
        par = num2cell(unifrnd(0,1,10,1),2)
    end
end