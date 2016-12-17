classdef test_rigida < unittestfunction
    properties (Constant)
        function_name = 'funrigida';
    end
    methods
        function obj = test_rigida(u,b)
            obj = obj@unittestfunction(u,b);
        end
    end
    methods (Static)
        function args = testing_arguments()
            args = java.util.LinkedList();
            aux = java.util.Hashtable;
            aux.put('x0',[0]);
            aux.put('t0',0);
            aux.put('tfin',pi/2);
            aux.put('N',100);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[0]);
            aux.put('t0',0);
            aux.put('tfin',pi/2);
            aux.put('N',400);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[0]);
            aux.put('t0',0);
            aux.put('tfin',pi/2);
            aux.put('N',1000);

            args.add(aux);
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,pi,10,1),2)
        x = num2cell(unifrnd(0,1,10,1),2)
        par = num2cell(unifrnd(0,0,10,1),2)
    end
end