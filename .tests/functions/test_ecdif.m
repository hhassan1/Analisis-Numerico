classdef test_ecdif < unittestfunction
    properties (Constant)
        function_name = 'funcecdif';
    end
    methods
        function obj = test_ecdif(u,b)
            obj = obj@unittestfunction(u,b);
        end
    end
    methods (Static)
        function args = testing_arguments()
            args = java.util.LinkedList();
            aux = java.util.Hashtable;
            aux.put('x0',[1/3;1/3]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',100);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[3,1]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',400);

            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[3,1]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',1000);

            args.add(aux);
        end
    end
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,2),2)
        par = num2cell(unifrnd(0,0,10,1),2)
    end
end