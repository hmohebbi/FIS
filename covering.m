function MF = covering( hitNumbers, MF, numberOfPartitions )
%cover area that it rule not exist

missNumbers = missRuleNumbers( hitNumbers, numberOfPartitions );
if isempty(missNumbers)
    return
end

for i = 1:size(missNumbers,2)
    
    prev = max(hitNumbers(hitNumbers < missNumbers(i)));
    next = min(hitNumbers(hitNumbers > missNumbers(i)));
    if isempty(prev)
        prev = 1;
    end
    if isempty(next)
        next = numberOfPartitions;
    end
    % change b and c points of previous and next rules of miss rule.
    % 1 indicate to a and 2 -> b and 3 -> c
    if missNumbers(i) ~= 1
        MF(prev,3) = MF(next,2);
    end
    if missNumbers(i) ~= numberOfPartitions
        MF(next,1) = MF(prev,2);
    end
    
end

end

