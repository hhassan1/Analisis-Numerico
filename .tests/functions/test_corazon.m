classdef test_corazon < unittestfunction
    properties (Constant)
        function_name = 'funccorazon';
    end
    methods
        function obj = test_corazon(u,b)
            obj = obj@unittestfunction(u,b);
        end
    end
    methods (Static)
        function args = testing_arguments()
            args = java.util.LinkedList();
            aux = java.util.Hashtable;
            aux.put('x0',[0;2]);
            aux.put('t0',0);
            aux.put('tfin',2*pi);
            aux.put('N',100);
            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[0;2]);
            aux.put('t0',0);
            aux.put('tfin',2*pi);
            aux.put('N',400);
            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[0;2]);
            aux.put('t0',0);
            aux.put('tfin',2*pi);
            aux.put('N',1000);
            args.add(aux);
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,repmat([1,2],10,1)),2)
        par = num2cell(unifrnd(0,ones(10,1)),2)
    end
end