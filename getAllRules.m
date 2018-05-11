function pairs = getAllRules( inputMFs, outputMFs, x, y )
pairs = zeros(size(x,2),3);
    for i = 1:size(x,2) 
       [num, fire] = getMaxFireRuleId(inputMFs,x(i));
       pairs(i,1) = num;
       [num,fire] = getMaxFireRuleId(outputMFs,y(i));
       pairs(i,2) = num;
       pairs(i,3) = fire; % third column is membership function value of output
    end

end

