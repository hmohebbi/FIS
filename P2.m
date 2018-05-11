%set Parameters:
numberOfDataTrain = 50;
numberOfDataTest = 50;
numberOfInputPartitions = 10;
numberOfOutputPartitions = 10;
firstIn = 0;
endIn = pi;
firstOut = -pi;
endOut = pi;
%
%plot g(t) here
tIn = firstIn:0.01:endIn;
tOut = firstOut:0.01:endOut;
actualF = tIn.*sin(4*tIn);
plot(tIn,actualF);
title('tsin(4t)');

%rng(2);
tTrain = firstIn + (rand(1,numberOfDataTrain)*(endIn-firstIn));
fTrain = tTrain.*sin(4*tTrain);

inputMFs = getTriPartitions(numberOfInputPartitions,firstIn,endIn);

figure;
hold on;
for i=1:numberOfInputPartitions
    plot(tIn,trimf(tIn,inputMFs(i,:)));
    title('Input Partitions');
end
hold off;

outputMFs = getTriPartitions(numberOfOutputPartitions,firstOut,endOut);
figure;
hold on;
for i=1:numberOfOutputPartitions
    plot(tOut,trimf(tOut,outputMFs(i,:)));
    title('Output Partitions');
end
hold off;

allRules = getAllRules(inputMFs, outputMFs,tTrain, fTrain);
rules = deleteSameRules(allRules);

figure;
hold on;
for i=1:size(rules,1)
    plot(tIn,trimf(tIn,inputMFs(rules(i,1),:)));
    title('Input Partitions rules');
end
hold off;

figure;
hold on;
for i=1:size(rules,1)
    plot(tOut,trimf(tOut,outputMFs(rules(i,2),:)));
    title('Output Partitions rules');
end
hold off;

coveredInputMFs = covering( rules(:,1)', inputMFs, numberOfInputPartitions );
coveredOutputMFs = covering( rules(:,2)', outputMFs, numberOfOutputPartitions );

figure;
hold on;
for i=1:size(rules,1)
    plot(tIn,trimf(tIn,coveredInputMFs(rules(i,1),:)));
    title('Input Partitions covered rules');
end
hold off;

figure;
hold on;
for i=1:size(rules,1)
    plot(tOut,trimf(tOut,coveredOutputMFs(rules(i,2),:)));
    title('Output Partitions covered rules');
end
hold off;

fEstimated = zeros(size(tTrain));
for i=1:size(tTrain,2)
    fEstimated(i) = FIS( rules, inputMFs, outputMFs, tTrain(i) );
end

figure;
plot(tIn,actualF);
title('compare estimate and actual');
hold on
for i=1:size(tTrain,2)
    plot(tTrain(i),fEstimated(i),'r*')
end
hold off;

% compute mean squared error
F = tTrain.*sin(4*tTrain);
err = immse(fEstimated,F)

% generate new data for test
tTest = firstIn + (rand(1,numberOfDataTest)*(endIn-firstIn));
fEstimated = zeros(size(tTest));
for i=1:size(tTest,2)
    fEstimated(i) = FIS( rules, inputMFs, outputMFs, tTest(i) );
end

F = tTest.*sin(4*tTest);

figure;
plot(tIn,actualF);
title('compare new test estimate and actual');
hold on
for i=1:size(tTest,2)
    plot(tTest(i),fEstimated(i),'r*')
end
hold off;

err = immse(fEstimated,F)