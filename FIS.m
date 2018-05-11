function y = FIS( rules, inputMFs, outputMFs, x )
%compute output using fuzzy infrence system
numerator = 0;
denominator = 0;

for i=1:size(rules,1)
   w = getFireRule(inputMFs,rules(i,1),x); 
   yBar = outputMFs(rules(i,2),2);
   numerator = numerator + w*yBar;
   denominator = denominator + w;
end

y = numerator/denominator;

end

