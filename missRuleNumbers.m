function [ listOfNumbers ] = missRuleNumbers( hitNumbers, numberOfPartitions )
%get rules number that have not been appeared
listOfNumbers = zeros(1,numberOfPartitions);
for i = 1:numberOfPartitions
    if(ismember(i,hitNumbers) == 0)
        listOfNumbers(i) = i;       
    end
end
    listOfNumbers = sort(nonzeros(listOfNumbers)');
end

