classdef test_belza < unittestfunction
    properties (Constant)
        function_name = 'funbelza';
    end
    methods
        function obj = test_belza(u,b)
            obj = obj@unittestfunction(u,b);
        end
    end
    methods (Static)
        function args = testing_arguments()
            args = java.util.LinkedList;
            aux = java.util.Hashtable;
            aux.put('x0',[0.25;0.75;0.25]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',100);
            aux.put('par',[2e4,8e-4,5e3,0.75]);            
            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[0.25;0.75;0.25]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',400);
            aux.put('par',[2e4,8e-4,5e3,0.75]);
            args.add(aux);
            aux = java.util.Hashtable;
            aux.put('x0',[0.25;0.75;0.25]);
            aux.put('t0',0);
            aux.put('tfin',10);
            aux.put('N',1000);
            aux.put('par',[2e4,8e-4,5e3,0.75]);
            args.add(aux);
        end
    end
    
    properties (TestParameter)
        t = num2cell(unifrnd(0,1,10,1),2)
        x = num2cell(unifrnd(0,1,10,3),2)
        par = num2cell(unifrnd(0,repmat([2e4,8e-4,5e3,1],10,1)),2)
    end
end