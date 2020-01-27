%%
close all;
clear all;
clc;

%% 
Data=load('Dataset.csv');

%%
row_idx = randperm(768, 450)';                                
Train_Idx = logical(zeros(size(Data,1),1));                 
Train_Idx(row_idx) = true;                                 
Test_Idx = ~Train_Idx;                                      
Train_Data = Data(Train_Idx,:);
Test_Data = Data(Test_Idx,:);

%%
for i=1:450
    for j=1:9
        if j<9
            train(i,j)=Train_Data(i,j);
            if i<319
                test(i,j)=Test_Data(i,j);
            end
        else
            trainLabel(i,1)=Train_Data(i,j);
            if i<319
                testLabel(i,1)=Test_Data(i,j);
            end
        end
    end
end

%%
%save('train.mat');
%save('test.mat');
%save('trainLabel.mat');
%save('testLabel.mat');

%%
load('train.mat');
load('test.mat');
load('trainLabel.mat');
load('testLabel.mat');
Model=fitcsvm(train,trainLabel);
%save('Model.mat');

%%
load('Model.mat');
P=predict(Model,test);

%%
confMat=confusionmat(testLabel,P);
%save('confMat.mat');

%%
acc