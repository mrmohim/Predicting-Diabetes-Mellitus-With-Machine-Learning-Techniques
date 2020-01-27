load('confMat.mat');

TP=confMat(1,1);
FP=confMat(1,2);
FN=confMat(2,1);
TN=confMat(2,2);

Recall=TP/(TP+FN);
fprintf('Recall = %f\n',Recall*100);

TNR=TN/(TN+FP);
fprintf('True Negetive Rate = %f\n',TNR*100);

Precision=TP/(TP+FP);
fprintf('Precision = %f\n',Precision*100);

Accuracy=(TP+TN)/(TP+TN+FP+FN);
fprintf('Accuracy = %f',Accuracy*100);