function rules = deleteSameRules(rules)
%   we want just one rule in same rules that have been fiered maximum
i = 1;
while i <= size(rules,1)-1
    j = i+1;
    while j <= size(rules,1)
        if  rules(i,1) == rules(j,1)
            if (rules(i,3) > rules(j,3))
                
                index = j;
            else % second is maximum
                %swap
                atemp = rules(i,1);
                btemp = rules(i,2);
                rules(i,1) = rules(j,1);
                rules(i,2) = rules(j,2);
                rules(j,1) = atemp;
                rules(j,2) = btemp;
                
                index = j;
            end
            rules = removerows(rules,'ind',index);
            j = j-1;
        end
        j = j+1;
    end
    i = i+1;
end
end

